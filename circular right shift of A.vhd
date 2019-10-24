library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cirrightshift is
port ( A: in std_logic_vector (31 downto 0 );
X: out std_logic_vector (63 downto 0 )   --X is the circular right shift of A
);
end cirrightshift;
architecture cirrightshift_arch of cirrightshift is
component rightshift 
port ( A: in std_logic_vector (31 downto 0);
X: out std_logic_vector (63 downto 0)  
);
end component;
begin
U: rightshift
port map ( A=> A, X=>X);
g: for j in 31 to 63 generate X(j)<=A(0);
end generate;
end cirrightshift_arch;

