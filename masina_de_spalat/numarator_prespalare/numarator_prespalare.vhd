--numaratorul este activat de semnalul SPRE si functioneaza timp de 10 minute,cat timp are loc prespalarea
--la sfarsitul prespalarii se activeaza semnalul SfPRE
--impulsul de tact este de 1 minut
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity numarator_prespalare is
	port(SPRE,clk:in std_logic;
	SfPRE:out std_logic:='0');
end entity;

architecture prespalare of numarator_prespalare is
begin
	process(clk,SPRE)
	variable q:std_logic_vector(3 downto 0):="0000";
	begin
		if(SPRE='1') then
			if(clk'event and clk='0') then
				q:=q+1;
				if(q="1010") then
					SfPRE<='1';	
				elsif(q="1011") then
					q:="0000";
					SfPRE<='0';
				end if;	
			end if;
		else
			SfPRE<='0';
		end if;	
	end process;	
end architecture;