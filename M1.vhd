----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:29:24 01/20/2022 
-- Design Name: 
-- Module Name:    M1 - Behavioral 
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

entity M1 is
end M1;

architecture Behavioral of M1 is
component ALU
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
begin


end Behavioral;

