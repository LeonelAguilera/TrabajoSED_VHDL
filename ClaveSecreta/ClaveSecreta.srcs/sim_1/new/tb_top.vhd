-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 22.12.2022 16:49:37 UTC

library ieee;
use ieee.std_logic_1164.all;
use IEEE.math_real.all;
use work.button_pkg.all;

entity tb_top is
    GENERIC(
        N_master: POSITIVE:=5;
        M_master: POSITIVE:=10
    );
end tb_top;

architecture tb of tb_top is

    component top
        port (S_IN            : in std_logic_vector (n_master-1 downto 0);
              RESET           : in std_logic;
              CLK100MHZ       : in std_logic;
              CC              : in std_logic;
              LED_OUTPUT      : out std_logic;
              LED_CC          : out std_logic;
              RESET_INDICATOR : out std_logic;
              MEMORIA_tb      : out button_array (m_master-1 downto 0)(integer(ceil(log2(real(n_master))))-1 downto 0);
              PARALLEL_BUS_tb : out button_array (m_master-1 downto 0)(integer(ceil(log2(real(n_master))))-1 downto 0));
    end component;

    signal S_IN            : std_logic_vector (n_master-1 downto 0);
    signal RESET           : std_logic;
    signal CLK100MHZ       : std_logic;
    signal CC              : std_logic;
    signal LED_OUTPUT      : std_logic;
    signal LED_CC          : std_logic;
    signal RESET_INDICATOR : std_logic;
    signal MEMORIA_tb      : button_array (m_master-1 downto 0)(integer(ceil(log2(real(n_master))))-1 downto 0);
    signal PARALLEL_BUS_tb : button_array (m_master-1 downto 0)(integer(ceil(log2(real(n_master))))-1 downto 0);

begin

    dut : top
    port map (S_IN            => S_IN,
              RESET           => RESET,
              CLK100MHZ       => CLK100MHZ,
              CC              => CC,
              LED_OUTPUT      => LED_OUTPUT,
              LED_CC          => LED_CC,
              RESET_INDICATOR => RESET_INDICATOR,
              MEMORIA_tb      => MEMORIA_tb,
              PARALLEL_BUS_tb => PARALLEL_BUS_tb);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        S_IN <= (others => '0');
        RESET <= '0';
        CLK100MHZ <= '0';
        CC <= '0';
        RESET <= '1';
        wait for 50ns;
        RESET <= '0';
        wait for 50ns;

        -- EDIT Add stimuli here
         CC <= '1';
        wait for 50ns;
        
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00001";
        wait for 50ns;
        
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00010";
        wait for 50ns;
        
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00100";
        wait for 50ns;
        
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "01000";
        wait for 50ns;
        
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "10000";
        wait for 50ns;
        
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00100";
        wait for 50ns;
        
        S_IN <= "00000";
        wait for 50ns;
        
        CC <= '0';
        wait for 50ns;
        RESET <= '1';
        wait for 50ns;
        RESET <= '0';
        wait for 50ns;
        
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00001";
        wait for 50ns;
        
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00010";
        wait for 50ns;
        
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00100";
        wait for 50ns;
        
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "01000";
        wait for 50ns;
        
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "10000";
        wait for 50ns;
        
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00100";
        wait for 50ns;
        
        S_IN <= "00000";
        wait for 50ns;
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_top of tb_top is
    for tb
    end for;
end cfg_tb_top;