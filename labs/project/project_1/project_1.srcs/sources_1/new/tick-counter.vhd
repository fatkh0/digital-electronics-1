library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- USE ieee.std_logic_unsigned.ALL;
-- use ieee.numeric_std.all;

entity tick_counter is
    generic(FrequencyHz : integer := 10);
    Port ( clk : in  STD_LOGIC;
           led : out  STD_LOGIC);
end tick_counter;

architecture Behavioral of tick_counter is
    -- Initial value of integers is INTEGER'LOW (a large negative number)
    signal tick:    integer range 0 to FrequencyHz - 1 := 0;
    signal counter: integer := 0;   -- ADDED default initial value
begin
    process(clk, tick, counter)
    begin
        if rising_edge(clk) then
            if tick = FrequencyHz - 1 then
                tick <= 0;
                if counter = 3 then  -- ADDED MODULUS 4 test for counter
                    counter <= 0;
                else
                    counter <= counter + 1;
                end if;
            else
                tick <= tick + 1;
            end if;
        end if;
    end process;

    led <= '1' when counter = 3 else '0';
end Behavioral;