--aceasta componenta verifica daca este selectata clatirea suplimentara
--daca semnalul Manual este 1, este selectat modul manual si utlizatorul alege daca se face clatirea suplimentara sau nu
--daca semnalul Clat este '1' utilizatorul a ales sa se faca si clatirea suplimentara,iar daca este 0,se sare peste aceasta etape
--daca semnalul Manual este 0, utiliatorul a ales unul dintre modurile automate,iar semnalul ClatROM
--ne spune daca vom avea clatire suplimentara sau nu. Semnalul vine din memoria pentru program
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clatireSup is
	port(	POW, clk : in STD_LOGIC;
			ClatROM, Clat : in STD_LOGIC;
			Manual : in STD_LOGIC;
			ClatSel : out STD_LOGIC);
end clatireSup;

architecture clat_sup of clatireSup is
begin
	process(POW, clk)
	begin
		if POW = '1' then
			if clk = '1' and clk'event then
				if Manual = '1' then
					ClatSel <= Clat;
				else
					ClatSel <= ClatROM;
				end if;
			end if;
		end if;
	end process;
end architecture;
