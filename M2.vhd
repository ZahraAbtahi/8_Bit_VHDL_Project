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
component determinantcal
	port(mtr: in matrix;
			determinant: out integer);
end component;
	
	signal s0: integer;
	signal s1: integer;
	signal s2: integer;
	--FOR all: determinantcal USE ENTITY WORK.determinantcal(Behavioral);

begin
	--process(clk2)
	--begin
		--if (clk2'event and clk2='1') then
			c1: determinantcal port map(m1, s0);
			c2: determinantcal port map(m2, s1);
			c3: determinantcal port map(m3, s2);
			req <= '1';
		--end if;
	--end process;
	process(ack)
	begin
		out1 <= s0;
		out2 <= s1;
		out3 <= s2;
	end process;

end Behavioral;

