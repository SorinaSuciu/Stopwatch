----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2024 02:11:53 PM
-- Design Name: 
-- Module Name: mux_4 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_4 is
    Port ( i0 : in STD_LOGIC_VECTOR (6 downto 0);
           i1 : in STD_LOGIC_VECTOR (6 downto 0);
           i2 : in STD_LOGIC_VECTOR (6 downto 0);
           i3 : in STD_LOGIC_VECTOR (6 downto 0);
           a : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (6 downto 0));
end mux_4;

architecture Behavioral of mux_4 is

begin
y<= i3 when (a="11") else
 i2 when (a="10") else
 i1 when (a="01") else
 i0 when (a="00") else
 "0000000";

end Behavioral;
