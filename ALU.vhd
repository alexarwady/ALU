library ieee;
use ieee.std_logic_1164.all;

entity ALU is
port( A: in std_logic_vector (31 downto 0);
B: in std_logic_vector (31 downto 0);
C: in std_logic_vector (3 downto 0);
P: out std_logic_vector (63 downto 0);
E: in std_logic);
end ALU;

architecture ALU_arch of ALU is
component AminusB is
  port( A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        E: in std_logic;
        P: out std_logic_vector(63 downto 0)
       );
end component;

component AplusB is
port (A : in STD_LOGIC_VECTOR(31 downto 0);
B : in STD_LOGIC_VECTOR(31 downto 0);
C0: in std_logic;
E: in std_logic;
P : out STD_LOGIC_VECTOR(63 downto 0);
C32: out std_logic);
end component;

component CRAplusCLB is
port (A: in std_logic_vector (31 downto 0);
B: in std_logic_vector (31 downto 0);
P: out std_logic_vector (63 downto 0);
E: in std_logic);
end component;

component CRAplusCRB is
port (A: in std_logic_vector (31 downto 0);
B: in std_logic_vector (31 downto 0);
P: out std_logic_vector (63 downto 0);
E: in std_logic);
end component;

component decoder IS
Port ( E : IN STD_LOGIC ;
       A : IN STD_LOGIC_VECTOR( 3 DOWNTO 0) ;
       B : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)  ) ;
END component ;

component decrementA is
  port( A: in std_logic_vector(31 downto 0);
        E: in std_logic;
        P: out std_logic_vector(63 downto 0)
       );
end component;

component incrementA is
  port( 
E: in std_logic;
A: in std_logic_vector(31 downto 0);
P: out std_logic_vector(63 downto 0)
       );
end component;

component leftshift is
port ( A: in std_logic_vector (31 downto 0 );
P: out std_logic_vector (63 downto 0 );
E: in std_logic);
end component;

component left_0_shift is
  port( A: in std_logic_vector(31 downto 0);
        P: out std_logic_vector(63 downto 0);
        E: in std_logic);
end component;

component Left_LSB_Shift is
  port( A: in std_logic_vector(31 downto 0);
        E: in std_logic;
        P: out std_logic_vector(63 downto 0) );
end component;

component maxAB is
port ( A: in std_logic_vector (31 downto 0 );
B: in std_logic_vector (31 downto 0 );
M: out std_logic_vector (63 downto 0);
E: in std_logic
);
end component;

component MaxABdiv2 is
port (A: in std_logic_vector (31 downto 0);
B: in std_logic_vector (31 downto 0);
P: out std_logic_vector (63 downto 0);
E: in std_logic);
end component;

component miniAB is
port ( A: in std_logic_vector (31 downto 0 );
B: in std_logic_vector (31 downto 0 );
M: out std_logic_vector (63 downto 0);
E: in std_logic
);
end component;

component rightshift is
port ( A: in std_logic_vector (31 downto 0 );
P: out std_logic_vector (63 downto 0 );
E: in std_logic);
end component;

component right_0_shift is
  port( A: in std_logic_vector(31 downto 0);
        P: out std_logic_vector(63 downto 0); 
        E: in std_logic);
end component;

component Right_MSB_Shift is
  port( A: in std_logic_vector(31 downto 0);
        E: in std_logic;
        P: out std_logic_vector(63 downto 0) );
end component;

component AtimesB1 is port (
A: IN STD_LOGIC_VECTOR(31 downto 0);
B: IN STD_LOGIC_VECTOR(31 downto 0);
E: IN STD_LOGIC;
P: OUT STD_LOGIC_VECTOR(63 downto 0));
end component;

component or16 is
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
end component;

signal I: std_logic_vector(3 downto 0);
signal E1: std_logic;
signal O1: std_logic_vector(15 downto 0);
signal O2: std_logic_vector(63 downto 0);

signal P0: std_logic_vector(63 downto 0);
signal P1: std_logic_vector(63 downto 0);
signal P2: std_logic_vector(63 downto 0);
signal P3: std_logic_vector(63 downto 0);
signal P4: std_logic_vector(63 downto 0);
signal P5: std_logic_vector(63 downto 0);
signal P6: std_logic_vector(63 downto 0);
signal P7: std_logic_vector(63 downto 0);
signal P8: std_logic_vector(63 downto 0);
signal P9: std_logic_vector(63 downto 0);
signal P10: std_logic_vector(63 downto 0);
signal P11: std_logic_vector(63 downto 0);
signal P12: std_logic_vector(63 downto 0);
signal P13: std_logic_vector(63 downto 0);
signal P14: std_logic_vector(63 downto 0);
signal P15: std_logic_vector(63 downto 0);

signal nothing: std_logic;

begin
E1<=E;
U2: decoder port map(A=>C, B=>O1, E=>E1);
U3: AplusB port map (A=>A, B=>B, C0=>'0', E=>O1(1), P=>P1, C32=>nothing);
U4: AminusB port map (A=>A, B=>B, E=>O1(0), P=>P0);
U5: CRAplusCLB port map (A=>A, B=>B, E=>O1(15), P=>P15);
U6: CRAplusCRB port map (A=>A, B=>B, E=>O1(12), P=>P12);
U7: decrementA port map (A=>A, E=>O1(3), P=>P3);
U8: incrementA port map (A=>A, E=>O1(2), P=>P2);
U9: leftshift port map (A=>A, E=>O1(8), P=>P8);
U10: left_0_shift port map (A=>A, E=>O1(11), P=>P11);
U11: Left_LSB_Shift port map (A=>A, E=>O1(13), P=>P13);
U12: maxAB port map (A=>A, B=>B, E=>O1(5), M=>P5);
U13: MaxABdiv2 port map (A=>A, B=>B, E=>O1(7), P=>P7);
U14: miniAB port map (A=>A, B=>B, E=>O1(6), M=>P6);
U15: rightshift port map (A=>A, E=>O1(9), P=>P9);
U16: right_0_shift port map (A=>A, E=>O1(10), P=>P10);
U17: Right_MSB_Shift port map (A=>A, E=>O1(14), P=>P14);
U18: AtimesB1 port map (A=>A, B=>B, E=>O1(4), P=>P4);

x1: for i in 63 downto 0 generate
Q1: or16 port map(I0=>P0(i), I1=>P1(i), I2=>P2(i), I3=>P3(i), I4=>P4(i), I5=>P5(i), I6=>P6(i), I7=>P7(i), I8=>P8(i), I9=>P9(i), I10=>P10(i), I11=>P11(i), I12=>P12(i), I13=>P13(i), I14=>P14(i), I15=>P15(i), O=>O2(i));
end generate;

x2: for i in 63 downto 0 generate
P(i)<=O2(i);
end generate;

end ALU_arch;

