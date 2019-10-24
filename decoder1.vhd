library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
   Port (A:in STD_LOGIC_VECTOR(3 downto 0);
         E:in STD_LOGIC;
         B:out STD_LOGIC_VECTOR(15 downto 0)    );
end decoder;

architecture arch_decoder of decoder is
signal Bs:STD_LOGIC_VECTOR(15 downto 0);

begin
process(E,A)
begin
Bs<=(others=>'0');
IF E = '1'   THEN 
CASE  A  IS
		WHEN "0000"  =>  Bs<=(0=>'1',others=>'0');
		WHEN "0001"  =>  Bs<=(1=>'1',others=>'0');
		WHEN "0010"  =>  Bs<=(2=>'1',others=>'0');
		WHEN "0011"  =>  Bs<=(3=>'1',others=>'0');
		WHEN "0100"  =>  Bs<=(4=>'1',others=>'0');
		WHEN "0101"  =>  Bs<=(5=>'1',others=>'0');
		WHEN "0110"  =>  Bs<=(6=>'1',others=>'0');
		WHEN "0111"  =>  Bs<=(7=>'1',others=>'0');
		WHEN "1000"  =>  Bs<=(8=>'1',others=>'0');
        WHEN "1001"  =>  Bs<=(9=>'1',others=>'0');
        WHEN "1010"  =>  Bs<=(10=>'1',others=>'0');
        WHEN "1011"  =>  Bs<=(11=>'1',others=>'0');
        WHEN "1100"  =>  Bs<=(12=>'1',others=>'0');
        WHEN "1101"  =>  Bs<=(13=>'1',others=>'0');
        WHEN "1110"  =>  Bs<=(14=>'1',others=>'0');
        WHEN "1111"  =>  Bs<=(15=>'1',others=>'0');
        when others  =>  Bs<=(others=>'0');
	    END CASE ;
else  Bs<=(others=>'0');
END IF ;
end process;
B<=Bs;
end arch_decoder;

