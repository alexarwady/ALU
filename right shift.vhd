library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rightshift is
port ( A: in std_logic_vector (31 downto 0 );
P: out std_logic_vector (63 downto 0 );
E: in std_logic);
end rightshift;

architecture rightshift_arch of rightshift is
signal Z: std_logic_vector(63 downto 0);
begin
g: for j in 0 to 30 generate Z(j)<=A(j+1);
end generate;
Z(31)<=A(0);
g2: for j in 63 downto 32 generate
    Z(j)<='0';
  end generate;

P<="0000000000000000000000000000000000000000000000000000000000000000" when E='0'
else Z;

end rightshift_arch;

