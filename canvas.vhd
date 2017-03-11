----------------------------------------------------------------------------------
-- Engineer: 	   Matjaz Mav
-- Create Date:    02/04/2017 
-- Module Name:    canvas - Behavioral 
-- Target Devices: 
-- Description: 
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity canvas is
    port (
        clk_i : in std_logic;
        reset_i : in std_logic;

        write_enable_head_i : in std_logic;
        write_data_head_i : in std_logic_vector (0 to 79);
        write_address_head_i : in integer range 0 to 29;

        read_address_screen_i : in integer range 0 to 29;
        read_data_screen_o : out std_logic_vector (0 to 79);

        read_address_head_i : in integer range 0 to 29;
        read_data_head_o : out std_logic_vector (0 to 79)
    );
end canvas;

architecture Behavioral of canvas is
    -- x       | y  | block_t
    -- 20 (40) | 15 | HEAD
    -- 21 (42) | 15 | TAIL      <--- no tail
    type canvas_t is array (0 to 29) of std_logic_vector (0 to 79);
    signal canvas_data : canvas_t := (
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000100000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000",
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    );
begin

    write_head : process( clk_i )
    begin
        if rising_edge( clk_i ) then
            if write_enable_head_i = '1' then
                canvas_data(write_address_head_i) <= write_data_head_i;
            end if ;
        end if ;
    end process ; -- write_head

    read_data_screen_o <= canvas_data(read_address_screen_i);
    read_data_head_o <= canvas_data(read_address_head_i);

end Behavioral;