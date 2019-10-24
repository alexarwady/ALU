library ieee;
use ieee.std_logic_1164.all;

entity Right_MSB_Shift is
  port( A: in std_logic_vector(31 downto 0);
        E: in std_logic;
        P: out std_logic_vector(63 downto 0) );
end Right_MSB_Shift;

architecture Right_MSB_Shift_arch of Right_MSB_Shift is
  component rightshift
   port ( A: in std_logic_vector (31 downto 0 );
P: out std_logic_vector (63 downto 0 );
E: in std_logic);
  end component;

signal Z: std_logic_vector(63 downto 0);

begin

g: for j in 0 to 30 generate Z(j)<=A(j+1);
end generate;

g2: for j in 63 downto 33 generate
    Z(j)<='0';
  end generate;

Z(31) <= A(31);
Z(32)<='1' when A(0)='1'
else '0';


P<="0000000000000000000000000000000000000000000000000000000000000000" when E='0'
else Z;

end Right_MSB_Shift_arch;
