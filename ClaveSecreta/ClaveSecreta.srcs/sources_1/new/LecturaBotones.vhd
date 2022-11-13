----------------------------------------------------------------------------------
-- Company: Universidad Politécnica De Madrid
-- Engineer: Leonel Alejandro Aguilera Correia
-- 
-- Create Date: 13.11.2022 17:06:55
-- Design Name: LecturaBotones
-- Module Name: LecturaBotones - Behavioral
-- Project Name: Clave Secreta
-- Target Devices: FPGA Nexys DDR4
-- Tool Versions: 1.0.0
-- Description: Conversor serie-paralelo de números enteros comprendidos entre 0 y N
-- 
-- Dependencies:
-- codificador.vhd
-- pulseCleaner.vhd
-- Integer_ShiftRegister.vhd
-- integerMemoryCell.vhd
--
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
package button_pkg is
    type button_array is array(natural range <>) of std_logic_vector;
end package;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all;
use work.button_pkg.all;

entity LecturaBotones is
    GENERIC(
        N_master: POSITIVE:=5;
        M_master: POSITIVE:=10
    );
    PORT(
        S_IN: IN std_logic_vector(N_master-1 DOWNTO 0);
        clr: IN std_logic;
        S_OUT: OUT button_array(M_master-1 DOWNTO 0)(INTEGER(CEIL(LOG2(REAL(N_master))))-1 DOWNTO 0)
    );
end LecturaBotones;

architecture Behavioral of LecturaBotones is
    COMPONENT pulseCleaner
        GENERIC(
            N: POSITIVE:=N_master
        );
        PORT(
            buttonIn : in STD_LOGIC_VECTOR (N-1 downto 0);
            pulse : out STD_LOGIC
        );
    END COMPONENT;
    COMPONENT codificador
        GENERIC(
            N: POSITIVE:=N_master
        );
        PORT(
            DIN : IN STD_LOGIC_VECTOR (N-1 downto 0);
            CLK: IN STD_LOGIC;
            COUT : OUT STD_LOGIC_VECTOR(INTEGER(CEIL(LOG2(REAL(N))))-1 downto 0)
        );
    END COMPONENT;
    COMPONENT Integer_ShiftRegister
        GENERIC(
            N: POSITIVE:=N_master;
            M: POSITIVE:=M_master
        );
        PORT(
            posIN : IN std_logic_vector(INTEGER(CEIL(LOG2(REAL(N))))-1 DOWNTO 0);
            clk : IN STD_LOGIC;
            clr : IN STD_LOGIC;
            posOUT : OUT button_array(M-1 DOWNTO 0)(INTEGER(CEIL(LOG2(REAL(N))))-1 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL clk: std_logic;
    SIGNAL data: STD_LOGIC_VECTOR(INTEGER(CEIL(LOG2(REAL(N_master))))-1 downto 0);
begin
cln: pulseCleaner PORT MAP(
    buttonIn => S_IN,
    pulse => clk
);
codif: codificador PORT MAP(
    DIN => S_IN,
    CLK => clk,
    COUT => data
);
sr: Integer_ShiftRegister PORT MAP(
    posIN => data,
    clk => clk,
    clr => clr,
    posOUT => S_out
);
end Behavioral;
