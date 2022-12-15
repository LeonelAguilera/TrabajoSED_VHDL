----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2022 16:26:06
-- Design Name: 
-- Module Name: positiveMemoryCell - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity integerMemoryCell is
    GENERIC(
        N: POSITIVE:=5
    );
    PORT(
        posIN : in std_logic_vector(INTEGER(CEIL(LOG2(REAL(N))))-1 DOWNTO 0);
        clk : in STD_LOGIC;
        clr : in STD_LOGIC;
        posOUT : out std_logic_vector(INTEGER(CEIL(LOG2(REAL(N))))-1 DOWNTO 0)
    );
end integerMemoryCell;

architecture Behavioral of integerMemoryCell is
SIGNAL pos_temp: std_logic_vector(posIN'RANGE);
begin
    pos_temp <= (OTHERS => '0') WHEN clr = '1' ELSE
                posIN WHEN clk'event AND clk = '0' ELSE
                pos_temp;
                
    posOUT <= pos_temp;
end Behavioral;
