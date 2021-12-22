--aceasta memorie ne ajuta pentru a afisa viteza
--daca modul manual este selectat inseamna ca utilizatorul alege viteza,semnalul "vit",altfel
--viteza se afla in semnalul "vit_mem" care vine din memoria pentru program
--vectorul "viteza" este iesirea memoriei
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity memorie_viteza is
	port(POW,clk : in STD_LOGIC;
		Manual : in STD_LOGIC;
		viteza : out STD_LOGIC_VECTOR(2 downto 0);
		vit_mem : in STD_LOGIC_VECTOR(1 downto 0);
		vit : in STD_LOGIC_VECTOR(1 downto 0));
end memorie_viteza;

architecture memorie_viteza of memorie_viteza is
signal vit_sel : STD_LOGIC_VECTOR(1 downto 0);
begin 
	process(POW, clk)
	begin
		if clk'event and clk = '1' then
			if(POW = '1') then
				if Manual = '1' then	 			
					vit_sel <= vit;		  -- daca modul selectat este manual ia valoarea introdusa de utilizator
				else
					vit_sel <= vit_mem;
				end if;
				
				case vit_sel is
					when "00" => viteza <= "001"; 	-- 800 rot/min
					when "01" => viteza <= "010"; 	-- 1000 rot/min
					when "10" => viteza <= "100"; 	-- 1200 rot/min
					when others => -- 
				end case;
			end if;	
		end if;
	end process;
end architecture;	