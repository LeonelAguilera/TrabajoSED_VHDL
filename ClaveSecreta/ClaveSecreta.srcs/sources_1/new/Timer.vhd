----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2022 18:25:08
-- Design Name: 
-- Module Name: Timer - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity Timer is
    PORT(
        CLK: IN std_logic;
        RST: OUT std_logic
    );
end Timer;

architecture Behavioral of Timer is
CONSTANT Tmax: INTEGER := 7500000;
SIGNAL T: UNSIGNED(INTEGER(CEIL(LOG2(REAL(Tmax))))-1 DOWNTO 0);
begin
    T <= T+1 MOD Tmax WHEN (CLK'event AND CLK = '1');
    RST <= '1' WHEN (T = 0) ELSE
           '0';
end Behavioral;
