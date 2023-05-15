library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity pc is 
	port(
		clk : in std_logic;
		reset	: in std_logic;
		en 	: in std_logic;
		output_enable 	: in std_logic;
		ld	: in std_logic;
		input: in std_logic_vector(3 downto 0);
		output: out std_logic_vector(3 downto 0)
	);
end entity;

architecture pc_behavior of pc is

signal count : std_logic_vector(3 downto 0) := "0000";

begin

process(clk,reset)
begin
	if reset = '1' then
		count<=(others=>'0');
	elsif rising_edge(clk) then
		if ld = '1' then
			count <= input;
		elsif en ='1' then
			count<= count + 1;
		end if;
	end if;

end process;

output <= count when output_enable = '1' else "ZZZZ";
end pc_behavior;