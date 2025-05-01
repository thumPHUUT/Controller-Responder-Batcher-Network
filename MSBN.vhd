library IEEE ;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity MSBN is
	Port 	(In_1,In_2,In_3,In_4,In_5,In_6,In_7,In_8 				: in std_logic_vector(4 downto 0);
			 Out_1,Out_2,Out_3,Out_4,Out_5,Out_6,Out_7,Out_8 	: out  std_logic_vector(2 downto 0)) ;

end MSBN ;

architecture implementation of MSBN is

	signal f1,f2,f3,f4,f5,f6,f7,f8,g1,g2,g3,g4,g5,g6,g7,g8 : std_logic_vector(4 downto 0); --master signals
	signal h1,h2,h3,h4,h5,h6,h7,h8,i1,i2,i3,i4,j1,j2,j3,j4 : std_logic_vector(4 downto 0);
	signal n1,n2,n3,n4,n5,n6,n7,n8								 : std_logic_vector(4 downto 0);
	
	signal e1,e2,e3,e4,e5,e6,e7,e8,d1,d2,d3,d4,d5,d6,d7,d8 : std_logic_vector(2 downto 0); --slave signals
	signal c1,c2,c3,c4,b1,b2,b3,b4,a1,a2,a3,a4,a5,a6 		 : std_logic_vector(2 downto 0);
	
	signal p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19 : std_logic; --permutation signals
	
	component SO 
	port(In1,In2 					: in std_logic_vector(4 downto 0);
			 Out1,Out2 				: out std_logic_vector(4 downto 0);
			 Permutation_out		: out std_logic);
	end component;
	
	component SW 
	port(Idx1,Idx2 				: in std_logic_vector(2 downto 0);
			 Permutation_in		: in std_logic;
			 Out_idx1,Out_idx2 	: out std_logic_vector(2 downto 0));
	end component;
	
begin
--grouped like circuit diagram (blocks categorize outputs)

--master network
	--f block
	SO_1: SO port map (In1 => In_1, In2 => In_2, Out1 => f1, Out2 => f2, Permutation_out => p1);
	SO_2: SO port map (In1 => In_3, In2 => In_4, Out1 => f3, Out2 => f4, Permutation_out => p2);
	SO_3: SO port map (In1 => In_5, In2 => In_6, Out1 => f5, Out2 => f6, Permutation_out => p3);
	SO_4: SO port map (In1 => In_7, In2 => In_8, Out1 => f7, Out2 => f8, Permutation_out => p4);
	--g block
	SO_5: SO port map (In1 => f1, In2 => f5, Out1 => g1, Out2 => g2, Permutation_out => p5);
	SO_6: SO port map (In1 => f3, In2 => f7, Out1 => g3, Out2 => g4, Permutation_out => p6);
	SO_7: SO port map (In1 => f2, In2 => f6, Out1 => g5, Out2 => g6, Permutation_out => p7);
	SO_8: SO port map (In1 => f4, In2 => f8, Out1 => g7, Out2 => g8, Permutation_out => p8);
	--h block
	SO_9: SO port map  (In1 => g1, In2 => g3, Out1 => n1, Out2 => h1, Permutation_out => p9);
	SO_10: SO port map (In1 => g2, In2 => g5, Out1 => h2, Out2 => h3, Permutation_out => p10);
	SO_11: SO port map (In1 => g3, In2 => g7, Out1 => h4, Out2 => h5, Permutation_out => p11);
	SO_12: SO port map (In1 => g6, In2 => g8, Out1 => h6, Out2 => n8, Permutation_out => p12);
	--i block
	SO_13: SO port map (In1 => h2, In2 => h4, Out1 => i1, Out2 => i2, Permutation_out => p13);
	SO_14: SO port map (In1 => h3, In2 => h5, Out1 => i3, Out2 => i4, Permutation_out => p14);
	--j block
	SO_15: SO port map (In1 => h1, In2 => i3, Out1 => j1, Out2 => j2, Permutation_out => p15);
	SO_16: SO port map (In1 => i2, In2 => h6, Out1 => j3, Out2 => j4, Permutation_out => p16);
	--no output block
	SO_17: SO port map (In1 => j1, In2 => i1, Out1 => n2, Out2 => n3, Permutation_out => p17);
	SO_18: SO port map (In1 => j3, In2 => j2, Out1 => n4, Out2 => n5, Permutation_out => p18);
	SO_19: SO port map (In1 => i4, In2 => j4, Out1 => n6, Out2 => n7, Permutation_out => p19);

	
--slave network
	--a block
	SW_19: SW port map (Idx1 => "101", Idx2 => "110", Out_idx1 => a5, Out_idx2 => a6, Permutation_in => p19);
	SW_18: SW port map (Idx1 => "011", Idx2 => "100", Out_idx1 => a3, Out_idx2 => a4, Permutation_in => p18);
	SW_17: SW port map (Idx1 => "001", Idx2 => "010", Out_idx1 => a1, Out_idx2 => a2, Permutation_in => p17);
	--b block
	SW_16: SW port map (Idx1 => a3, Idx2 => a6, Out_idx1 => b3, Out_idx2 => b4, Permutation_in => p16);
	SW_15: SW port map (Idx1 => a1, Idx2 => a4, Out_idx1 => b1, Out_idx2 => b2, Permutation_in => p15);
	--c block
	SW_14: SW port map (Idx1 => b2, Idx2 => a5, Out_idx1 => c3, Out_idx2 => c4, Permutation_in => p14);
	SW_13: SW port map (Idx1 => a2, Idx2 => b3, Out_idx1 => c1, Out_idx2 => c2, Permutation_in => p13);
	--d block
	SW_12: SW port map (Idx1 => b4, Idx2 => "111", Out_idx1 => d7, Out_idx2 => d8, Permutation_in => p12);
	SW_11: SW port map (Idx1 => c2, Idx2 => c4, Out_idx1 => d5, Out_idx2 => d6, Permutation_in => p11);
	SW_10: SW port map (Idx1 => c1, Idx2 => c3, Out_idx1 => d3, Out_idx2 => d4, Permutation_in => p10);
	SW_9:  SW port map (Idx1 => "000", Idx2 => b1, Out_idx1 => d1, Out_idx2 => d2, Permutation_in => p9);
	--e block
	SW_8:  SW port map (Idx1 => d6, Idx2 => d8, Out_idx1 => e7, Out_idx2 => e8, Permutation_in => p8);
	SW_7:  SW port map (Idx1 => d4, Idx2 => d7, Out_idx1 => e5, Out_idx2 => e6, Permutation_in => p7);
	SW_6:  SW port map (Idx1 => d2, Idx2 => d5, Out_idx1 => e3, Out_idx2 => e4, Permutation_in => p6);
	SW_5:  SW port map (Idx1 => d1, Idx2 => d3, Out_idx1 => e1, Out_idx2 => e2, Permutation_in => p5);
	--output block
	SW_4:  SW port map (Idx1 => e4, Idx2 => e8, Out_idx1 => Out_7, Out_idx2 => Out_8, Permutation_in => p4);
	SW_3:  SW port map (Idx1 => e2, Idx2 => e6, Out_idx1 => Out_5, Out_idx2 => Out_6, Permutation_in => p3);
	SW_2:  SW port map (Idx1 => e3, Idx2 => e7, Out_idx1 => Out_3, Out_idx2 => Out_4, Permutation_in => p2);
	SW_1:  SW port map (Idx1 => e1, Idx2 => e5, Out_idx1 => Out_1, Out_idx2 => Out_2, Permutation_in => p1);

end implementation;