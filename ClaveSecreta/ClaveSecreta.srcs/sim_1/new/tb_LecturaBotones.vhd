library ieee;
use ieee.std_logic_1164.all;
use IEEE.math_real.all;
use work.button_pkg.all;

entity tb_LecturaBotones is
    GENERIC(
        N_master: POSITIVE:=5;
        M_master: POSITIVE:=10
    );
end tb_LecturaBotones;

architecture tb of tb_LecturaBotones is

    component LecturaBotones
        port (S_IN  : in std_logic_vector (4 downto 0);
              clr   : in std_logic;
              S_OUT : out button_array (9 downto 0)(integer(ceil(log2(real(5))))-1 downto 0));
    end component;

    signal S_IN  : std_logic_vector (4 downto 0);
    signal clr   : std_logic;
    signal S_OUT : button_array (9 downto 0)(integer(ceil(log2(real(5))))-1 downto 0);

    constant TbPeriod : time := 100 ns; 
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : LecturaBotones
    port map (S_IN  => S_IN,
              clr   => clr,
              S_OUT => S_OUT);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    stimuli : process
    begin
        S_IN <= (others => '0');
        clr <= '1';
        wait for 100 ns;
        clr <= '0';
        wait for 100 ns;

        wait for 100 * TbPeriod;

        TbSimEnded <= '1';
        wait;
    end process;

end tb;