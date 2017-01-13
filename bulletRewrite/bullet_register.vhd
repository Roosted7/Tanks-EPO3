library ieee;
use ieee.std_logic_1164.all;

entity bullet_register is
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
end bullet_register; 

library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of register is

component register is
	port(
			input : in std_logic;
			clk : in std_logic;
			reset : in std_logic;
			output : out std_logic);
end component;

begin
pos_x_3 : register port map(
						input => new_pos_x(3),
						clk => clk,
						reset => reset,
						output => pos_x(3));
pos_x_2 : register port map(
						input => new_pos_x(2),
						clk => clk,
						reset => reset,
						output => pos_x(2));
pos_x_1 : register port map(
						input => new_pos_x(1),
						clk => clk,
						reset => reset,
						output => pos_x(1));
pos_x_0 : register port map(
						input => new_pos_x(0),
						clk => clk,
						reset => reset,
						output => pos_x(0));

pos_y_3 : register port map(
						input => new_pos_y(3),
						clk => clk,
						reset => reset,
						output => pos_y(3));
pos_y_2 : register port map(
						input => new_pos_y(2),
						clk => clk,
						reset => reset,
						output => pos_y(2));
pos_y_1 : register port map(
						input => new_pos_y(1),
						clk => clk,
						reset => reset,
						output => pos_y(1));
pos_y_0 : register port map(
						input => new_pos_y(0),
						clk => clk,
						reset => reset,
						output => pos_y(0));

rotation_1 : register port map(
						input => new_rotation(1),
						clk => clk,
						reset => reset,
						output => rotation(1));
rotation_0 : register port map(
						input => new_rotation(0),
						clk => clk,
						reset => reset,
						output => rotation(0));

bullet_active : register port map(
						input => new_active,
						clk => clk,
						reset => reset,
						output => active);
end structural;
