--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:38:28 12/31/2021
-- Design Name:   
-- Module Name:   /home/ise/Desktop/Proyectos/EjerciciosASM/TB_Tren.vhd
-- Project Name:  EjerciciosASM
-- Target Device:  
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Tren IS
END TB_Tren;
 
ARCHITECTURE behavior OF TB_Tren IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tren
    PORT(
         tiempo : IN  std_logic;
         sensor : IN  std_logic;
         clk : IN  std_logic;
         Sp : IN  std_logic;
         PA : OUT  std_logic;
         PC : OUT  std_logic;
         PARO : OUT  std_logic;
         AVANCE : OUT  std_logic;
         Q1 : INOUT  std_logic;
         Q0 : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal tiempo : std_logic := '0';
   signal sensor : std_logic := '0';
   signal clk : std_logic := '0';
   signal Sp : std_logic := '0';

	--BiDirs
   signal Q1 : std_logic;
   signal Q0 : std_logic;

 	--Outputs
   signal PA : std_logic;
   signal PC : std_logic;
   signal PARO : std_logic;
   signal AVANCE : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tren PORT MAP (
          tiempo => tiempo,
          sensor => sensor,
          clk => clk,
          Sp => Sp,
          PA => PA,
          PC => PC,
          PARO => PARO,
          AVANCE => AVANCE,
          Q1 => Q1,
          Q0 => Q0
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		tiempo <= '1';
		sp <= '1';
		sensor <= '1';
      wait;
   end process;

END;
