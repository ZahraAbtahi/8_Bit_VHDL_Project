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
use Work.matrix.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topmodule is
port(A : in std_logic_vector(0 to 7);
		B : in std_logic_vector(0 to 7);
		matrix1 , matrix2 , matrix3 : in matrix;
		clk1, clk2 , reset: in std_logic;
		multiplydett : out integer;
		output: out std_logic_vector(7 downto 0));
end topmodule;

architecture Behavioral of topmodule is
signal ack: std_logic;
signal request : std_logic;
component M1 is
port(a, b: in std_logic_vector(7 downto 0);
		req, clk1, reset: in std_logic;
		ack: out std_logic;
		mainoutput: out std_logic_vector(7 downto 0);
		muldt: out integer);
end component;


component M2 is
port(clk2, ack: in std_logic;
		m1, m2, m3: in matrix;
		req: out std_logic;
		out1, out2, out3: out integer);
end component;
begin
module1: M1 port map(A, B, request, clk1, reset, ack, output,	multiplydett );
module2: M2 port map(clk2, ack, matrix1, matrix2, matrix3, request );

end Behavioral;

