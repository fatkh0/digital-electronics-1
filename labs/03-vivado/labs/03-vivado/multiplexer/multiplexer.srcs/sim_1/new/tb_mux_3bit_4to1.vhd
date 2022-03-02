------------------------------------------------------------
--
-- Testbench for 4-bit binary comparator.
-- EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_comparator_2bit is
    -- Entity of testbench is always empty
end entity tb_comparator_2bit;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_mux_3bit_4to1 is

    -- Local signals
    signal a_i           : std_logic_vector(3 - 1 downto 0);
    signal b_i           : std_logic_vector(3 - 1 downto 0);
    signal c_i           : std_logic_vector(3 - 1 downto 0);
    signal d_i           : std_logic_vector(3 - 1 downto 0);
    signal sel_i         : std_logic_vector(3 - 1 downto 0);
    
    signal s_B_greater_A : std_logic;
    signal s_B_equals_A  : std_logic;
    signal s_B_less_A    : std_logic;

begin
    -- Connecting testbench signals with comparator_2bit
    -- entity (Unit Under Test)
    uut_comparator_2bit : entity work.tb_mux_3bit_4to1
        port map(
            a_i           => s_a,
            b_i           => s_b,
            c_i           => s_c,
            d_i           => s_d,
            sel_i         => s_sel,
            f_o           => s_f
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case ...
        s_b <= "0110"; -- Such as "0110" if ID = xxxx86
        s_a <= "1000"; -- Such as "1000" if ID = xxxx86
        wait for 100 ns; 
        
        -- ... and its expected outputs
        assert (s_B_greater_A = '1')
        report "Input combination 0110, 1000. B is greater then A FAILED" severity error;
        
        assert (s_B_less_A    = '1')
        report "Input combination 0110, 1000. B is less then A FAILED" severity error;
        
        assert (s_B_equals_A  = '1') 
        report "Input combination 0110, 1000. B is equals then A FAILED" severity error;


        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;

        -- WRITE OTHER TEST CASES HERE



        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait; -- Data generation process is suspended forever
    end process p_stimulus;

end architecture testbench;
