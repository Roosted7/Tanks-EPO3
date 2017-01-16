library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of input_system is

component encoder is
	port(p_l 	  :in    std_logic;
        p_r	   :in    std_logic;
        p_u   	:in    std_logic;
        p_d	   :in    std_logic;
        p_f	   :in    std_logic;
        t_e    :out   std_logic_vector(2 downto 0));
end component;

component tf_rise is
	port(tf_in  :in    std_logic;
	reset  :in	   std_logic;
	clk    :in    std_logic;
        tf_rise:out   std_logic);
end component;

component input_register is
	port(input :in    std_logic_vector(2 downto 0);
        clk   :in    std_logic;
        reset :in    std_logic;
        output:out   std_logic_vector(2 downto 0));
end component;

component register_logic is
	port(enable:in		  std_logic_vector(1 downto 0);
	reg_in:in    std_logic_vector(2 downto 0);
        enc_in:in    std_logic_vector(2 downto 0);
        output:out   std_logic_vector(2 downto 0));
end component;

component input_fsm is
	port(tf_rise:in    std_logic;
        		clk    :in    std_logic;
        		reset  :in    std_logic;
        		dec_in :in    std_logic_vector(2 downto 0);
		counter:in	   std_logic_vector(2 downto 0);
        		enable :out   std_logic_vector(1 downto 0);
		counter_enable: out std_logic);
end component;

signal t_e_enc, t_e_logic, t_e_reg : std_logic_vector(2 downto 0);
signal enable : std_logic_vector(1 downto 0);
signal tf : std_logic;
begin
lbl1 : encoder port map(
		p_l => p_l,
		p_r => p_r,
		p_u => p_u,
		p_d => p_d,
		p_f => p_f,
		t_e => t_e_enc);
lbl2 : tf_rise port map(
		tf_in => frame,
		reset => reset,
		clk => clk,
		tf_rise => tf);
lbl3 : input_register port map(
		input => t_e_logic,
		clk => clk,
		reset => reset,
		output => t_e_reg);
lbl4 : register_logic port map(
		enable => enable,
		reg_in => t_e_reg,
		enc_in => t_e_enc,
		output => t_e_logic);
lbl5 : input_fsm port map(
		tf_rise => tf,
		clk => clk,
		reset => reset,
		dec_in => t_e_enc,
		counter => counter,
		enable => enable,
		counter_enable => counter_enable);

t_e <= t_e_reg;
end structural;





