library IEEE ;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity SO is
	Port	(In1,In2 		: in std_logic_vector(4 downto 0);
			 Out1,Out2 		: out std_logic_vector(4 downto 0);
			 Permutation_out		: out std_logic);
end SO ;


architecture implementation of SO is

signal Comp : std_logic;

begin
	Comp <= '1' when In1 > In2 else '0';
	
	with Comp select
		Out1 <= In2 when '1', In1 when others;
	
	with Comp select
		Out2 <= In1 when '1', In2 when others;
	
	Permutation_out <= Comp;
	
end implementation;