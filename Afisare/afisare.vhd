library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity afis is
	port(secunde_unit: in STD_LOGIC_VECTOR(3 downto 0);
		secunde_zeci: in STD_LOGIC_VECTOR(3 downto 0);	
		minute_unit: in STD_LOGIC_VECTOR(3 downto 0);
		minute_zeci: in STD_LOGIC_VECTOR(3 downto 0);
		clk: in STD_LOGIC;
		clr: in STD_LOGIC;
		display: out STD_LOGIC_VECTOR(6 downto 0);
		anod: out STD_LOGIC_VECTOR(3 downto 0));
end entity;

architecture afisor of afis is
	signal sel: STD_LOGIC_VECTOR(1 downto 0);		-- selectie
	signal digit: STD_LOGIC_VECTOR(3 downto 0);		-- valoarea afisorului
	signal clk_div: STD_LOGIC_VECTOR(18 downto 0);	-- divizor de clock
begin
	sel <= clk_div(18 downto 17);	-- Selectia
	
	process(sel, secunde_unit, secunde_zeci, minute_unit, minute_zeci)
	begin
		case sel is
			when "00" => digit <= secunde_unit;
			when "01" => digit <= secunde_zeci;
			when "10" => digit <= minute_unit;
			when others => digit <= minute_zeci;
		end case;
	end process;
	
	process(digit)
	begin
		case digit is
			when "0000" => display  <= "0111111";  -- 0
			when "0001" => display  <= "0000111";  -- 1
			when "0010" => display  <= "1011011";  -- 2
			when "0011" => display  <= "1001111";  -- 3
			when "0100" => display  <= "1100110";  -- 4 
			when "0101" => display  <= "1101101";  -- 5
			when "0110" => display  <= "1111101";  -- 6
			when "0111" => display  <= "0000111";  -- 7
			when "1000" => display  <= "1111111";  -- 8
			when "1001" => display  <= "1101111";  -- 9
			when others => display  <= "0000000"; 
		end case;
	end process;
	
	process(sel, clr)
	begin
		anod <= "0000";
		if clr = '1' then
			anod(conv_integer(sel)) <= '1';
		end if;
	end process;
	
	process(clk, clr)
	begin
		if clr = '0' then
			clk_div <= (others => '0');
		elsif clk'event and clk = '1' then
			clk_div <= clk_div + 1;
		end if;
	end process;
	
end afisor;