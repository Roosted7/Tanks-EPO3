import sys, pygame, time, math, random
""" Constants 
"""
GAMESIZE = (16, 16) # (x,y) Size of actual playing fied
TILESIZE = (30, 30) # (x,y) Size of individual tiles
PLAYER_RATE = 16 # Amount of actions per second
PLAYER_BULLET_MAX = 1 # Max amount of bullets per player 
BULLET_RATE = 2 * PLAYER_RATE # Speed of the bullets
WINDOWSIZE = (GAMESIZE[0]*TILESIZE[0], GAMESIZE[1]*TILESIZE[1]) # Size of required window
PLAYERS = 2 # dont change this as of now...
""" Utility
"""
WHITE = (255,255,255)
BLACK = (0,0,0)
RED = (255,0,0)
GREEN = (0,255,0) 
BLUE = (0,0,255)
""" Pygame
"""
pygame.init() # import pygame modules
screen = pygame.display.set_mode((WINDOWSIZE[0],WINDOWSIZE[1])) # iniate main screen
pygame.display.set_caption("TA1NKS")
screen_rect = screen.get_rect()
clock = pygame.time.Clock() # pygame timing
random.seed() # Needed for some random stuff
courier = pygame.font.SysFont("courier", 12)
""" Classes
"""
class compass:
    def __init__(self, Direction):
        if(Direction == "NORTH"):
            self.orientation = (0,-1) 
            self.angle = 0
        elif(Direction == "EAST"):
            self.orientation = (1,0) 
            self.angle = 90
        elif(Direction == "SOUTH"):
            self.orientation = (0,1) 
            self.angle = 180
        elif(Direction == "WEST"):
            self.orientation = (-1,0) 
            self.angle = 270

class player(pygame.sprite.Sprite):
    def __init__(self, Color, playerCompass, Spawn): # Call constructor
        super(player, self).__init__() # Call constructor of higher-level class
        self.image =  pygame.Surface((3*TILESIZE[0], 3*TILESIZE[1]), pygame.SRCALPHA, 32) # Generate 3x3 surface to draw on with alpha on
        self.color = Color # save specified color
        self.compass = playerCompass # (x,y) unit vector in movement direction
        self.bulletList = pygame.sprite.Group()
        pygame.draw.rect(self.image, self.color, pygame.Rect(1*TILESIZE[0], 0, 1*TILESIZE[0], 2*TILESIZE[1])) # Draw tank
        pygame.draw.rect(self.image, self.color, pygame.Rect(0, 1*TILESIZE[1], 1*TILESIZE[0], 2*TILESIZE[1])) # Draw tank
        pygame.draw.rect(self.image, self.color, pygame.Rect(2*TILESIZE[0], 1*TILESIZE[1], 1*TILESIZE[0], 2*TILESIZE[1])) # Draw tank
        self.rect = self.image.get_rect() # Get tank rect
        self.rect.x = Spawn[0]*TILESIZE[0] # Define spawnpoints
        self.rect.y = Spawn[1]*TILESIZE[1]
        self.image = pygame.transform.rotate(self.image, -1*self.compass.angle) # do initial rotation
    def rotate(self, movementCompass):
        rotationAngle = movementCompass.angle - self.compass.angle # relatieve draaing
        self.compass = movementCompass
        self.image = pygame.transform.rotate(self.image, -1*rotationAngle)
    def move(self, movementCompass):
        if movementCompass.angle != self.compass.angle: 
            self.rotate(movementCompass)
        else:
            dx = self.compass.orientation[0]*TILESIZE[0]
            dy = self.compass.orientation[1]*TILESIZE[1]
            self.rect.x += dx
            self.rect.y += dy
            collision = False
            for w in wallList:
                if(self.rect.colliderect(w.rect)):
                    collision = True
                    break
            for p in playerList: 
                if p != self:
                    if(self.rect.colliderect(p.rect)):
                        collision = True
            if collision:
                self.rect.x -= dx
                self.rect.y -= dy
            self.rect.clamp_ip(screen_rect) # Boundary checking
    def shoot(self): 
        if(len(self.bulletList.sprites()) < PLAYER_BULLET_MAX): 
            bullet(self.compass, self).add(self.bulletList)

            
class wall(pygame.sprite.Sprite):
    def __init__(self, Spawn):
        super(wall, self).__init__() # Call constructor of higher-level class
        self.image =  pygame.Surface((TILESIZE[0], TILESIZE[1])) # Generate 3x3 surface to draw on with alpha on
        self.image.fill(BLACK)
        self.rect = self.image.get_rect()
        self.rect.x = Spawn[0]*TILESIZE[0] # Define spawnpoints
        self.rect.y = Spawn[1]*TILESIZE[1]

