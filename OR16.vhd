library ieee;
use ieee.std_logic_1164.all;

entity or16 is
port ( I0: in std_logic;
I1: in std_logic;
I2: in std_logic;
I3: in std_logic;
I4: in std_logic;
I5: in std_logic;
I6: in std_logic;
I7: in std_logic;
I8: in std_logic;
I9: in std_logic;
I10: in std_logic;
I11: in std_logic;
I12: in std_logic;
I13: in std_logic;
I14: in std_logic;
I15: in std_logic;
O: out std_logic);
end or16;

architecture or16_arch of or16 is
begin
O<= I0 or I1 or I2 or I3 or I4 or I5 or I6 or I7 or I8 or I9 or I10 or I11 or I12 or I13 or I14 or I15;
end or16_arch;
