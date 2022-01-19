----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:28:49 01/20/2022 
-- Design Name: 
-- Module Name:    topmodule - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topmodule is
end topmodule;

architecture Behavioral of topmodule is
component M1 
port(a, b: in std_logic_vector(7 downto 0);
		control: std_logic_vector(2 downto 0);
		in1, in2, in3: in integer;
		output: out std_logic_vector(7 downto 0));
end component;

component statemachine 
port(clk, reset, req: in std_logic;
		input: in std_logic_vector(7 downto 0);
		controloutput: out std_logic_vector(2 downto 0));
end component;

component M2 is
port(clk2, ack: in std_logic;
		m1, m2, m3: in matrix;
		req: out std_logic;
		out1, out2, out3: out integer);
end component;
begin


end Behavioral;

