library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lru_array_tb is
    end lru_array_tb;

architecture test_bench of lru_array_tb is

    component lru_array is
        port(address : in STD_LOGIC_VECTOR(5 downto 0);
             k : in STD_LOGIC;
             clk : in STD_LOGIC;
             enable : in STD_LOGIC;
             reset : in STD_LOGIC;
             w0_valid : out STD_LOGIC
         );
    end component;
    signal address : STD_LOGIC_VECTOR(5 downto 0);
    signal k,w0_valid : STD_LOGIC;
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal enable : STD_LOGIC;
begin
    mapping: lru_array port map(address,k,clk,enable,reset,w0_valid);

    address <= "000000" after 0 ns, "000001" after 10 ns, "000000" after 16 ns, "000001" after 18 ns;
    k <= '0', '1' after 10 ns, '0' after 15 ns;
    enable <= '1','0' after 9 ns, '1' after 12 ns;

    CLOCK:
    clk <= '1' after 1 ns when clk = '0' else
           '0' after 1 ns when clk = '1';
end test_bench;
