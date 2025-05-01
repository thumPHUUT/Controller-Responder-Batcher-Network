library IEEE ;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity comparator is
	Port	(A, B 		: in std_logic_vector(4 downto 0) ;
			 F 			: out std_logic) ;
end comparator ;


architecture implementation of comparator is
begin
	
	F <= '1' when A > B else '0';

end implementation;