library ieee;
use ieee.std_logic_1164.all;

entity AminusB is
  port( A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        E: in std_logic;
        P: out std_logic_vector(63 downto 0)
       );
end AminusB;

architecture AminusB_arch of AminusB is
  component inverter
    port( A: in std_logic;
          AN: out std_logic
         );
  end component;
  
  component AplusB
port (A : in STD_LOGIC_VECTOR(31 downto 0);
B : in STD_LOGIC_VECTOR(31 downto 0);
C0: in std_logic;
E: in std_logic;
P : out STD_LOGIC_VECTOR(63 downto 0);
C32: out std_logic);
  end component;
 
 signal NotB: std_logic_vector(31 downto 0);
signal Z: std_logic_vector(63 downto 0);
signal C32:std_logic;
begin
  g1: for j in 0 to 31 generate
    U1: inverter port map(A=>B(j),AN=>NotB(j));
  end generate;
  U2: AplusB port map(A=>A,B=>NotB,C0=>'1',P=>Z,E=>E, C32=>C32);
g2: for k in 63 downto 33 generate
   Z(k)<='0';
  end generate;

P<="0000000000000000000000000000000000000000000000000000000000000000" when E='0'
else Z;

end AminusB_arch;
