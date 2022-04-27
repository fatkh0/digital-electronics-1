----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2022 03:46:06 PM
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port (  CLK100MHZ   : in STD_LOGIC;
            BTNC        : in STD_LOGIC;
            SW          : in std_logic_vector(6 downto 0);
            LED16_B     : out std_logic
          );
end top;

architecture Behavioral of top is
begin
morse_tt : entity work.morse_t
port map (           
            clk          => CLK100MHZ,
          reset          => BTNC,
          key_to_conv(0) => SW(0),
          key_to_conv(1) => SW(1),
          key_to_conv(2) => SW(2),
          key_to_conv(3) => SW(3),
          key_to_conv(4) => SW(4),
          key_to_conv(5) => SW(5),
          key_en         => SW(6),
          morse_o        => LED16_B
);
end architecture Behavioral;
