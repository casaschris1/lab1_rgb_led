----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/13/2026 08:18:45 PM
-- Design Name: 
-- Module Name: tb_rgb_led_top - Behavioral
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



entity tb_rgb_led_top is
end tb_rgb_led_top;

architecture Behavioral of tb_rgb_led_top is
signal sys_clk : std_logic := '0';
signal rst     : std_logic := '1';
signal sw      : std_logic_vector(2 downto 0) := "000";
signal rgb_out : std_logic_vector(2 downto 0);
constant CLK_PERIOD : time := 8 ns;

begin
uut : entity work.rgb_led_top
generic map (
CLK_CYCLES_PER_TOGGLE => 10
)
port map ( 
  sys_clk => sys_clk,
  rst     => rst,
  sw      => sw,
  rgb_out => rgb_out
  );
  -- 125MHz clock generation
  clock_process : process
  begin 
    sys_clk <= '0';
    wait for CLK_PERIOD / 2;
    sys_clk <= '1';
    wait for CLK_PERIOD / 2;
    end process;
  -- Test stimulus
  stimulus_process : process
  begin
    -- Test Case 1: reset
    rst <= '1';
    sw <= "000";
    wait for 5 * CLK_PERIOD;
    rst <= '0'; -- release reset
    --Test Case 2: sw0 = red
    sw <= "001";
    wait for 25 * CLK_PERIOD;
    --Test Case 3: sw1 = green
    sw <= "010"; 
    wait for 25 * CLK_PERIOD;
    --Test Case 4: sw2 = blue
    sw <= "100";
    wait for 25 * CLK_PERIOD;
    --Test Case 5: rgb off
    sw <= "011";
    wait for 25 * CLK_PERIOD;
    --all switches are off
    sw <= "000";
    wait for 10 * CLK_PERIOD;
    wait;  
end process; 
end Behavioral;
