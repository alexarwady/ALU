library ieee;
use ieee.std_logic_1164.all;

entity inverter is
  port( A: in std_logic;
        AN: out std_logic
       );
end inverter;

architecture inverter_arch of inverter is
begin
  AN <= NOT A;
end inverter_arch;