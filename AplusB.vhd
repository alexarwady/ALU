library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AplusB is
port (A : in STD_LOGIC_VECTOR(31 downto 0);
B : in STD_LOGIC_VECTOR(31 downto 0);
C0: in std_logic;
E: in std_logic;
P : out STD_LOGIC_VECTOR(63 downto 0);
C32: out std_logic);
end AplusB;

architecture AplusB_arch of AplusB is
component full_adder
port (
        X:          in STD_LOGIC;
        Y:          in STD_LOGIC;
        CIN:      in STD_LOGIC;
        S:         out STD_LOGIC;
        COUT: out STD_LOGIC);
end component;

signal C : std_logic_vector(0 to 32);
signal Z: std_logic_vector(63 downto 0);
signal Z1: std_logic_vector(63 downto 0);
signal s7:std_logic:='0';


begin
  g1: for k in 0 to 31 generate
       U1: full_adder port map (X=>A(k), Y=>B(k), CIN=> C(k), S=>Z(k), COUT=>C(k+1));
  end generate;
Z(32)<='1' when C(32)='1'
else '0';
 g2: for k in 63 downto 33 generate
   Z(k)<='0';
  end generate;

  C(0) <= C0;
  C32  <= C(32);
 
Z1<="0000000000000000000000000000000000000000000000000000000000000000" when E='0'
else Z;
P<=Z1;
end AplusB_arch;