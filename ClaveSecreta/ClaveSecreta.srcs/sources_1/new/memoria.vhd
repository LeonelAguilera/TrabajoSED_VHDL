----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2022 12:03:15
-- Design Name: 
-- Module Name: TrabajoVHDL - Behavioral
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

entity memoria is
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
end memoria;

architecture Behavioral of memoria is
signal RAM: button_array(M_master-1 DOWNTO 0)(INTEGER(CEIL(LOG2(REAL(N_master))))-1 DOWNTO 0);
begin
    RAM <= DATA_IN WHEN W_R'event AND W_R = '0';
    DATA_OUT <= RAM;
    LED <= W_R;
end Behavioral;
