----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2022 16:05:17
-- Design Name: 
-- Module Name: pulseCleaner - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pulseCleaner is
    GENERIC(
        N: POSITIVE:=5
    );
    PORT(
        buttonIn : in STD_LOGIC_VECTOR (N-1 downto 0);
        pulse : out STD_LOGIC
    );
end pulseCleaner;

architecture Structural of pulseCleaner is
SIGNAL temp: STD_LOGIC_VECTOR(buttonIn'RANGE);
begin
    temp(0) <= buttonIn(0);
    gen: FOR i IN 1 TO N-1 GENERATE
        temp(i) <= temp(i-1) OR buttonIn(i);
    END GENERATE;
    pulse <= temp(N-1);
end Structural;
