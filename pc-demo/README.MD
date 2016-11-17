Het spel is geschreven in Python 2.7 met de "game" library pygame 1.9.1
In deze map zit alleen de source van het programma. 
Om het daadwerkelijke programma te draaien:
* Installeer python 2.7.12. Dit doe je op https://www.python.org/downloads/. Let hierbij op dat je **NIET** versie 3.5.2 installeert. Dan zal het namelijk niet werken.
* Installeer de pygame library. Voor windows is dit vrij eenvoudig, via http://www.pygame.org/download.shtml installeer je de bovenste onder het kopje "Windows", namelijk: "pygame-1.9.1.win32-py2.7.msi". Stel je gebruikt iets anders, dan moet je het maar zelf uitzoeken.
Als je dit allemaal hebt geinstalleerd, download dan gewoon de bestanden en click op het bestand "main.py". Als het niet lukt kan je het natuurlijk ook gewoon vragen.

Stel je hebt het programma werkend gekregen, dan is het mogelijk om een aantal van de parameters aan te passen. Hieronder een beknopt lijstje met wat wat is:
* GAMESIZE: afmeting van het speelveld. Standaard is dat bij ons 16x16!
* TILESIZE: pas dit alleen aan als je schermpje te groot wordt. Het is het formaat van de individuele pixels die gebruikt worden om het speelveld van GAMESIZE te tekenen. Elk vakje op het speelveld heeft een grote "TILESIZE", dus.
* PLAYER_RATE: De speelfrequentie
* PLAYER_BULLET_MAX: Aantal kogels per speler

Het is mogelijk om het spel opnieuw te starten door op "r" te drukken. Dan hoef je hem niet telkens opnieuw op te starten als er iemand dood is. 
