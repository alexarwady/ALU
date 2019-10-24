library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture testbench_arch of testbench is
  component ALU
    port( A: in std_logic_vector (31 downto 0);
B: in std_logic_vector (31 downto 0);
C: in std_logic_vector (3 downto 0);
P: out std_logic_vector (63 downto 0);
E: in std_logic);
  end component;
  
  signal A: std_logic_vector(31 downto 0):=(others=>'0');
  signal B: std_logic_vector(31 downto 0):=(others=>'0');
  signal C: std_logic_vector(3 downto 0):=(others=>'0');
  signal P: std_logic_vector(63 downto 0);
  
  begin
    U: ALU port map(A=>A,B=>B,C=>C,P=>P, E=>'1');
    process
      begin
C<="0001";A<="00000000000000000000000000000111";B<="00000000000000000000000000000010";wait for 10 ns; 		           
C<="0010";wait for 10 ns; 
C<="0000";wait for 10 ns;
C<="0011";wait for 10 ns;
C<="0100";wait for 10 ns;
C<="0101";wait for 10 ns;
C<="0110";wait for 10 ns;
C<="0111";wait for 10 ns;
C<="1001";wait for 10 ns;
C<="1000";wait for 10 ns;
C<="1010";wait for 10 ns;
C<="1011";wait for 10 ns;
C<="1110";wait for 10 ns;
C<="1101";wait for 10 ns;
C<="1100";wait for 10 ns;
C<="1111";wait for 10 ns;	            		         
        wait;
    end process;
end testbench_arch;
