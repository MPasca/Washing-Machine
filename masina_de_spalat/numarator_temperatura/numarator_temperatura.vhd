--numaratorul este folosit pentru incalzirea apei
--numaratorul are ca si intrari un semnal de enable,iar vectorul TSel reprezinta valoarea temperaturii la
--care trebuie sa ajunga. 
--cand s-a terminat incalzirea semnalul ST este activ,la fel signal semnalul de reset,iar la urmatorul tact ambele revin pe '0'
--semnalul de tact este de o secunda
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity numarator_incalzire is
	port(enable:in STD_LOGIC;
	TSel:in STD_LOGIC_VECTOR(6 downto 0);
	clk:in STD_LOGIC;
	ST:out STD_LOGIC:='0');
end entity;

architecture incalzire of numarator_incalzire is
begin
	process(clk,enable)
	variable q:std_logic_vector(6 downto 0):="0000000";	
	begin
		if(enable='1') then
			if(clk'event and clk='1') then
				q:=q+1;
				if(q=Tsel) then
					ST<='1';
				elsif(q=TSel+1) then
					q:="0000000";
					ST<='0';
				end if;
			end if;		
		else
			ST<='0';
		end if;	
	
	end process;
end architecture;
		