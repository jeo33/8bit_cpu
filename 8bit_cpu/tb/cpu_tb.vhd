library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity cpu_tb is
	

end entity;



architecture cpu_tb_behavior of cpu_tb is

component cpu is
	port(
		clk			: IN std_logic;
		rs			: IN std_logic;
		op			: OUT std_logic_vector(7 downto 0)		
	);

end component;

constant clk_period : time := 10 ns;
signal clk_sig : std_logic;
signal nclk_sig : std_logic;
signal reset_sig:std_logic:='0';
signal mem_prog_sig:std_logic:='0';
signal ext_mem_clk_sig:std_logic:='0';
signal ext_mem_addr_sig:std_logic_vector(3 downto 0):=(others=>'0');
signal ext_mem_bus_sig:std_logic_vector(7 downto 0):=(others=>'0');
signal op_sig:std_logic_vector(7 downto 0):=(others=>'0');

begin


cpu1_obj: cpu port map(
clk=>clk_sig,
rs=>reset_sig,
op=>op_sig
);

process
begin
	clk_sig <= '1';
	wait for clk_period/2;
	clk_sig <= not clk_sig;
	wait for clk_period/2;
	
end process;


nclk_sig <= not clk_sig;



process

begin

wait for clk_period*14;
reset_sig<='1' ;
wait for clk_period*10;
reset_sig<='0'; 
wait;
end process;

end cpu_tb_behavior;