# Lab 2: Erik Fatkhutdinov

### 2-bit comparator

1. Karnaugh maps for other two functions:

   Greater than:

   ![K-maps](images/kmap_empty.png)

   Less than:

   ![K-maps](images/kmap_empty.png)

2. Equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![Logic functions](images/comparator_min.png)

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx68**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case
        s_b <= "0110"; -- Such as "0110" if ID = xxxx56
        s_a <= "1000"; -- Such as "1000" if ID = xxxx56
        wait for 100 ns;
        -- Expected output
        assert (s_B_greater_A = '1')
        report "Input combination 0110, 1000. B is greater then A FAILED" severity error;
        
        assert (s_B_less_A    = '1')
        report "Input combination 0110, 1000. B is less then A FAILED" severity error;
        
        assert (s_B_equals_A  = '1') 
        report "Input combination 0110, 1000. B is equals A FAILED" severity error;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Text console screenshot during your simulation, including reports.

   ![your figure]()

3. Link to your public EDA Playground example:

   [https://www.edaplayground.com/x/hCuz](https://www.edaplayground.com/x/hCuz)
