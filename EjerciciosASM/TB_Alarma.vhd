--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:55:06 01/01/2022
-- Design Name:   
-- Module Name:   /home/ise/Desktop/Proyectos/EjerciciosASM/TB_Alarma.vhd
-- Project Name:  EjerciciosASM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: c_alarma
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
 
ENTITY TB_Alarma IS
END TB_Alarma;
 
ARCHITECTURE behavior OF TB_Alarma IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT c_alarma
    PORT(
         clk : IN  std_logic;
         fx : IN  std_logic;
         cont4 : IN  std_logic;
         boton : IN  std_logic;
         reset : OUT  std_logic;
         inc : OUT  std_logic;
         activa : OUT  std_logic;
         alarma : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal fx : std_logic := '0';
   signal cont4 : std_logic := '0';
   signal boton : std_logic := '0';

 	--Outputs
   signal reset : std_logic;
   signal inc : std_logic;
   signal activa : std_logic;
   signal alarma : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: c_alarma PORT MAP (
          clk => clk,
          fx => fx,
          cont4 => cont4,
          boton => boton,
          reset => reset,
          inc => inc,
          activa => activa,
          alarma => alarma
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
		boton <= '1';
      wait for clk_period;
		fx <= '1';
		wait for clk_period;
		boton <= '0';
		wait for clk_period;
		cont4 <= '1';
      wait;
   end process;

END;
