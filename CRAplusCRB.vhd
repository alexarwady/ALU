library ieee;
use ieee.std_logic_1164.all;

entity CRAplusCRB is
port (A: in std_logic_vector (31 downto 0);
B: in std_logic_vector (31 downto 0);
P: out std_logic_vector (63 downto 0);
E: in std_logic);
end CRAplusCRB;

architecture CRAplusCRB_arch of CRAplusCRB is
component rightshift
port ( A: in std_logic_vector (31 downto 0 );
P: out std_logic_vector (63 downto 0 );
E: in std_logic);
end component;

component AplusB64
port (A : in STD_LOGIC_VECTOR(63 downto 0);
B : in STD_LOGIC_VECTOR(63 downto 0);
C0: in std_logic;
E: in std_logic;
P : out STD_LOGIC_VECTOR(63 downto 0);
C32: out std_logic);
end component;

signal Z: std_logic_vector(63 downto 0);
signal newA: std_logic_vector (63 downto 0);
signal newB: std_logic_vector (63 downto 0);

begin
U1: rightshift port map (A=>A, P=>newA, E=>E);
U2: rightshift port map (A=>B, P=>newB, E=>E);
U3: AplusB64 port map (A=>newA, B=>newB, C0=>'0', E=>E, P=>Z);

P<="0000000000000000000000000000000000000000000000000000000000000000" when E='0'
else Z;

end CRAplusCRB_arch;
