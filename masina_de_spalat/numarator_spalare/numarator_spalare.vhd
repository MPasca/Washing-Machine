--Semnalul SP activeaza numaratorul care numara timp de 20 de minute in timpul spalarii
--dupa cele 20 de minute,se activeaza semnalul SfP
--impulsul de tact este de 1 minut
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity numarator_spalare is
	port(SP,clk:in std_logic;
	SfP:out std_logic:='0');
end entity;

architecture spalare of numarator_spalare is
begin
	process(clk,SP)
	variable q:std_logic_vector(4 downto 0):="00000";
	begin
		if(SP='1') then
			if(clk'event and clk='0') then
				q:=q+1;
				if(q="10100") then
					SfP<='1';	
				elsif(q="10101") then
					q:="00000";
					SfP<='0';
				end if;	
			end if;
		else
			SfP<='0';
		end if;	
	end process;	
end architecture;