library ieee;
use ieee.std_logic_1164.all;

entity decrementA is
  port( A: in std_logic_vector(31 downto 0);
        E: in std_logic;
        P: out std_logic_vector(63 downto 0)
       );
end decrementA;

architecture decrementA_arch of decrementA is
  component AminusB
    port( A: in std_logic_vector (31 downto 0);
          B: in std_logic_vector(31 downto 0);
          E: in std_logic;
          P: out std_logic_vector(63 downto 0)
        );
  end component;

signal Z: std_logic_vector (63 downto 0);
signal s7:std_logic:='0';
  
begin
    U: AminusB port map(A=>A,B=>"00000000000000000000000000000001",P=>Z,E=>E);
g2: for k in 63 downto 33 generate
   Z(k)<=s7;
  end generate;

P<="0000000000000000000000000000000000000000000000000000000000000000" when E='0'
else Z;

end decrementA_arch;
