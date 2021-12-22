--memoria primeste ca si intrare programul ales de catre utilizator
--pe iesiri vom avea temperatura,viteza,prespalarea si clatirea suplimentara pentru fiecare program
--in caz ca este ales modul manual,semnalul Manual este activ,sunt luate in considerare informatiile introduse de utilizator
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM_Program is
	port( Prog : in STD_LOGIC_VECTOR (2 downto 0); 			-- programul selectat de utilizator
	Enable : in STD_LOGIC; 						
	Manual : out STD_LOGIC := '0';							-- daca modul ales este cel manual, transmite 1 
	Temp : out STD_LOGIC_VECTOR (1 downto 0);				-- primii 2 biti de iesire reprezinta temperatura specifica programului de spalare
	Vit : out STD_LOGIC_VECTOR (1 downto 0);				-- urmatorii 2 biti de iesire reprezinta viteza de rotatie specifica programului de spalare
	Pre : out STD_LOGIC;									-- penultimul bit - daca este selectata sau nu prespalarea
	Cl : out STD_LOGIC;									   	-- ultimul bit - daca este selectata sau nu clatirea suplimentara
	clk : in STD_LOGIC);
end ROM_Program;

architecture ROM_Prog of ROM_Program is
begin

process(Prog, Enable, clk)
begin
	if Enable = '1' then
		if clk'event and clk = '1' then
			case Prog is
				when "000" => Temp <= "00";	 -- "000000" manual
							  Vit <= "00";
							  Pre <= '0';
							  Cl <= '0';
							  Manual <= '1';
							  
				when "001" => Temp <= "00";	-- "001000" spalare rapida
							  Vit <= "10";
							  Pre <= '0';
							  Cl <= '0';
							  
				when "010" => Temp <= "10";	 -- "100000" camasi
							  Vit <= "00";
							  Pre <= '0';
							  Cl <= '0';
							  
				when "011" => Temp <= "01";	  -- "010101" culori inchise
							  Vit <= "01";
							  Pre <= '0';
							  Cl <= '1';
							  
				when "100" => Temp <= "01";	  -- "010110" haine murdare
							  Vit <= "01";
							  Pre <= '1';
							  Cl <= '0'; 
							  
				when "101" => Temp <= "11";		-- "111001" antialergic
							  Vit <= "10";
							  Pre <= '0';
							  Cl <= '1';
							  
				when others => Temp <= "XX";	
							  Vit <= "XX";
							  Pre <= 'X';
							  Cl <= 'X';
			end case;
			end if;
		else					-- daca masina de spalat se afla in stare inactiva
			Temp <= "ZZ";
			Vit <= "ZZ";
			Pre <= 'Z';
			Cl <= 'Z';
		end if;
end process;
end ROM_Prog;