library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity leftshift is
port ( A: in std_logic_vector (31 downto 0 );
P: out std_logic_vector (63 downto 0 );
E: in std_logic);
end leftshift;

architecture leftshift_arch of leftshift is
signal Z: std_logic_vector(63 downto 0);
signal Z1: std_logic_vector(63 downto 0);
begin
g: for j in 0 to 30 generate Z(j+1)<=A(j);
end generate;
Z(0)<=A(31);
g2: for j in 63 downto 32 generate
    Z(j)<='0';
  end generate;
Z1<="0000000000000000000000000000000000000000000000000000000000000000" when E='0'
else Z;

P<=Z1;
end leftshift_arch;