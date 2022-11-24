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
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memoria is
    generic( 
        WIDTH: positive := 8 
    );
    Port ( 
        CLK         :   in std_logic;
        W_R         :   in std_logic;
        DATA_IN     :   in std_logic_vector(WIDTH-1 downto 0);
        DATA_OUT_1  :   out std_logic_vector(WIDTH-1 downto 0);
        DATA_OUT_2  :   out std_logic_vector(WIDTH-1 downto 0);
        LED         :   out std_logic
    );
end memoria;

architecture Behavioral of memoria is

type ram_type is array (2 downto 0) of std_logic_vector(7 downto 0);
signal ram: ram_type;
signal parpadeo: std_logic;
begin 
process(CLK)
begin
    if (CLK'event and CLK = '1') then
        if (W_R = '1') then
                ram(0) <= DATA_IN;
                if (parpadeo = '0') then
                        LED <= '1';
                        parpadeo <= '1';
                    else 
                        LED <= '0';
                        parpadeo <= '0';
                end if;
            else
                LED <= '0'; 
                DATA_OUT_1 <= ram(0);
                DATA_OUT_2 <= DATA_IN;
        end if;
    end if;
end process;
end Behavioral;
