library ieee;
use ieee.std_logic_1164.all;

entity incrementA is
  port( 
E: in std_logic;
A: in std_logic_vector(31 downto 0);
P: out std_logic_vector(63 downto 0)
       );
end incrementA;

architecture incrementA_arch of incrementA is
component AplusB
port (A : in STD_LOGIC_VECTOR(31 downto 0);
B : in STD_LOGIC_VECTOR(31 downto 0);
C0: in std_logic;
E: in std_logic;
P : out STD_LOGIC_VECTOR(63 downto 0);
C32: out std_logic);
end component;

signal Z: STD_LOGIC_VECTOR(63 downto 0);
signal s7:std_logic:='0';

begin
  U: AplusB port map(A=>A,B=>"00000000000000000000000000000000",C0=>'1',P=>Z,E=>E);
g2: for k in 63 downto 32 generate
   Z(k)<=s7;
  end generate;

P<="0000000000000000000000000000000000000000000000000000000000000000" when E='0'
else Z;

end incrementA_arch;