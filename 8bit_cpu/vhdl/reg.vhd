library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity reg is 
port(
	clk 	: in std_logic;
	reset 	: in std_logic;
	out_en 	: in std_logic;
	ld	: in std_logic;
	input	: in std_logic_vector(7 downto 0);
	output 	: out std_logic_vector(7 downto 0);
	--output to bus
	output_alu : out std_logic_vector(7 downto 0)
	--output to alu
);

end entity;


architecture behavior of reg is

signal stored_value : std_logic_vector(7 downto 0):=(others=>'Z');

begin

process(clk,reset)
begin
	if reset = '1' then
		stored_value<=(others=>'Z');
	elsif (clk'event and clk='1') then
		if ld = '1' then
			stored_value <= input;
		end if;	
	end if;
end process;


output<= stored_value when out_en = '1' else (others=>'Z');
--to bus
output_alu<=stored_value;
--to alu

end behavior;