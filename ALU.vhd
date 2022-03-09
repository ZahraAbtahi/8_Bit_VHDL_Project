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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;
use Work.matrix.all;
--use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity M1 is
port(a, b: in std_logic_vector(7 downto 0);
		req, clk1, reset: in std_logic;
		ack: out std_logic;
		mainoutput: out std_logic_vector(7 downto 0);
		muldt: out integer);
end M1;

architecture Behavioral of M1 is
signal d1, d2, d3: integer;
signal clock, ack1, request: std_logic;
signal mtr1, mtr2, mtr3 : matrix;
type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9); 
signal cur_state: state_type;
signal output: std_logic_vector(7 downto 0);


function count_ones(s : std_logic_vector) return integer is
	variable temp : natural := 0; 
	  begin
		for i in s'range loop
			if s(i) = '1' then temp := temp + 1; 
			end if;
		end loop;
		return temp;
	end function count_ones;
	
	component M2
	port(clk2, ack: in std_logic;
			m1, m2, m3: in matrix;
			req: out std_logic;
			out1, out2, out3: out integer);
	end component;
	
begin
	c: M2 port map (clock, ack1, mtr1, mtr2, mtr3, request, d1, d2, d3);
	process(clk1, reset)
		variable n_bits: integer;
	begin
		if (reset='1') then
			cur_state<=s0;
		elsif (clk1'event and clk1='1') then
			case cur_state is
			--xor state
				when s0 =>
					if req='0' then
							output<= a xor b;
							mainoutput<=output;
							n_bits := count_ones(output);
							if (n_bits<4) then cur_state <= s1;
							elsif (n_bits>=4) then cur_state<=s2;
							end if;
					elsif req='1' then
						cur_state<= s5;
					end if;
					
			--s1: add
			when s1 =>
					if req='0' then 
						output<= a + b;
						mainoutput<=output;
						if(a(7)='0' and b(7)='0' and output(7)='1') or (a(7)='1' and b(7)='1' and output(7)='0') then
							cur_state <= s4;
						end if;
					elsif req='1' then
						cur_state<= s6;
					end if;
					
			--s2: and
			when s2 => 
					if req='0' then
						output<= a and b;
						mainoutput<=output;
						if(output /= "00000000") then
							cur_state <= s3;
						end if;
					elsif req='1' then
						cur_state<= s7;
					end if;
					
			--s3: multiply
			when s3 =>
				if req='0' then
						output<= a * b;
						mainoutput<=output;
						cur_state <= s1;
				elsif req='1' then
						cur_state<= s8;				
				end if;
				
			--s4: subtraction
			when s4 =>
				if req='0' then
						output<= a - b;
						mainoutput<=output;
						if (to_integer(signed(output)))<0 then cur_state<=s1;
						elsif (to_integer((signed(output))))>=0 then cur_state<=s0;
						end if;
				elsif req='1' then
						cur_state<= s9;				
				end if;
			when s5 =>
				muldt<=d1*d2*d3;
				ack<='1';
				request <='0';
				cur_state <= s0;
			when s6 =>
				muldt<=d1*d2*d3;
				ack<='1';
				request <='0';
				cur_state <= s1;
			when s7 =>
				muldt<=d1*d2*d3;
				ack<='1';
				request <='0';
				cur_state <= s2;
			when s8 =>
				muldt<=d1*d2*d3;
				ack<='1';
				request <='0';
				cur_state <= s3;
			when s9 =>
				muldt<=d1*d2*d3;
				ack<='1';
				request <='0';
				cur_state <= s4;
		end case;
	end if;
	end process;
		

end Behavioral;

