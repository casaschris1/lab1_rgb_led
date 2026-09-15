----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/13/2026 04:10:48 PM
-- Design Name: 
-- Module Name: blinking_led - Behavioral
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
use IEEE.NUMERIC_STD.All;

entity blinking_led is
-- NUMBER of clock cycles before changing LED
generic (
  CLK_CYCLES_PER_TOGGLE : integer := 62500000
  );
  port (
   sys_clk : in std_logic; -- 125MHz system clock
   rst     : in std_logic; -- active-high synchronous reset
   led_en  : in std_logic; -- LED enable signal 
   led_out : out std_logic -- LED output driven to LEDO
   );
   
end blinking_led;

architecture Behavioral of blinking_led is

-- Counts number of sys clock cycles 
signal counter : integer range 0 to CLK_CYCLES_PER_TOGGLE - 1 := 0;
-- Internal signal 
signal led_reg : std_logic := '0';
begin 

process(sys_clk) --
begin
if rising_edge(sys_clk) then -- only performs the logic when clk 0->1
 
 if (rst = '1') or (led_en = '0') then -- 
  counter <= 0;
  led_reg <= '0'; -- rst pressed counter -> 0 LED off LED disabled -> counter=0 LED off
  
 elsif counter = CLK_CYCLES_PER_TOGGLE - 1 then --
   counter <= 0;
   led_reg <= not led_reg; -- once enough clock cycles are counted reset the counter and flip the led
   
  else --
   counter <= counter + 1; -- if none (^) happens then keep counting until one is fullfilled
   end if;
  end if;
  end process; 
  led_out <= led_reg; 


end Behavioral;