class bullet(pygame.sprite.Sprite):
    def __init__(self, bulletCompass, Owner):
        super(bullet, self).__init__() # Call constructor of higher-level class
        self.image =  pygame.Surface((TILESIZE[0], TILESIZE[1])) 
        self.image.fill(BLACK)
        self.owner = Owner # Schieter van kogel!
        self.compass = bulletCompass
        self.rect = self.image.get_rect()
        self.rect.x = Owner.rect.x + TILESIZE[0] + 1*TILESIZE[0]*self.compass.orientation[0]
        self.rect.y = Owner.rect.y + TILESIZE[1] + 1*TILESIZE[1]*self.compass.orientation[1]
    def update(self):
        dx = self.compass.orientation[0]*TILESIZE[0]
        dy = self.compass.orientation[1]*TILESIZE[1]
        self.rect.x += dx
        self.rect.y += dy
        playerListDuplicate = playerList.copy()
        playerListDuplicate.remove(self.owner)
        for p in playerListDuplicate: 
            if(self.rect.colliderect(p.rect)):
                pygame.sprite.Sprite.kill(p)
                pygame.sprite.Sprite.kill(self)
            for b in p.bulletList.sprites():
                if(self.rect.colliderect(b.rect)): 
                    pygame.sprite.Sprite.kill(self)
                    pygame.sprite.Sprite.kill(b)        
        for w in wallList:
            if(self.rect.colliderect(w.rect)):
                pygame.sprite.Sprite.kill(self)
                break

        # onzin voor het titlescherm ;D
        menuListDuplicate = menuList.copy()
        menuListDuplicate.remove(self.owner)
        for p in menuListDuplicate: 
            if(self.rect.colliderect(p.rect)):
                pygame.sprite.Sprite.kill(p)
                pygame.sprite.Sprite.kill(self)
            for b in p.bulletList.sprites():
                if(self.rect.colliderect(b.rect)): 
                    pygame.sprite.Sprite.kill(self)
                    pygame.sprite.Sprite.kill(b)        
       # 

        if not screen_rect.contains(self.rect):
            pygame.sprite.Sprite.kill(self)

""" ICON
"""
pygame.display.set_icon(pygame.transform.scale(player((random.randint(0, 255),random.randint(0, 255),random.randint(0, 255)), compass("NORTH"), (0,0)).image, (32,32)))

""" Opening menu loop
"""
done = 0
font1 = pygame.font.Font("resources/PressStart2P.ttf",14)
font2 = pygame.font.Font("resources/PressStart2P.ttf",24)
font3 = pygame.font.Font("resources/PressStart2P.ttf",12)
playText = font1.render("PRESS [SPACE] TO PLAY", 16, BLACK)
menuText = font2.render("TA1NKS", 0, BLACK)
orientationList = (compass("NORTH"), compass("EAST"), compass("SOUTH"), compass("WEST")) # List all possible directions
wallList = pygame.sprite.Group() # Empty. needed.
playerList =  pygame.sprite.Group() # Keeping empty for menu logic
menuList = pygame.sprite.Group()
for i in range(0, 500): # player generation
    randomColor = (random.randint(0, 255),random.randint(0, 255),random.randint(0, 255)) # Choose very fancy color
    randomOrientation = orientationList[random.randint(0,3)] # Choose random direction
    player(randomColor, randomOrientation, (random.randint(0, GAMESIZE[0]),random.randint(0, GAMESIZE[1]))).add(menuList)
    #menuList.sprites()[i].rect.x = random.randint(0, WINDOWSIZE[0])
    #menuList.sprites()[i].rect.y = random.randint(0, WINDOWSIZE[1])
moveTick=True
while not done:
    clock.tick(60)
    for event in pygame.event.get(): # event handler
        if event.type == pygame.QUIT: # makes close button work
            pygame.quit()
            sys.exit()
        if(event.type == pygame.KEYDOWN): # Lengthy user input code
            if (event.key == pygame.K_SPACE):
                done = 1
    
    screen.fill(WHITE)
    if(moveTick): 
        for p in menuList:
            p.move(p.compass)
            if(random.randint(0, 4) == 4 or (p.rect.x == 0 and p.compass == orientationList[3] ) or (p.rect.x > WINDOWSIZE[0] - 3*TILESIZE[0] - 1  and p.compass == orientationList[1]) or (p.rect.y == 0  and p.compass == orientationList[0]) or (p.rect.y > WINDOWSIZE[1] - 1 - 3*TILESIZE[1] and p.compass == orientationList[2])): 
                p.move(orientationList[random.randint(0,3)])
    moveTick = not moveTick 
    menuList.draw(screen)
    screen.blit(menuText, (WINDOWSIZE[0]/2 - menuText.get_width()/2, TILESIZE[1]))
    screen.blit(playText, (WINDOWSIZE[0]/2 - playText.get_width()/2, TILESIZE[1]*(GAMESIZE[1] - 1) -  playText.get_height()))
    for p in menuList:
        p.bulletList.draw(screen)
    for p in menuList:
        p.bulletList.update()
    for p in menuList:
        rando = random.randint(0, 30)
        if(not rando):
            random.seed()
            p.shoot()

    fpsText = font3.render(str(clock.get_fps()), 16, BLACK)
    screen.blit(fpsText, (WINDOWSIZE[0] - fpsText.get_width(),0))
    pygame.display.flip()   

