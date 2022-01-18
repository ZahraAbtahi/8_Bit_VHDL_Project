----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:35:53 01/17/2022 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use ieee.numeric_std.All;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
port(a, b: in std_logic_vector(7 downto 0);
		control: std_logic_vector(2 downto 0);
		output: out std_logic_vector(7 downto 0));
end ALU;

architecture Behavioral of ALU is
begin
	process(a, b, control)
	begin
		case(control) is
		when "000" => 
			output <= a xor b;
		when "001" => 
			output <= a + b;
		when "010" => 
			output <= a and b;
		when "011" => 
			output<= std_logic_vector(unsigned(a) * unsigned(b));
		when "100" => 
			output <= a - b;			
		end case;
	end process;
		

end Behavioral;

