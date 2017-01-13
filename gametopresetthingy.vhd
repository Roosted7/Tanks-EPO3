signal beginreset, ereset: std_logic;

process(reset, clk)
begin
	if(rising_edge(clk)) then
		if(beginreset = '0') then
			if(ereset = '0') then
				ereset <= '1';
			else
				ereset <= '0';
				beginreset <= '1';
			end if;
		else
			ereset <= reset;
		end if;
	end if;
end process;