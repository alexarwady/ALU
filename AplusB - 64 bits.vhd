library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AplusB64 is
port (A : in STD_LOGIC_VECTOR(63 downto 0);
B : in STD_LOGIC_VECTOR(63 downto 0);
C0: in std_logic;
E: in std_logic;
P : out STD_LOGIC_VECTOR(63 downto 0);
C32: out std_logic);
end AplusB64;

architecture AplusB64_arch of AplusB64 is
component full_adder
port (
        X:          in STD_LOGIC;
        Y:          in STD_LOGIC;
        CIN:      in STD_LOGIC;
        S:         out STD_LOGIC;
        COUT: out STD_LOGIC);
end component;

signal C : std_logic_vector(0 to 64);
signal Z: std_logic_vector(63 downto 0);
signal s7:std_logic:='0';

begin
  g1: for k in 0 to 63 generate
       U1: full_adder port map (X=>A(k), Y=>B(k), CIN=> C(k), S=>Z(k), COUT=>C(k+1));
  end generate;
  C(0) <= C0;
  C32  <= C(64);
P<="0000000000000000000000000000000000000000000000000000000000000000" when E='0'
else Z;

end AplusB64_arch;