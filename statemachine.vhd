----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:18:47 01/17/2022 
-- Design Name: 
-- Module Name:    statemachine - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity statemachine is
port(clk, reset, req: in std_logic;
		input: in std_logic_vector(7 downto 0);
		controloutput: out std_logic_vector(2 downto 0));
end statemachine;

Architecture behavioral of statemachine is
	type state_type is (s0,s1,s2,s3,s4); 
	signal state: state_type;
	signal request: std_logic;
	function count_ones(s : std_logic_vector) return integer is
	variable temp : natural := 0; 
	  begin
		for i in s'range loop
			if s(i) = '1' then temp := temp + 1; 
			end if;
		end loop;
		return temp;
	end function count_ones;	
begin
process(clk,reset) --Clocked process
variable n_bits: integer;
begin
		if (reset='1') then
			state<=s0;
		elsif (clk'event and clk='1') then
			case state is
				when s0 => n_bits := count_ones(input);
				if (n_bits<4) then state <= s1;
				elsif (n_bits>=4) then state<=s2;
				end if;
				when s1=>if (input="10101010") then
				state<=s2;
				end if;
				when s2=>if (input/="00000000") then
				state<=s3;
				end if;
				when s3=> state<=s4;	
				when s4=>
					if to_integer(unsigned(input))<0 then state<=s1;
					elsif to_integer(unsigned(input))>=0 then state<=s0;
				end if;
			end case;
		end if;
	end process;

	output_p:process(state) --Combinational process
	begin
		case state is
			when s0=> controloutput<="000";
			when s1=> controloutput<="001";
			when s2=> controloutput<="010";
			when s3=> controloutput<="011";
			when s4=> controloutput<="100";		
		end case;
		end process;
end behavioral;
