library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cirleftshift is
port ( A: in std_logic_vector (31 downto 0 );
X: out std_logic_vector (63 downto 0 )   --X is the circular left shift of A
);
end cirleftshift;
architecture cirleftshift_arch of cirleftshift is
component leftshift 
port ( A: in std_logic_vector (31 downto 0);
X: out std_logic_vector (63 downto 0)  
);
end component;
begin
U: leftshift
port map ( A=> A, X=>X);
g: for j in 31 to 63 generate X(j)<=A(0);
end generate;
end cirleftshift_arch;


