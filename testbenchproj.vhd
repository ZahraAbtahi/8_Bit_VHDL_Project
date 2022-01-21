-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
	use Work.matrix.all;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 


  -- Component Declaration
          COMPONENT topmodule
          PORT(
                  A : in std_logic_vector(0 to 7);
						B : in std_logic_vector(0 to 7);
						matrix1 :in matrix;
						matrix2 :in matrix;
						matrix3 :in matrix;
						clk1: in std_logic;
						clk2: in std_logic;
						reset: in std_logic;
						multiplydett : out integer;
						output: out std_logic_vector(7 downto 0));
          END COMPONENT;

          signal A : std_logic_vector(0 to 7):="00000000";
			 signal B : std_logic_vector(0 to 7):= "00000000";
		    signal matrix1 , matrix2 , matrix3 : matrix;
			 signal clk1, clk2 , reset: std_logic;
			 signal multiplydett : integer;
			 signal output: std_logic_vector(7 downto 0);
          

  BEGIN

  -- Component Instantiation
          uut: topmodule PORT MAP(
                  A => A,
                  B => B,
						matrix1 => matrix1,
						matrix2 => matrix2,
						matrix3 => matrix3,
						clk1 => clk1,
						clk2 => clk2,
						reset => reset,
						multiplydett => multiplydett,
						output => output	
          );


     clk_process :process
   begin
		clk1 <= '0';
		clk2 <= '0';
		wait for 50 ns;
		clk1 <= '1';
		clk2<='0';
		wait for 50 ns;
		clk1<= '1';
		clk2 <= '1';
   end process;
   
	
	 stim_proc: process
   begin		
      A <= "00000001";
		B <= "00000101";
		reset<='0';
		wait for 50 ns;
		A <= "00000011";
		B <= "00000111";
		reset<='0';
				wait for 50 ns;
		A <= "00001001";
		B <= "00010101";
		reset<='0';
		wait for 50 ns;
		A <= "00010001";
		B <= "00010101";
		reset<='0';
		wait for 50 ns;
			 

      wait;
   end process;

  END;
