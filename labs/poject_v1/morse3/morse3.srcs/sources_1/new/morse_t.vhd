    library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity morse_t is
	port(
	  		key_to_conv : in std_logic_vector(5 downto 0); 
	  		key_en      : in  std_logic;
	  		clk	        : in  std_logic;
        	reset       : in  std_logic;
	  		morse_o     : out std_logic	  		
		);
end entity morse_t;

architecture Behavioral of morse_t is 

	signal data  : std_logic_vector(19 downto 0); 
 	-- Internal clock enable
    signal s_en  : std_logic;
    -- Internal 2-bit counter for multiplexing 4 digits
    signal s_cnt : std_logic_vector(4 downto 0);


begin
    --------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates 
    -- an enable pulse every 4 ms
    clk_en0 : entity work.clock_enable
        generic map(
            -- FOR SIMULATION, CHANGE THIS VALUE TO 4
            -- FOR IMPLEMENTATION, KEEP THIS VALUE TO 400,000
            g_MAX => 20
        )
        port map(
            clk   => clk,
            reset => reset,
            ce_o  => s_en
        );

    --------------------------------------------------------
    -- Instance (copy) of cnt_up_down entity performs a 5-bit
    -- up counter
    bin_cnt0 : entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH => 5
        )
        port map(
            clk  => clk,
        reset    => reset,
        en_i     => s_en,
        cnt_up_i => '0',
        cnt_o    => s_cnt
        );
        
--    input : entity work.ps2_con
--        generic map(
--            clk25  => clk,
--        );

	conv : process(key_to_conv, key_en)
		begin
--			case key_to_conv is
--				when X"1C" =>  --A
--                    data <= "10111000000000000000";
--				when X"32" =>  --B
--	               data <= "11101010100000000000";  
--                when X"21" =>  --C
--                    data <= "11101011101000000000"; 
--                when X"23" =>  --D
--                    data <= "11101010000000000000"; 
--                when X"24" =>  --E
--                    data <= "10000000000000000000";
--                when X"2B" =>  --F
--                    data <= "10101110100000000000";
--                when X"34" =>  --G
--                    data <= "11101110100000000000";
--                when X"33" =>  --H
--                    data <= "10101010000000000000";
--                when X"43" =>  --I
--                    data <= "10101110000000000000";
--                when X"3B" =>  --J
--                    data <= "10111011101110000000";
--                when X"42" =>  --K
--                    data <= "11101011100000000000";
--                when X"4B" =>  --L
--                    data <= "10111010100000000000";
--                when X"3A" =>  --M
--                    data <= "11101110000000000000";
--                when X"31" =>  --N
--                    data <= "11101000000000000000";
--                when X"44" =>  --O
--                    data <= "11101110111000000000";
--                when X"4D" =>  --P
--                    data <= "10111011101000000000";
--                when X"15" =>  --Q
--                    data <= "11101110101110000000";
--                when X"2D" =>  --R
--                    data <= "10111010000000000000";
--                when X"1B" =>  --S
--                    data <= "10101000000000000000";
--                when X"2C" =>  --T
--                    data <= "11100000000000000000";
--                when X"3C" =>  --U
--                    data <= "10101110000000000000";
--                when X"2A" =>  --V
--                    data <= "10101011100000000000";
--                when X"1D" =>  --W
--                    data <= "10111011100000000000";
--                when X"22" =>  --X
--                    data <= "11101010111000000000";
--                when X"35" =>  --Y
--                    data <= "11101011101110000000";
--                when X"1A" =>  --Z
--                    data <= "11101110101000000000";
                    
