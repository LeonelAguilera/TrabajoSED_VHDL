-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 15.12.2022 10:33:35 UTC

library ieee;
use ieee.std_logic_1164.all;
use IEEE.math_real.all;
use work.button_pkg.all;

entity tb_LecturaBotones is
end tb_LecturaBotones;

architecture tb of tb_LecturaBotones is

    component LecturaBotones
        port (S_IN  : in std_logic_vector (4 downto 0);
              clr   : in std_logic;
              P_OUT : out button_array (9 downto 0)(integer(ceil(log2(real(5))))-1 downto 0));
    end component;

    signal S_IN  : std_logic_vector (4 downto 0);
    signal clr   : std_logic;
    signal P_OUT : button_array (9 downto 0)(integer(ceil(log2(real(5))))-1 downto 0);

begin

    dut : LecturaBotones
    port map (S_IN  => S_IN,
              clr   => clr,
              P_OUT => P_OUT);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        S_IN <= (others => '0');
        clr <= '0';
        wait for 25ns;
        clr <= '1';
        wait for 25ns;
        clr <= '0';

        -- EDIT Add stimuli here
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00001";
        wait for 50ns;
        S_IN <= "00000";
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
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "01000";
        wait for 50ns;
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00100";
        wait for 50ns;
        S_IN <= "00010";
        wait for 50ns;
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00001";
        wait for 50ns;
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00100";
        wait for 50ns;
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "00000";
        wait for 50ns;
        S_IN <= "01000";
        wait for 50ns;
        S_IN <= "00000";
        wait for 50ns;
        

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_LecturaBotones of tb_LecturaBotones is
    for tb
    end for;
end cfg_tb_LecturaBotones;