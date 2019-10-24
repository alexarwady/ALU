library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity AtimesB1 is port (
			A: IN STD_LOGIC_VECTOR(31 downto 0);
			B: IN STD_LOGIC_VECTOR(31 downto 0);
                        E: IN STD_LOGIC;
			P: OUT STD_LOGIC_VECTOR(63 downto 0)
			);
end AtimesB1;

architecture AtimesB1_arch of AtimesB1 is

function atLeast2 (i,j,k: STD_LOGIC) return STD_LOGIC is
begin
	return ((i and j) or (i and k) or (j and k));
end atLeast2;

signal PROD: STD_LOGIC_VECTOR(63 downto 0);

begin
	process (A, B)
	type eightByeight is array (31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
	variable products: eightByeight;
	variable sums: eightByeight;
	variable carrys: eightByeight;
	variable rSum, rCarry: STD_LOGIC_VECTOR(31 downto 0);
	begin
	
		for i in 0 to 31 loop
			for j in 0 to 31 loop
				products(i)(j) := (B(i) and A(j));
			end loop;
		end loop;
	
		for i in 0 to 31 loop
			sums(0)(i) := products(0)(i);
			carrys(0)(i) := '0';
		end loop;

		for i in 1 to 31 loop
			for j in 0 to 30 loop
				sums(i)(j) := (products(i)(j) XOR sums(i-1)(j+1) XOR carrys(i-1)(j));
				carrys(i)(j) := atLeast2(products(i)(j), sums(i-1)(j+1), carrys(i-1)(j));
				sums(i)(31) := products(i)(31);
			end loop;
		end loop;

		rCarry(0) := '0';
		
		for i in 0 to 30 loop
			rSum(i) := (sums(31)(i+1) XOR carrys(7)(i) XOR rCarry(i));
			rCarry(i+1) := atLeast2(sums(31)(i+1), carrys(7)(i), rCarry(i));
		end loop;
		
		for i in 0 to 31 loop
			PROD(i) <= sums(i)(0);
		end loop;

		for i in 32 to 62 loop
			PROD(i) <=rSum(i-32);
		end loop;

		PROD(63) <= rCarry(31);
	end process;

P<="0000000000000000000000000000000000000000000000000000000000000000" when E='0'
else PROD;

end AtimesB1_arch;