--                when X"16" =>  --1
--                    data <= "10111011101110111000";
--                when X"1E" =>  --2
--                    data <= "10101110111011100000";
--                when X"26" =>  --3
--                    data <= "10101011101110000000";
--                when X"25" =>  --4
--                    data <= "10101010111000000000";
--                when X"2E" =>  --5
--                    data <= "10101010100000000000";
--                when X"36" =>  --6
--                    data <= "11101010101000000000";
--                when X"3D" =>  --7
--                    data <= "11101110101010000000";
--                when X"3E" =>  --8
--                    data <= "11101110111010100000";
--                when X"46" =>  --9
--                    data <= "11101110111011101000";
--                when X"45" =>  --0
--                    data <= "11101110111011101110";
        if (key_en = '1') then
            case key_to_conv is
                when "100000" =>  --A
                    data <= "10111000000000000000";
				when "100001" =>  --B
	               data <= "11101010100000000000";  
                when "100010" =>  --C
                    data <= "11101011101000000000"; 
                when "100011" =>  --D
                    data <= "11101010000000000000"; 
                when "100100" =>  --E
                    data <= "10000000000000000000";
                when "100101" =>  --F
                    data <= "10101110100000000000";
                when "100110" =>  --G
                    data <= "11101110100000000000";
                when "100111" =>  --H
                    data <= "10101010000000000000";
                when "101000" =>  --I
                    data <= "10101110000000000000";
                when "101001" =>  --J
                    data <= "10111011101110000000";
                when "101010" =>  --K
                    data <= "11101011100000000000";
                when "101011" =>  --L
                    data <= "10111010100000000000";
                when "101100" =>  --M
                    data <= "11101110000000000000";
                when "101101" =>  --N
                    data <= "11101000000000000000";
                when "101110" =>  --O
                    data <= "11101110111000000000";
                when "101111" =>  --P
                    data <= "10111011101000000000";
                when "110000" =>  --Q
                    data <= "11101110101110000000";
                when "110001" =>  --R
                    data <= "10111010000000000000";
                when "110010" =>  --S
                    data <= "10101000000000000000";
                when "110011" =>  --T
                    data <= "11100000000000000000";
                when "110100" =>  --U
                    data <= "10101110000000000000";
                when "110101" =>  --V
                    data <= "10101011100000000000";
                when "110110" =>  --W
                    data <= "10111011100000000000";
                when "110111" =>  --X
                    data <= "11101010111000000000";
                when "111000" =>  --Y
                    data <= "11101011101110000000";
                when "111001" =>  --Z
                    data <= "11101110101000000000";
                    
                when "000001" =>  --1
                    data <= "10111011101110111000";
                when "000010" =>  --2
                    data <= "10101110111011100000";
                when "000011" =>  --3
                    data <= "10101011101110000000";
                when "000100" =>  --4
                    data <= "10101010111000000000";
                when "000101" =>  --5
                    data <= "10101010100000000000";
                when "000110" =>  --6
                    data <= "11101010101000000000";
                when "000111" =>  --7
                    data <= "11101110101010000000";
                when "001000" =>  --8
                    data <= "11101110111010100000";
                when "001001" =>  --9
                    data <= "11101110111011101000";
                when "000000" =>  --0
                    data <= "11101110111011101110";
                when others => 
                    data <= "00000000000000000000";		    
			end case;
		end if;
	end process conv;
    
    
displ : process(clk)
    begin
	if rising_edge(clk)then
    	if (reset = '1') then
        	morse_o <= '0';
        else
	   		case s_cnt is
            	when "01100" =>
                	morse_o <= data(0);
           		when "01101" =>
                	morse_o <= data(1);
                when "01110" =>
                	morse_o <= data(2);
                when "01111" =>
                	morse_o <= data(3);
                when "10000" =>
                	morse_o <= data(4);
                when "10001" =>
                	morse_o <= data(5);
                when "10010" =>
                	morse_o <= data(6);
                when "10011" =>
                	morse_o <= data(7);
                when "10100" =>
                	morse_o <= data(8);
                when "10101" =>
                	morse_o <= data(9);
                when "10110" =>
                	morse_o <= data(10);
                when "10111" =>
                	morse_o <= data(11);
                when "11000" =>
                	morse_o <= data(12);
                when "11001" =>
                	morse_o <= data(13);
                when "11010" =>
                	morse_o <= data(14);
                when "11011" =>
                	morse_o <= data(15);
                when "11100" =>
                	morse_o <= data(16);
                when "11101" =>
                	morse_o <= data(17);
                when "11110" =>
                	morse_o <= data(18);
                when "11111" =>
                	morse_o <= data(19);
                when others =>
                	morse_o <= '0';
        	end case;    
        end if;
	end if;
	end process displ;
end architecture Behavioral;