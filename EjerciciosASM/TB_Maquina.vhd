--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:13:15 01/01/2022
-- Design Name:   
-- Module Name:   /home/ise/Desktop/Proyectos/EjerciciosASM/TB_Maquina.vhd
-- Project Name:  EjerciciosASM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: maquina
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Maquina IS
END TB_Maquina;
 
ARCHITECTURE behavior OF TB_Maquina IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT maquina
    PORT(
         CLK : IN  std_logic;
         MONEDA : IN  std_logic;
         MP : IN  std_logic;
         PRECIO : IN  std_logic;
         LC : IN  std_logic;
         LS : IN  std_logic;
         CAP : OUT  std_logic;
         LIMPIA : OUT  std_logic;
         SIRVE : OUT  std_logic;
         CAMBIO : OUT  std_logic;
         DEC : OUT  std_logic;
         IM : OUT  std_logic;
         Q2 : OUT  std_logic;
         Q1 : OUT  std_logic;
         Q0 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal MONEDA : std_logic := '0';
   signal MP : std_logic := '0';
   signal PRECIO : std_logic := '0';
   signal LC : std_logic := '0';
   signal LS : std_logic := '0';

 	--Outputs
   signal CAP : std_logic;
   signal LIMPIA : std_logic;
   signal SIRVE : std_logic;
   signal CAMBIO : std_logic;
   signal DEC : std_logic;
   signal IM : std_logic;
   signal Q2 : std_logic;
   signal Q1 : std_logic;
   signal Q0 : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: maquina PORT MAP (
          CLK => CLK,
          MONEDA => MONEDA,
          MP => MP,
          PRECIO => PRECIO,
          LC => LC,
          LS => LS,
          CAP => CAP,
          LIMPIA => LIMPIA,
          SIRVE => SIRVE,
          CAMBIO => CAMBIO,
          DEC => DEC,
          IM => IM,
          Q2 => Q2,
          Q1 => Q1,
          Q0 => Q0
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      moneda <= '0';
		wait for CLK_period;
		moneda <= '1';
		wait for CLK_period;
		moneda <= '0';
      wait;
   end process;

END;
