library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity timer is
    Port ( start_stop : in STD_LOGIC;
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           anod : out STD_LOGIC_VECTOR (3 downto 0));
          -- dp : out STD_LOGIC);
end timer;

architecture Behavioral of timer is
component sixteen_cnt is
    Port ( En : in STD_LOGIC;
           Rst : in STD_LOGIC;
           Clk : in STD_LOGIC;
           out0 : out STD_LOGIC_VECTOR (3 downto 0);
           out1 : out STD_LOGIC_VECTOR (3 downto 0);
           out2 : out STD_LOGIC_VECTOR (3 downto 0);
           out3 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component mux_4 is
    Port ( i0 : in STD_LOGIC_VECTOR (6 downto 0);
           i1 : in STD_LOGIC_VECTOR (6 downto 0);
           i2 : in STD_LOGIC_VECTOR (6 downto 0);
           i3 : in STD_LOGIC_VECTOR (6 downto 0);
           a : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (6 downto 0));
end component;
component two_cnt is
    Port ( clk : in STD_LOGIC;
           q : out std_logic_vector(1 downto 0));
end component;
component decodif is
    Port ( binar : in STD_LOGIC_VECTOR (3 downto 0);
           ABCDEFG : out STD_LOGIC_VECTOR (6 downto 0));
end component;
signal t1, t2 : std_logic;
signal count1, count2 : integer range 0 to 11000000 := 0;
--semnale decod-mux
signal s_0, s_1, s_2, s_3 : std_logic_vector(6 downto 0) := "0000000";
--counter 2 la mux
signal s_r : std_logic_vector(1 downto 0);
--numarator-decod
signal bin0, bin1, bin2, bin3 :std_logic_vector(3 downto 0);
begin
frequency_divider: process (clock) begin--250 Hz clock divider

 if rising_edge(clock) then
 if (count1 = 200000) then
 t1 <= NOT(t1);
 count1 <= 0;
 else
 count1 <= count1 + 1;
 end if;
 end if;
 end process;
 frequency_divider2: process (clock) begin--clock divider for cycling through digits


 if rising_edge(clock) then
 if (count2 = 5000000) then
 t2 <= NOT(t2);
 count2 <= 0;
 else
 count2 <= count2 + 1;
 end if;
 end if;
 end process;
cycle : process(s_r)
begin
case s_r is
WHEN "00" =>
 anod<="1110";
-- dp<='1';
 WHEN "01" =>
 anod<="1101";
 --dp<='0';--engage decimal point
 WHEN "10" =>
 anod<="1011";
 --dp<='1';
 WHEN "11" =>
 anod<="0111";
-- dp<='1';
 when others => anod<="1111";
end case;
end process cycle;  
counter2 : two_cnt
port map   ( clk => t1,
             q =>s_r);
 counter4 :  sixteen_cnt
 port map (clk => t2,
            out0 => bin0,
             out1 => bin1,
              out2 => bin2,
               out3 => bin3,
                en => start_stop,
                Rst => reset);
decode0 : decodif
 port map ( binar => bin0,
 ABCDEFG => s_0);
decode1 : decodif
 port map ( binar=> bin1,
 ABCDEFG => s_1);
decode2 : decodif
 port map ( binar => bin2,
 ABCDEFG => s_2);
decode3 : decodif
 port map ( binar => bin3,
 ABCDEFG => s_3); 
 mux4 :mux_4
 port map ( i0 => s_0,
 i1 => s_1,
 i2 => s_2,
 i3 => s_3,
 y => cat,
 a =>s_r
); 

end Behavioral;
