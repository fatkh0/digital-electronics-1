library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_morse_t is
    -- Entity of testbench is always empty
end entity tb_morse_t;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_morse_t is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal s_clk_100MHz      : std_logic;
    signal s_reset			 : std_logic;
    signal s_key_to_conv     : std_logic_vector(5 downto 0);
    signal s_key_en          : std_logic;
    signal s_morse_o         : std_logic;

begin
    -- Connecting testbench signals with tlc entity
    -- (Unit Under Test)
    uut_morse_t : entity work.morse_t
        port map(
            clk    		=> s_clk_100MHz,
            reset		=> s_reset,
            key_to_conv => s_key_to_conv,
            key_en      => s_key_en,  
            morse_o 	=> s_morse_o
        );

    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 10000 ns loop -- 10 usec of simulation
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    p_reset_gen : process
    begin
        s_reset <= '1';
        wait for 10 ns;
        s_reset <= '0';
        wait;
    end process p_reset_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        s_key_to_conv  <= "110110"; 
        s_key_en       <= '1';
        wait;
    end process p_stimulus;

end architecture testbench;

