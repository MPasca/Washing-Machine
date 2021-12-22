--numaratorul este activ cat timp masina clateste
--semnalul SCL activeaza numaratorul,care numara timp de 10 minute
--cand se termina clatirea semnalul SfCL esti actival,la fel si semnalul de reset
--impulsul de tact este de un minut
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity numarator_clatire is
	port(SCl,clk:in std_logic;
	SfCl:out std_logic:='0');
end entity;

architecture clatire of numarator_clatire is
begin
	process(clk,SCl)
	variable q:std_logic_vector(3 downto 0):="0000";
	begin
		if(SCl='1') then
			if(clk'event and clk='0') then
				q:=q+1;
				if(q="1010") then
					SfCl<='1';	
				elsif(q="1011") then
					q:="0000";
					SfCl<='0';
				end if;	
			end if;
		else
			SfCl<='0';
		end if;	
	end process;	
end architecture;