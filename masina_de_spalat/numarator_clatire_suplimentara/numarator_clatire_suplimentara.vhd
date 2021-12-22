--numaratorul este activ cat timp are loc clatirea suplimentara
--semnalul SCL_supl activeaza numaratorul,care numara timp de 10 minute
--cand se termina clatirea suplimentara semnalul SfCL_supl esti actival,la fel si semnalul de reset
--impulsul de tact este de un minut
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity numarator_clatire_suplimentara is
	port(SCl_supl,clk:in std_logic;
	SfCl_supl:out std_logic:='0');
end entity;

architecture num_clatire_suplimentara of numarator_clatire_suplimentara is
begin
	process(clk,SCl_supl)
	variable q:std_logic_vector(3 downto 0):="0000";
	begin
		if(SCl_supl='1') then
			if(clk'event and clk='0') then
				q:=q+1;
				if(q="1010") then
					SfCl_supl<='1';	
				elsif(q="1011") then
					q:="0000";
					SfCl_supl<='0';
				end if;	
			end if;
		else
			SfCl_supl<='0';
		end if;	
	end process;	
end architecture;