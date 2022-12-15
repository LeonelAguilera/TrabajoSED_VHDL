-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 15.12.2022 10:12:29 UTC

library ieee;
use ieee.std_logic_1164.all;
use IEEE.math_real.all;
use work.button_pkg.all;

entity tb_memoria is
end tb_memoria;

architecture tb of tb_memoria is

    component memoria
        port (W_R      : in std_logic;
              DATA_IN  : in button_array (9 downto 0)(integer(ceil(log2(real(5))))-1 downto 0);
              DATA_OUT : out button_array (9 downto 0)(integer(ceil(log2(real(5))))-1 downto 0);
              LED      : out std_logic);
    end component;

    signal W_R      : std_logic;
    signal DATA_IN  : button_array (9 downto 0)(integer(ceil(log2(real(5))))-1 downto 0);
    signal DATA_OUT : button_array (9 downto 0)(integer(ceil(log2(real(5))))-1 downto 0);
    signal LED      : std_logic;

begin

    dut : memoria
    port map (W_R      => W_R,
              DATA_IN  => DATA_IN,
              DATA_OUT => DATA_OUT,
              LED      => LED);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        W_R <= '0';
        DATA_IN <= ("000","000","000","000","000","000","000","000","000","000");
        wait for 50ns;
        W_R <= '1';
        wait for 50ns;
        W_R <= '0';
        
        DATA_IN <= ("001","000","000","000","000","000","000","000","000","000");
        wait for 50ns;
        DATA_IN <= ("011","001","000","000","000","000","000","000","000","000");
        wait for 50ns;
        DATA_IN <= ("010","011","001","000","000","000","000","000","000","000");
        wait for 50ns;
        DATA_IN <= ("101","010","011","001","000","000","000","000","000","000");
        wait for 50ns;
        DATA_IN <= ("000","000","000","000","000","000","000","000","000","000");
        
        W_R <= '1';
        wait for 50ns;
        
        DATA_IN <= ("001","000","000","000","000","000","000","000","000","000");
        wait for 50ns;
        DATA_IN <= ("011","001","000","000","000","000","000","000","000","000");
        wait for 50ns;
        DATA_IN <= ("010","011","001","000","000","000","000","000","000","000");
        wait for 50ns;
        DATA_IN <= ("101","010","011","001","000","000","000","000","000","000");
        wait for 50ns;
        
        W_R <= '0';
        
        

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_memoria of tb_memoria is
    for tb
    end for;
end cfg_tb_memoria;