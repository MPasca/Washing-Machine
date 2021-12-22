--semnalul SC activeaza numaratorul,care numara timp de 10 minute
--cand se termina centrifugarea semnalul SfC este activat,la fel si semnalul de reset
--impulsul de tact este de un minut
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity numarator_centrifugare is
	port(SC,clk:in std_logic;
	SfC:out std_logic:='0');
end entity;

architecture centrifugare of numarator_centrifugare is
begin
	process(SC,clk)
	variable q:std_logic_vector(3 downto 0):="0000";
	begin
		if(SC='1') then
			if(clk'event and clk='0') then
				q:=q+1;
				if(q="1010") then
					SfC<='1';	
				elsif(q="1011") then
					q:="0000";
					SfC<='0';
				end if;	
			end if;
		else
			SfC<='0';
		end if;	
	end process;
end architecture;	