library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all;
use work.button_pkg.all;

entity tb_comparador is
end tb_comparador;

architecture tb of tb_comparador is

    component comparador
        GENERIC(
            N_master: POSITIVE:=5;
            M_master: POSITIVE:=10
        );
        port (A   : in button_array (m_master-1 downto 0)(integer(ceil(log2(real(n_master))))-1 downto 0);
              B   : in button_array (m_master-1 downto 0)(integer(ceil(log2(real(n_master))))-1 downto 0);
              LED : out std_logic);
    end component;

    signal A   : button_array (10-1 downto 0)(integer(ceil(log2(real(5))))-1 downto 0);
    signal B   : button_array (10-1 downto 0)(integer(ceil(log2(real(5))))-1 downto 0);
    signal LED : std_logic;

begin

    dut : comparador
    port map (A   => A,
              B   => B,
              LED => LED);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        A <= (others => "000");
        B <= (others => "000");

        -- EDIT Add stimuli here
        A<= ("001","001","100","001","001","100","000","101","110","110" );
        B<=("001","001","100","001","001","100","000","101","110","110" );
        wait for 50ns;
        A<= ("001","101","110","001","101","100","000","101","110","110" );
        B<=("011","101","110","001","101","100","100","101","010","110" );
        wait for 50ns;
        A<= ("011","001","010","001","101","100","000","101","110","110" );
        B<=("001","001","010","001","101","100","000","101","110","110" );
        wait for 50ns;
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_comparador of tb_comparador is
    for tb
    end for;
end cfg_tb_comparador;