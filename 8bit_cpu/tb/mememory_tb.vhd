library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity mememory_tb is 
	
end entity;

architecture mememory_tb_behavior of mememory_tb is

component mar is
port(
	clk : in std_logic;
	reset : in std_logic;
	load	: in std_logic;
	input	: in std_logic_vector(3 downto 0);
	output  : out std_logic_vector(3 downto 0)
);
end component;

component memory is
port(
		clk : in std_logic;
		load :in std_logic;
		output_enable	: in std_logic;
		data_in : in std_logic_vector(7 downto 0);
		addr_in : in std_logic_vector(3 downto 0);
		data_out : out std_logic_vector(7 downto 0)
	);
end component;

signal clk_sig : std_logic;
signal reset_sig : std_logic;

signal load_mar: std_logic;
signal load_memory: std_logic;
signal mar_input: std_logic_vector(3 downto 0);
signal mar_out: std_logic_vector(3 downto 0);

signal memory_en_sig : std_logic;
signal memory_ld_sig : std_logic;
signal memory_input_sig : std_logic_vector(7 downto 0);
signal memory_output_sig : std_logic_vector(7 downto 0);

constant clk_period : time := 10 ns;
begin

mar1: mar port map(clk=>clk_sig,reset=>reset_sig,load=>load_mar,input=>mar_input,output=>mar_out);
mem1: memory port map(clk=>clk_sig,load=>memory_ld_sig,output_enable=>memory_en_sig,data_in=>memory_input_sig,addr_in=>mar_out,data_out=>memory_output_sig);


process
begin

clk_sig<='0';
wait for clk_period/2;
clk_sig<= not clk_sig;
wait for clk_period/2;
end process;



process
begin

mar_input<="0000";
load_mar<='1';
memory_en_sig<='0';
wait for clk_period;
load_mar<='0';
memory_en_sig<='1';
wait for clk_period;
mar_input<="0001";
load_mar<='1';
memory_en_sig<='0';
wait for clk_period;
load_mar<='0';
memory_en_sig<='1';
wait for clk_period;
mar_input<="0010";
load_mar<='1';
memory_en_sig<='0';
wait for clk_period;
load_mar<='0';
memory_en_sig<='1';
wait for clk_period;


wait;

end process;


end mememory_tb_behavior;