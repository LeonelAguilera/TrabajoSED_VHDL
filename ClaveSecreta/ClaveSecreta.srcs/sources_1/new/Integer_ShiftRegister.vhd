----------------------------------------------------------------------------------
-- Company: Universidad Politécnica De Madrid
-- Engineer: Leonel Alejandro Aguilera Correia
-- 
-- Create Date: 13.11.2022 17:06:55
-- Design Name: LecturaBotones
-- Module Name: Integer_ShiftRegister - Structural
-- Project Name: Clave Secreta
-- Target Devices: FPGA Nexys DDR4
-- Tool Versions: 1.0.0
-- Description: Conversor serie-paralelo de números enteros comprendidos entre 0 y N
-- 
-- Dependencies: 
-- integerMemoryCell.vhd
--
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all;
use work.button_pkg.all;

entity Integer_ShiftRegister is
    GENERIC(
        N: POSITIVE:=5;
        M: POSITIVE:=10
    );
    PORT(
        posIN : IN std_logic_vector(INTEGER(CEIL(LOG2(REAL(N))))-1 DOWNTO 0);
        clk : IN STD_LOGIC;
        clr : IN STD_LOGIC;
        posOUT : OUT button_array(M-1 DOWNTO 0)(INTEGER(CEIL(LOG2(REAL(N))))-1 DOWNTO 0)
    );
end Integer_ShiftRegister;

architecture structural of Integer_ShiftRegister is
    COMPONENT integerMemoryCell
        GENERIC(
            N: POSITIVE:=5
        );
        PORT(
            posIN : in std_logic_vector(INTEGER(CEIL(LOG2(REAL(N))))-1 DOWNTO 0);
            clk : in STD_LOGIC;
            clr : in STD_LOGIC;
            posOUT : out std_logic_vector(INTEGER(CEIL(LOG2(REAL(N))))-1 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL preOut: button_array(M-1 DOWNTO 0)(INTEGER(CEIL(LOG2(REAL(N))))-1 DOWNTO 0);
begin
    gen: FOR i IN 0 TO M-1 GENERATE
        MC0: IF i = 0 GENERATE
            mc: integerMemoryCell port map(
                posIN => posIN,
                clk  => clk,
                clr => clr,
                posOUT => preOut(i)
            );
        END GENERATE MC0;
        MCN: IF i > 0 GENERATE
            mc: integerMemoryCell port map(
                posIN => preOut(i-1),
                clk  => clk,
                clr => clr,
                posOUT => preOut(i)
            );
        END GENERATE MCN;
    END GENERATE;
    posOUT <= preOut;
end structural;
