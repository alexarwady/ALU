library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rightshift64 is
port ( A: in std_logic_vector (63 downto 0 );
P: out std_logic_vector (63 downto 0 );
E: in std_logic);
end rightshift64;

architecture rightshift64_arch of rightshift64 is
signal Z: std_logic_vector(63 downto 0);
begin
g: for j in 0 to 62 generate Z(j)<=A(j+1);
end generate;
Z(63)<=A(0);
g2: for j in 63 downto 32 generate
    Z(j)<='0';
  end generate;

P<="0000000000000000000000000000000000000000000000000000000000000000" when E='0'
else Z;

end rightshift64_arch;
