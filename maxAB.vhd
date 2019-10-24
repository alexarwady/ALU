library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maxAB is
port ( A: in std_logic_vector (31 downto 0 );
B: in std_logic_vector (31 downto 0 );
M: out std_logic_vector (63 downto 0);
E: in std_logic
);
end maxAB;
architecture maxAB_arch of maxAB is
component AminusB 
port ( A: in std_logic_vector (31 downto 0);
B: in std_logic_vector (31 downto 0 );
P: out std_logic_vector (63 downto 0 );
E: in std_logic
);
end component;
signal P : std_logic_vector (63 downto 0);
signal Z : std_logic_vector (63 downto 0);
signal Md: std_logic_vector (31 downto 0 );
begin
U: AminusB 
port map (A =>A, B=>B, P=>P, E=>E);
process (A,B,Z, Md )
begin
if ( A(31) ='1' AND B(31)='0' )
then Md<=A;
elsif (A(31)='0' AND B(31)='1' )
then Md<=B;
else 
if ( P(31)='0') then Md<=B;
else Md<=A;
end if;
end if;
for j in 31 downto 0 loop
Z(j)<= Md(j);
end loop;
for j in 63 downto 32 loop 
Z(j)<='0';
end loop;
end process;

M<="0000000000000000000000000000000000000000000000000000000000000000" when E='0'
else Z;

end maxAB_arch;
