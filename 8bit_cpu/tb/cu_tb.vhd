
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cu_tb is

end cu_tb;

architecture cu_tb_behavior of cu_tb is

component control_unit is 
Port ( 
clk: in std_logic;
reset: in std_logic;
inst: in std_logic_vector(3 downto 0);
do : out std_logic_vector(16 downto 0)
);
end component;


signal clk_sig: std_logic:='0';
signal inst_sig:std_logic_vector(3 downto 0):="0000";
signal reset_sig:std_logic;
signal control_op:std_logic_vector(16 downto 0);
constant clk_period : time := 10 ns;


begin

process
begin

clk_sig<='0';
wait for clk_period/2;
clk_sig<= not clk_sig;
wait for clk_period/2;
end process;


cu_inst: control_unit port map(clk=>clk_sig,reset=>reset_sig,inst=>inst_sig,do=>control_op);


process
begin

reset_sig<='1';
wait for clk_period*2;
reset_sig<='0';

wait;
end process;



end cu_tb_behavior;
