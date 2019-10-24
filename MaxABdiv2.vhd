library ieee;
use ieee.std_logic_1164.all;

entity MaxABdiv2 is
port (A: in std_logic_vector (31 downto 0);
B: in std_logic_vector (31 downto 0);
P: out std_logic_vector (63 downto 0);
E: in std_logic);
end MaxABdiv2;

architecture MaxABdiv2_arch of MaxABdiv2 is
component rightshift64
port ( A: in std_logic_vector (63 downto 0 );
P: out std_logic_vector (63 downto 0 );
E: in std_logic);
end component;

component maxAB is
port ( A: in std_logic_vector (31 downto 0 );
B: in std_logic_vector (31 downto 0 );
M: out std_logic_vector (63 downto 0);
E: in std_logic);
end component;

signal maxodd: std_logic_vector (63 downto 0);
signal maxeven: std_logic_vector (63 downto 0);
signal Z: std_logic_vector (63 downto 0);

begin
U1: maxAB port map(A=>A, B=>B, E=>E, M=>maxodd);
U2: rightshift64 port map(A=>maxodd, E=>E, P=>maxeven);
process(maxodd)
begin
if maxodd(0) = '1' then
Z<=maxodd;
else Z<=maxeven;
end if;
end process;

P<="0000000000000000000000000000000000000000000000000000000000000000" when E='0'
else Z;

end MaxABdiv2_arch;

