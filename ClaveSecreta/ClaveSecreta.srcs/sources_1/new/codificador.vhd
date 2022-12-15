----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2022 14:44:28
-- Design Name: 
-- Module Name: codificador - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all;
--use IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity codificador is
    GENERIC(
        N: POSITIVE:=5
    );
    PORT(
        DIN : IN STD_LOGIC_VECTOR (N-1 downto 0);
        CLK: IN STD_LOGIC;
        COUT : OUT STD_LOGIC_VECTOR(INTEGER(CEIL(LOG2(REAL(N))))-1 downto 0)
    );
end codificador;

architecture Behavioral of codificador is
begin
    process(CLK)
    VARIABLE COUT_temp: UNSIGNED(INTEGER(CEIL(LOG2(REAL(N))))-1 DOWNTO 0);
    begin
        IF CLK = '1' THEN
            FOR i IN 0 TO N-1 LOOP
                IF DIN(i) = '1' THEN
                    COUT_temp := to_unsigned(i,INTEGER(CEIL(LOG2(REAL(N)))));
                END IF;
            END LOOP;
        END IF;
        COUT <= STD_LOGIC_VECTOR(COUT_temp);         
    end process;
end Behavioral;
