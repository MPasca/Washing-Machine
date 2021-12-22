--memoria primeste ca si intrati un vector pe doi biti,temp,unde este stocata temperatura programului,
--semnalul prespalare este '1' daca este selectata prespalarea,'0' daca nu este selectata. la fel si pentru semnalul clatire_suplimentara
--in functie de aceste informatii se calculeaza timpul programului
--in vectorul timp este stocata durata programului. primii 4 biti din stanga reprezinta cifra zecilor a minutelor,
--urmatoarii 4 biti,cifra unitatilor a minutelor,urmatorii 4 cifra zecilor a secundelor,iar ultimii 4 cifra unitatilor a secundelor
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity memorie_timp is
	port(POW : in STD_LOGIC; 
		clk : in STD_LOGIC;
		temp : in STD_LOGIC_VECTOR(1 downto 0);
		prespalare : in STD_LOGIC;
		clatire_suplimentara : in STD_LOGIC;
		timp : out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture memorie_timp of memorie_timp is
signal intrari:STD_LOGIC_VECTOR(3 downto 0);
begin
	intrari(3 downto 2) <= temp(1 downto 0);
	intrari(1) <= prespalare;
	intrari(0) <= clatire_suplimentara;
	process(clk, POW)
	begin
		if(POW = '1') then
			--if clk'event and clk = '1' then
				case intrari is		
					when "0000"=>timp<="0100000100110000"; -- 41min,30sec
					when "0001"=>timp<="0101000100110000"; -- 51min,30sec
					when "0010"=>timp<="0101001000000000"; -- 52min  
					when "0011"=>timp<="0110001000000000"; -- 62min
					when "0100"=>timp<="0100001000100000"; -- 42min,20sec
					when "0101"=>timp<="0101001000100000"; -- 52min,20sec
					when "0110"=>timp<="0101001101000000"; -- 53min,40sec
					when "0111"=>timp<="0110001101000000"; -- 63min,40sec
					when "1000"=>timp<="0100001100000000"; -- 43min
					when "1001"=>timp<="0101001100000000"; -- 53min
					when "1010"=>timp<="0101010100000000"; -- 55min
					when "1011"=>timp<="0110010100000000"; -- 65min
					when "1100"=>timp<="0100010000000000"; -- 44min
					when "1101"=>timp<="0101010000000000"; -- 54min
					when "1110"=>timp<="0101011100000000"; -- 57min
					when "1111"=>timp<="0110011100000000"; -- 67min  
					when others=>timp<="ZZZZZZZZZZZZZZZZ";
				end case;
			--end if;
		end if;
	end process;
end architecture;