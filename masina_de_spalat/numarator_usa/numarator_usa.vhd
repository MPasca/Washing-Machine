--componenta este activa timp de 1 minut,cat timp utilizatorul nu poate deschide usa masinii,dupa incheierea programului
--semnalul FIN se activeaza signal utilizatorul poate deschide usa masinii
--impulsul de tact este de 1 minut
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;   

entity num_usa is	
	port( enable : in STD_LOGIC;
	clk : in STD_LOGIC;
	FIN : out STD_LOGIC:='0');
end num_usa;

architecture num_u of num_usa is
begin
	process(enable, clk) 
	variable q:std_logic:='0';
	begin
    	if(enable='1') then
			if(clk'event and clk='0') then
				if(q='0') then
					q:='1';
					FIN<='1';
				else
					q:='0';
					FIN<='0';
				end if;	
			end if;	
		else
			FIN<='0';
			q:='0';
		end if;
	end process;
end architecture;