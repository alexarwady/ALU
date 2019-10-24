library ieee;
use ieee.std_logic_1164.all;

entity TB1 is
end TB1;

architecture TB1_arch of TB1 is
component MaxABdiv2 is
port (A: in std_logic_vector (31 downto 0);
B: in std_logic_vector (31 downto 0);
P: out std_logic_vector (63 downto 0);
E: in std_logic);
end component;

signal A : STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');
signal B : STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');
signal E: std_logic:='0';
signal P : STD_LOGIC_VECTOR(63 downto 0);


begin
U: MaxABdiv2 port map(A=>A, E=>E, B=>B, P=>P);
process
begin
E<='1';
A<="00000000000000000000000000000111";B<="00000000000000000000000000000010"; wait for 10 ns; 
A<="00000000000000000000000000000001";B<="00000000000000000000000000000010"; wait for 10 ns;		              
wait;
end process;
end TB1_arch;

