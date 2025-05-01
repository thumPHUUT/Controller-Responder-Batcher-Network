-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/05/2024 16:14:52"
                                                            
-- Vhdl Test Bench template for design  :  MSBN
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
use IEEE.NUMERIC_STD.ALL;

ENTITY MSBN_vhd_tst IS
END MSBN_vhd_tst;
ARCHITECTURE MSBN_arch OF MSBN_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL In_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL In_2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL In_3 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL In_4 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL In_5 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL In_6 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL In_7 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL In_8 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL Out_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Out_2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Out_3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Out_4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Out_5 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Out_6 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Out_7 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Out_8 : STD_LOGIC_VECTOR(2 DOWNTO 0);

COMPONENT MSBN
	PORT (In_1,In_2,In_3,In_4,In_5,In_6,In_7,In_8 				: in std_logic_vector(4 downto 0);
			 Out_1,Out_2,Out_3,Out_4,Out_5,Out_6,Out_7,Out_8 	: out  std_logic_vector(2 downto 0)) ;
END COMPONENT;



BEGIN
	i1 : MSBN
	PORT MAP (
-- list connections between master ports and signals
	In_1 => In_1,
	In_2 => In_2,
	In_3 => In_3,
	In_4 => In_4,
	In_5 => In_5,
	In_6 => In_6,
	In_7 => In_7,
	In_8 => In_8,
	Out_1 => Out_1,
	Out_2 => Out_2,
	Out_3 => Out_3,
	Out_4 => Out_4,
	Out_5 => Out_5,
	Out_6 => Out_6,
	Out_7 => Out_7,
	Out_8 => Out_8
	);
                                         
always : PROCESS                                                                                    
BEGIN                                                         
	
	In_1 <= "00000";
	In_2 <= "00010";
	In_3 <= "00011";
	In_4 <= "00100";
	In_5 <= "00111";
	In_6 <= "01000";
	In_7 <= "01001";
	In_8 <= "10000";
--output should be 0 - 7
	wait for 10 ns;
	
	In_1 <= "00010";
	In_2 <= "00000";
	In_3 <= "00011";
	In_4 <= "00100";
	In_5 <= "00111";
	In_6 <= "01000";
	In_7 <= "01001";
	In_8 <= "10000";
--output should be: 1,0,2-7
	wait for 10 ns;
	
	In_1 <= "10000";
	In_2 <= "01100";
	In_3 <= "01000";
	In_4 <= "00110";
	In_5 <= "00100";
	In_6 <= "00011";
	In_7 <= "00010";
	In_8 <= "00001";
--output should be 7-0
	wait for 10 ns;
	
WAIT;                                                        
END PROCESS always; 

                                       
END MSBN_arch;
