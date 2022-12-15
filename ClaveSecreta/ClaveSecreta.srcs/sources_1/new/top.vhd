----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2022 18:07:45
-- Design Name: 
-- Module Name: top - Behavioral
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
use work.button_pkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    GENERIC(
        N_master: POSITIVE:=5;
        M_master: POSITIVE:=10
    );
    PORT(
        S_IN: IN std_logic_vector(N_master-1 DOWNTO 0);
        RESET: IN std_logic;
        CLK100MHZ: IN std_logic;
        CC: IN std_logic;
        LED_OUTPUT: OUT std_logic
    );
end top;

architecture Behavioral of top is
    COMPONENT LecturaBotones
        GENERIC(
            N_master: POSITIVE:=5;
            M_master: POSITIVE:=10
        );
        PORT(
            S_IN: IN std_logic_vector(N_master-1 DOWNTO 0);
            clr: IN std_logic;
            P_OUT: OUT button_array(M_master-1 DOWNTO 0)(INTEGER(CEIL(LOG2(REAL(N_master))))-1 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT comparador
        GENERIC(
            N_master: POSITIVE:=5;
            M_master: POSITIVE:=10
        );
        PORT(
            A,B: IN button_array(M_master-1 DOWNTO 0)(INTEGER(CEIL(LOG2(REAL(N_master))))-1 DOWNTO 0);
            LED: OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT memoria
        GENERIC(
            N_master: POSITIVE:=5;
            M_master: POSITIVE:=10
        );
        Port (
            W_R         :   in std_logic;
            DATA_IN     :   in button_array(M_master-1 DOWNTO 0)(INTEGER(CEIL(LOG2(REAL(N_master))))-1 DOWNTO 0);
            DATA_OUT    :   out button_array(M_master-1 DOWNTO 0)(INTEGER(CEIL(LOG2(REAL(N_master))))-1 DOWNTO 0);
            LED         :   out std_logic
        );
    END COMPONENT;
    COMPONENT Timer
        PORT(
            CLK: IN std_logic;
            RST: OUT std_logic
        );
    END COMPONENT;
    
    SIGNAL LED_1: std_logic;
    SIGNAL LED_2: std_logic;
    
    SIGNAL RESET_IN: std_logic;
    SIGNAL RESET_OUT: std_logic;
    
    SIGNAL PARALLEL_BUS: button_array(M_master-1 DOWNTO 0)(INTEGER(CEIL(LOG2(REAL(N_master))))-1 DOWNTO 0);
    SIGNAL PARALLEL_MEMORY: button_array(M_master-1 DOWNTO 0)(INTEGER(CEIL(LOG2(REAL(N_master))))-1 DOWNTO 0);
begin
    lb: LecturaBotones PORT MAP(
        S_IN => S_IN,
        clr => RESET_IN,
        P_OUT => PARALLEL_BUS
    );
    comp: comparador PORT MAP(
        A => PARALLEL_BUS,
        B => PARALLEL_MEMORY,
        LED => LED_2
    );
    mem: memoria PORT MAP(
        W_R => CC,
        DATA_IN => PARALLEL_BUS,
        DATA_OUT => PARALLEL_MEMORY,
        LED => LED_1
    );
    my_timer: Timer PORT MAP(
        CLK => CLK100MHZ,
        RST => RESET_OUT
    );
    RESET_IN <= RESET_OUT OR RESET;
    LED_OUTPUT <= LED_1 OR LED_2;
end Behavioral;
