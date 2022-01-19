----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:40:38 01/19/2022 
-- Design Name: 
-- Module Name:    determinant - Behavioral 
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
use Work.matrix.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity determinantcal is
port(mtr: in matrix;
		determinant: out integer);
end determinantcal;

architecture Behavioral of determinantcal is
signal i0,i1,i2: integer;
begin
	i0 <= mtr(2,2) * ((mtr(1,1)*mtr(0,0))-(mtr(1,0)*mtr(0,1)));
	i1 <= mtr(2,1) * ((mtr(1,2)*mtr(0,0))-(mtr(1,0)*mtr(0,2)));
	i2 <= mtr(2,0) * ((mtr(1,2)*mtr(0,1))-(mtr(1,1)*mtr(0,2)));
	determinant <= i0 - i1 + i2;
end Behavioral;




