 --clk   reprezinta TACTUL de intrare cu frecventa de 50MHz
 --clk_div reprezinta TACTUL de iesire cu frecventa de 1Hz
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
 entity divizor is
	port(clk:in STD_LOGIC; clk_div:out STD_LOGIC);         
end entity;

architecture divizor of divizor is
begin
	process(clk)
	variable x:integer:=0;
	variable y:STD_LOGIC:='0';
	begin
	 if clk='1' and clk'event then
	  x:=x+1;
	   if x=25000000 and y='0' then
		   y:='1'; x:=0;
	   elsif x=25000000 and y='1' then
		   y:='0'; x:=0;
	   end if;
	 end if;
	 clk_div<=y;
	end process;	
end architecture;	