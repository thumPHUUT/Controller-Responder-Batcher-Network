library IEEE ;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity SW is
	Port	(Idx1,Idx2 				: in std_logic_vector(2 downto 0);
			 Permutation_in		: in std_logic;
			 Out_idx1,Out_idx2 	: out std_logic_vector(2 downto 0));
end SW ;


architecture implementation of SW is
begin

	with Permutation_in select
		Out_idx1 <= Idx2 when '1', Idx1 when others;
	
	with Permutation_in select
		Out_idx2 <= Idx1 when '1', Idx2 when others;
	
end implementation;
