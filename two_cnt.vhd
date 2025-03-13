library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity two_cnt is
 Port ( clk : in STD_LOGIC;
 q : out STD_LOGIC_vector(1 downto 0));
end two_cnt;
architecture Behavioral of two_cnt is
signal sig1,sig2 : std_logic;
 signal count_out_sig : std_logic_vector (1 downto 0);
begin -- 2bit_counter_ar
 process (clk)
 begin -- process
 if clk'event and clk = '1' then -- rising clock edge
 count_out_sig(0) <= sig1;
 count_out_sig(1) <= sig2;
 end if;
 end process;
-- Combinational Logic
 sig1 <= not count_out_sig(0);
 sig2 <= count_out_sig(1) xor count_out_sig(0);
 q <= count_out_sig;
 end Behavioral;