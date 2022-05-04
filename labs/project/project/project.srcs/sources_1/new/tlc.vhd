------------------------------------------------------------
--
-- Traffic light controller using FSM.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
-- This code is inspired by:
-- [1] LBEbooks, Lesson 92 - Example 62: Traffic Light Controller
--     https://www.youtube.com/watch?v=6_Rotnw1hFM
-- [2] David Williams, Implementing a Finite State Machine in VHDL
--     https://www.allaboutcircuits.com/technical-articles/implementing-a-finite-state-machine-in-vhdl/
-- [3] VHDLwhiz, One-process vs two-process vs three-process state machine
--     https://vhdlwhiz.com/n-process-state-machine/
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------
-- Entity declaration for traffic light controller
------------------------------------------------------------


entity tlc is
    port(
        clk     : in  std_logic;
        reset   : in  std_logic;
        -- Traffic lights (RGB LEDs) for two directions
        go_o : out std_logic
    );
end entity tlc;

------------------------------------------------------------
-- Architecture declaration for traffic light controller
------------------------------------------------------------
architecture Behavioral of tlc is

    -- Define the states
    type t_state is (STOP1,
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    H,
    I,
    J,
    K,
    L,
    M,
    N,
    O,
    P,
    Q, 
    R,
    S,
    T,
    U,
    V,
    W,
    X,
    Y,
    Z,
    
                     GO);
    -- Define the signal that uses different states
    signal s_state : t_state;

    -- Internal clock enable
    signal s_en : std_logic;

    -- Local delay counter
    signal s_cnt : unsigned(4 downto 0);
    
    signal counter: integer := 0;

    -- Specific values for local counter
    constant c_DELAY_7SEC : unsigned(4 downto 0) := b"1_1100";
    constant c_DELAY_3SEC : unsigned(4 downto 0) := b"0_1100";
    constant DASH : unsigned(4 downto 0) := b"0_1100";
    constant c_DELAY_1SEC : unsigned(4 downto 0) := b"0_0100";
    constant DOT : unsigned(4 downto 0) := b"0_0100";
    constant c_ZERO       : unsigned(4 downto 0) := b"0_0000";

    -- Output values
    constant c_RED        : std_logic_vector(2 downto 0) := b"100";
    

begin

    --------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates 
    -- an enable pulse every 250 ms (4 Hz). Remember that 
    -- the frequency of the clock signal is 100 MHz.
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 1  -- FOR SIMULATION PURPOSE ONLY !!!
            -- FOR IMPLEMENTATION: g_MAX = 250 ms / (1/100 MHz)
        )
        port map(
            clk   => clk,
            reset => reset,
            ce_o  => s_en
        );

    --------------------------------------------------------
    -- p_traffic_fsm:
    -- The sequential process with synchronous reset and 
    -- clock_enable entirely controls the s_state signal by 
    -- CASE statement.
    --------------------------------------------------------
    
    
    p_traffic_fsm : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then   -- Synchronous reset
                s_state <= STOP1;   -- Set initial state
                s_cnt   <= c_ZERO;  -- Clear delay counter

            elsif (s_en = '1') then
                -- Every 250 ms, CASE checks the value of the s_state 
                -- variable and changes to the next state according 
                -- to the delay value.
                case s_state is

                    -- If the current state is STOP1, then wait 1 sec
                    -- and move to the next GO_WAIT state.
                    when A =>
                        
                        -- Count up to c_DELAY_1SEC
                        if (s_cnt < DOT and counter = 0) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= A;
                            counter <= counter + 1;
                            -- Reset local counter value
                            s_cnt <= c_ZERO;
                        end if;
                        
                        if (s_cnt < c_DELAY_1SEC and counter = 1) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= A;
                            counter <= counter + 1;
                            -- Reset local counter value
                            s_cnt <= c_ZERO;
                        end if;
                        
                        if (s_cnt < DASH and counter = 2) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= A;
                            counter <= counter + 1;
                            -- Reset local counter value
                            s_cnt <= c_ZERO;
                        end if;
                        
                        if (s_cnt < c_DELAY_3SEC and counter = 3) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= STOP1;
                            counter <= 0;
                            -- Reset local counter value
                            s_cnt <= c_ZERO;
                        end if;
          -------------------------------------------------------------------------------------------      
                    when B => 
                        if (s_cnt < DASH and counter = 0) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= B;
                            counter <= counter + 1;
                            -- Reset local counter value
                            s_cnt <= c_ZERO;
                        end if;
                        
                        if (s_cnt < c_DELAY_1SEC and counter = 1) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= B;
                            counter <= counter + 1;
                            -- Reset local counter value
                            s_cnt <= c_ZERO;
                        end if;
                        
                        if (s_cnt < DOT and counter = 0) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= B;
                            counter <= counter + 1;
                            -- Reset local counter value
                            s_cnt <= c_ZERO;
                        end if;
                        
                        if (s_cnt < c_DELAY_1SEC and counter = 1) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= B;
                            counter <= counter + 1;
                            -- Reset local counter value
                            s_cnt <= c_ZERO;
                        end if;
                        
                        if (s_cnt < DOT and counter = 0) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= B;
                            counter <= counter + 1;
                            -- Reset local counter value
                            s_cnt <= c_ZERO;
                        end if;
                        
                        if (s_cnt < c_DELAY_1SEC and counter = 1) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= B;
                            counter <= counter + 1;
                            -- Reset local counter value
                            s_cnt <= c_ZERO;
                        end if;
                        
                        if (s_cnt < DOT and counter = 0) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= B;
                            counter <= counter + 1;
                            -- Reset local counter value
                            s_cnt <= c_ZERO;
                        end if;
                        
                         if (s_cnt < c_DELAY_3SEC and counter = 3) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= STOP1;
                            counter <= 0;
                            -- Reset local counter value
                            s_cnt <= c_ZERO;
                        end if;
                      -------------------------------------------------------------------------------------------      
                      
                      when C =>
                          

                    when others =>
                        s_state <= STOP1;
                        s_cnt   <= c_ZERO;
                end case;
            end if; -- Synchronous reset
        end if; -- Rising edge
    end process p_traffic_fsm;

    --------------------------------------------------------
    -- p_output_fsm:
    -- The combinatorial process is sensitive to state
    -- changes and sets the output signals accordingly.
    -- This is an example of a Moore state machine and
    -- therefore the output is set based on the active state.
    --------------------------------------------------------
    p_output_fsm : process(s_state)
    begin
        case s_state is
            when STOP1 =>
                go_o <= c_GREEN;
                
            when A =>
                go_o <= c_RED;
                
            
            when others =>
                go_o <= c_RED;
        end case;
    end process p_output_fsm;

end architecture Behavioral;