menuList.empty() # zorg dat het niet voor problemen zorgt


""" Player Generation 
"""
while 1:
    playerList = pygame.sprite.Group() # List with all players
    spawnList = [(0,0),(9,9)] # List possible spawn-points
    orientationList = (compass("NORTH"), compass("EAST"), compass("SOUTH"), compass("WEST")) # List all possible directions
    for i in range(0, PLAYERS): # player generation
        randomColor = (random.randint(0, 255),random.randint(0, 255),random.randint(0, 255)) # Choose very fancy color
        randomOrientation = orientationList[random.randint(0,3)] # Choose random direction
        player(randomColor, randomOrientation, spawnList[i]).add(playerList) # Add to the list of all the players
    """ Wall Generation
    """
    wallList = pygame.sprite.Group() # List with all walls
    Walls = [(3,3),(3,4),(3,5),(4,3),(5,3),(10,3),(11,3),(12,3),(12,4),(12,5),(3,10),(3,11),(3,12),(4,12),(5,12),(10,12),(11,12),(12,12),(12,11),(12,10),(7,7),(7,8),(8,7),(8,8)] # Long list with the map, too lazy to write generating code
    for w in range(0, len(Walls)): # for all walls...
        wall(Walls[w]).add(wallList) # add to the list!


    """ Game loop
    """
    moveTick = True
    moved1 = False
    shot1 = False
    Player1Sprite = playerList.sprites()[0]
    Player2Sprite = playerList.sprites()[1]
    done = False
    while done == False:
        clock.tick(BULLET_RATE)
        for event in pygame.event.get(): # event handler
            if event.type == pygame.QUIT: # makes close button work
                pygame.quit()
                sys.exit()
            if (moveTick == True):
                if(event.type == pygame.KEYDOWN and playerList.has(Player1Sprite)): # Lengthy user input code
                    if (event.key == pygame.K_r): done = True
                    if (event.key == pygame.K_LEFT and moved1 == False): 
                        Player1Sprite.move(compass("WEST"))
                        moved1 = True
                    elif (event.key == pygame.K_RIGHT and moved1 == False):
                        Player1Sprite.move(compass("EAST"))
                        moved1 = True
                    elif (event.key == pygame.K_UP and moved1 == False):
                        Player1Sprite.move(compass("NORTH"))
                        moved1 = True
                    elif (event.key == pygame.K_DOWN and moved1 == False):
                        Player1Sprite.move(compass("SOUTH"))
                        moved1 = True
                    elif (event.key == pygame.K_RSHIFT and shot1 == False):
                        Player1Sprite.shoot() 
                        shot1 = True
                if(event.type == pygame.KEYDOWN and playerList.has(Player2Sprite)): # Lengthy user input code
                    if (event.key == pygame.K_r): done = True
                    if (event.key == pygame.K_a and moved2 == False): 
                        Player2Sprite.move(compass("WEST"))
                        moved2 = True
                    elif (event.key == pygame.K_d and moved2 == False):
                        Player2Sprite.move(compass("EAST"))
                        moved2 = True
                    elif (event.key == pygame.K_w and moved2 == False):
                        Player2Sprite.move(compass("NORTH"))
                        moved2 = True
                    elif (event.key == pygame.K_s and moved2 == False):
                        Player2Sprite.move(compass("SOUTH"))
                        moved2 = True
                    elif (event.key == pygame.K_SPACE and shot2 == False):
                        Player2Sprite.shoot() 
                        shot2 = True
            else:
                if(event.type == pygame.KEYDOWN):
                    pygame.event.post(event)
        moveTick = not moveTick 
        moved1 = False 
        moved2 = False
        shot1 = False
        shot2 = False
        screen.fill(WHITE)
        playerList.draw(screen)
        wallList.draw(screen)
        for p in playerList:
            p.bulletList.draw(screen)
        for p in playerList:
            p.bulletList.update()

        fpsText = font3.render(str(int(clock.get_fps())), 16, BLACK)
        screen.blit(fpsText, (WINDOWSIZE[0] - fpsText.get_width(),0))
        pygame.display.flip()


