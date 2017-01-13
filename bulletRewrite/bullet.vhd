library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bullet is
  port(
    clk:      in  std_logic;                      -- clk
    bclk:     in  std_logic;                      -- bullet clock from vga
    reset:    in  std_logic;                      -- reset

    fire:     in  std_logic_vector(2 downto 0);   -- fire button pressed
    e_tank:   in  std_logic;                      -- end of tank
    
    x_tank:   in  std_logic_vector(3 downto 0);   -- x of tank
    y_tank:   in  std_logic_vector(3 downto 0);   -- y of tank
    d_tank:   in  std_logic_vector(1 downto 0);   -- direction of tank
    e_bull:   in  std_logic;                      -- end of bullet

    x_vga:    in  std_logic_vector(3 downto 0);   -- x of current vga
    y_vga:    in  std_logic_vector(3 downto 0);   -- y of current vga
    draw:     out std_logic;                     -- draw bullet at these xy
    test_x:   out std_logic_vector(3 downto 0);
    test_y:   out std_logic_vector(3 downto 0));
end bullet;

architecture arch of bullet is

component bclk is
port(
    clk:      in  std_logic;
    vbullet:  in  std_logic;
    reset:    in  std_logic;
    bclk:     out std_logic);
end component;

component bullet_generator is
port(
    clk:      in  std_logic;
    bclk:     in  std_logic;
    fire:     in  std_logic_vector(2 downto 0);   -- fire button pressed
    e_bull:   in  std_logic;                      -- there is already a bullet
    
    x_tank:   in  std_logic_vector(3 downto 0);   -- x of tank
    y_tank:   in  std_logic_vector(3 downto 0);   -- y of tank
    d_tank:   in  std_logic_vector(1 downto 0);   -- direction of tank

    x_bull:   out std_logic_vector(3 downto 0);   -- x of bullet
    y_bull:   out std_logic_vector(3 downto 0);   -- y of bullet
    d_bull:   out std_logic_vector(1 downto 0);   -- direction of bullet
    l_bull:   out std_logic);                     -- whether the bullet has died to a wall
end component;

component bullet_register is
port(
            new_pos_x : in std_logic_vector(3 downto 0);
            new_pos_y : in std_logic_vector(3 downto 0);
            new_rotation : in std_logic_vector(1 downto 0);
            new_active : in std_logic;
            clk : in std_logic;
            reset : in std_logic;
            pos_x : out std_logic_vector(3 downto 0);
            pos_y : out std_logic_vector(3 downto 0);
            rotation : out std_logic_vector(1 downto 0);
            active : out);
end component;

component bullet_updater is
port(
    clk:    in  std_logic;
    bclk:   in  std_logic;
    i_bull: in  std_logic_vector(10 downto 0);  -- bullet before the update
    o_bull: out std_logic_vector(10 downto 0)); -- bullet after the update
end component;

component bullet_control is
port(
        vga_x : in std_logic_vector(3 downto 0);
        vga_y : in std_logic_vector(3 downto 0);
        bullet_x : in std_logic_vector(3 downto 0);
        bullet_y : in std_logic_vector(3 downto 0);
        output : out std_logic);
end component;

signal bullet_clock_rising_edge, bullet_active, new_bullet_active : std_logic;
signal new_x_bullet, new_y_bullet, x_bullet, y_bullet : std_logic_vector(3 downto 0);
signal new_d_bullet, d_bullet : std_logic_vector(1 downto 0);
begin
test_x <= x_bullet;
test_y <= y_bullet;

tb : bclk port map(
                clk => clk,
                vbullet => bclk,
                reset => reset,
                bclk => bullet_clock_rising_edge);

bullet_gen : bullet_generator port map(
                clk => clk,
                fire => fire,
                e_bull => bullet_active,
                x_tank => x_tank,
                y_tank => y_tank,
                d_tank => d_tank,

                x_bull => new_x_bullet,
                y_bull => new_y_bullet,
                d_bull => new_d_bullet,
                l_bull => new_bullet_active);

bullet_upd : bullet_updater port map(
                clk => clk,
                bclk => bullet_clock_rising_edge,
                i_bull(10) => bullet_active,
                i_bull(9 downto 6) => x_bullet,
                i_bull(5 downto 2) => y_bullet,
                i_bull(1 downto 0) => d_bullet,
                o_bull(10) => new_bullet_active,
                o_bull(9 downto 6) => new_x_bullet,
                o_bull(5 downto 2) => new_y_bullet,
                o_bull(1 downto 0) => new_d_bullet);

bullet_reg : bullet_register port map(
                new_pos_x => new_x_bullet,
                new_pos_y => new_y_bullet,
                new_rotation => new_d_bullet,
                new_active => (e_bull and new_bullet_active),
                clk => clk,
                reset => reset,
                pos_x => x_bullet,
                pos_y => y_bullet,
                rotation => d_bullet,
                active => bullet_active);

bullet_out : bullet_control port map(
                vga_x => x_vga,
                vga_y => y_vga,
                bullet_x => x_bullet,
                bullet_y => y_bullet,
                output => draw);
end arch;