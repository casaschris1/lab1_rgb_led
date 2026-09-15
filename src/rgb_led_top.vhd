----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/13/2026 07:54:16 PM
-- Design Name: 
-- Module Name: rgb_led_top - Behavioral
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


entity rgb_led_top is
generic (
  CLK_CYCLES_PER_TOGGLE : integer := 62500000
  ); 
port (
  sys_clk : in std_logic;
  rst     : in std_logic;
  sw      : in std_logic_vector(2 downto 0);
  rgb_out : out std_logic_vector(2 downto 0)
 ); -- defined by lab instructions
 
end rgb_led_top;

architecture Behavioral of rgb_led_top is
signal blink_en : std_logic; -- enables blinking led when 1 is selcted
signal blink_sig : std_logic; --blinking signal produced byt blinking_led

begin
  u_blinker : entity work.blinking_led
  generic map (
  CLK_CYCLES_PER_TOGGLE => CLK_CYCLES_PER_TOGGLE
  )
    port map (
      sys_clk => sys_clk,
      rst     => rst,
      led_en  => blink_en,
      led_out => blink_sig
    );
   blink_en <= '1' when (sw = "001" or sw = "010" or sw = "100") else '0';
     process(sw, blink_sig)
     begin 
      case sw is 
       when "001" =>
          rgb_out <= "00" & blink_sig; --red
       when "010" =>
         rgb_out <= '0' & blink_sig & '0'; -- Green
       when "100" =>
         rgb_out <= blink_sig & "00"; -- Blue
       when others =>
         rgb_out <= "000"; -- off
       end case;
       end process;
       
    

end Behavioral;
