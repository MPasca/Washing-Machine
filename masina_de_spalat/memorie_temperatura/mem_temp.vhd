--semnalul de intrare "Manual" este activ daca a fost selectat modul manual,altfel este inactiv
--Vectorul "Temp" reprezinta temperatura introdusa de utilizator,iar Temp_mem temperatura programului modului automat ales
--iesirea Tsel reprezinta valoarea temperaturii in baza doi, din care se scad 15 grade,iar temp_sel adresa temperaturii
--daca este selectat modul automat,iesirea va fi temperatura aleasa de catre utilizator,altfel temperatura specifica modului automat ales
--vectorul Tsel va fi intrarea de la numaratorul pentru incalzire,valoare la care trebuie sa se opreasca numaratorul
--30 de grade- "00"
--40 de grade- "01"
--60 de grade- "10"
--90 de grade- "11"
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity memorie_temp is
	port(POW,clk:in STD_LOGIC;														  
	Tsel: out STD_LOGIC_VECTOR(6 downto 0);				--temperatura selectata
	temp_sel : out STD_LOGIC_VECTOR (1 downto 0);		--adresa temperaturii selectate
	Manual : in STD_LOGIC;							  	--semnalul modului selectat (manual / automat)
	Temp: in STD_LOGIC_VECTOR(1 downto 0);				--temperatura introdusa de utilizator
	Temp_mem : in STD_LOGIC_VECTOR(1 downto 0));  		--temperatura specifica programului de spalare
end memorie_temp;

architecture rom of memorie_temp is
signal in_temp:STD_LOGIC_VECTOR(1 downto 0):=('Z','Z');

begin
	process(clk,POW)
	begin
		Tsel(0)<='1';
		Tsel(3)<='1';
		if(POW='1') then
			if(clk'event and clk='1') then
				if Manual = '1' then 			-- daca este selectat modul manual, atunci temperatura selectata este cea introdusa de utilizator
					temp_sel <= Temp;
					in_temp <= Temp;
				else
					temp_sel <= Temp_mem;
					in_temp <= Temp_mem;
				end if;
				
				case in_temp is
					when "00" 	=>	Tsel<="0001111";
					when "01" 	=> 	Tsel<="0011001";
					when "10" 	=> 	Tsel<="0101101"; 
					when others =>  Tsel<="1001011"; 
				end case;
			 end if;
		end if;	  
	end process;
end architecture;
	