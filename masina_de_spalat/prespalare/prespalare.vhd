--aceasta componenta verifica daca este selectata prespalarea
--daca semnalul Manual este 1, este selectat modul manual si utlizatorul alege daca se face prespalare sau nu
--daca semnalul PRE este '1' utilizatorul a ales sa se faca si prespalare,iar daca este 0,se sare peste aceasta etape
--daca semnalul Manual este 0, utiliatorul a ales unul dintre modurile automate,iar semnalul PRE_ROM
--ne spune daca vom avea prespalare sau nu. Semnalul vine din memoria pentru program
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prespalare is
	port(	POW, clk : in STD_LOGIC;
			PRE_ROM, PRE : in STD_LOGIC;
			Manual : in STD_LOGIC;
			PRE_Sel : out STD_LOGIC);
end prespalare;

architecture presp of prespalare is
begin	
	process(clk, POW)
	begin 
		if POW = '1' then
			if clk = '1' and clk'event then
				if Manual = '1' then
					PRE_Sel <= PRE;
				else
					PRE_Sel <= PRE_ROM;
				end if;
			 end if;
		end if;	
	end process;
end architecture ;