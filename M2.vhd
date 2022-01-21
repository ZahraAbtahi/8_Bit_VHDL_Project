----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:25:13 01/19/2022 
-- Design Name: 
-- Module Name:    M2 - Behavioral 
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
package matrix is
type matrix is array (2 downto 0, 2 downto 0) of integer;
end matrix; 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use Work.matrix.all;


entity M2 is
port(clk2, ack: in std_logic;
		m1, m2, m3: in matrix;
		req: out std_logic;
		out1, out2, out3: out integer);
end M2;

architecture Behavioral of M2 is
signal finalreq :std_logic := '0';
function determinantcal(mtr: matrix) return integer is
		variable i0:integer:=0;
		variable i1:integer:=0; 
		variable i2:integer:=0;
		variable determinant:integer:=0;
	begin
		i0 := mtr(2,2) * ((mtr(1,1)*mtr(0,0))-(mtr(1,0)*mtr(0,1)));
		i1 := mtr(2,1) * ((mtr(1,2)*mtr(0,0))-(mtr(1,0)*mtr(0,2)));
		i2 := mtr(2,0) * ((mtr(1,2)*mtr(0,1))-(mtr(1,1)*mtr(0,2)));
		determinant := i0 - i1 + i2;
		return determinant;
end function determinantcal;
	
	

begin
	process(clk2)
	begin
			if clk2'event and clk2='1' then
				out1 <= determinantcal(m1);
				out2 <= determinantcal(m2);
				out3 <= determinantcal(m3);
				finalreq <= '1';
			end if;
	end process;
	req <= finalreq;
end Behavioral;

