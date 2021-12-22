--folosim acest numarator pentru a genera un impuls de tact de 1 minut dintr-unul de o secunda
--intrarea "enable" porneste numaratorul
--semnalul "minut" variable este noul impuls de tact. pentru 30 de secunde semnalul este '1' iar pentru urmatoarele 30,'0'
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity num_minute is	
	port( enable : in STD_LOGIC;
	clk : in STD_LOGIC;
	minut : out STD_LOGIC :='0');
end num_minute;

architecture num_min of num_minute is
begin
	process(clk,enable)	
	variable a:bit:='0';
	variable Q :STD_LOGIC_VECTOR(4 downto 0):="00000";
	begin 
	if(enable='1') then
		if(Q="11110") then
			Q:="00000";
			if(a='0') then
				a:='1';
			else
				a:='0';
		   end if;
		elsif(clk'event and clk='1') then
			Q:=Q+1;
		end if;
		minut<=to_stdulogic(a);
	else
		minut<='0';	 
		Q:="00000";
	end if;
	
	end process;
end architecture;	