library IEEE;
use IEEE.std_logic_1164.all;

package button_pkg is
    type button_array is array(natural range <>) of std_logic_vector;
end package;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all;
use work.button_pkg.all;

ENTITY comparador IS
	GENERIC(
        N_master: POSITIVE:=5;
        M_master: POSITIVE:=10
    );
	PORT(
		A,B: IN button_array(M_master-1 DOWNTO 0)(INTEGER(CEIL(LOG2(REAL(N_master))))-1 DOWNTO 0);
        LED: OUT STD_LOGIC
   	 );

END ENTITY;

ARCHITECTURE arch1 OF comparador IS

BEGIN
LED<= '1' WHEN A = B ELSE
  	  '0';
END ARCHITECTURE ARCH1;