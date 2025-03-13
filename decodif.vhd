----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2024 01:56:06 PM
-- Design Name: 
-- Module Name: decodif - Behavioral
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
entity decodif is
 Port ( binar : in STD_LOGIC_VECTOR (3 downto 0);
 ABCDEFG : out STD_LOGIC_VECTOR (6 downto 0));
end decodif;
architecture Behavioral of decodif is
begin
process(binar)
begin
case binar is

when "0000" => ABCDEFG <="0000001";
when "0001" => ABCDEFG <="1001111";
when "0010" => ABCDEFG <="0010010";
when "0011" => ABCDEFG <="0000110";
when "0100" => ABCDEFG <="1001100";
when "0101" => ABCDEFG <="0100100";
when "0110" => ABCDEFG <="1100000";
when "0111" => ABCDEFG <="0001111";
when "1000" => ABCDEFG <="0000000";
when "1001" => ABCDEFG <="0001100";
when others => ABCDEFG <="0111000";
end case;
end process;
end Behavioral;
