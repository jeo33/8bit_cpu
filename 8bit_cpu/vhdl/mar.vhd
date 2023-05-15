library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity mar is 
port(
	clk : in std_logic;
	reset : in std_logic;
	load	: in std_logic;
	input	: in std_logic_vector(3 downto 0);
	output  : out std_logic_vector(3 downto 0)
);
end entity;

architecture mar_behaviro of mar is

signal stored_value : std_logic_vector(3 downto 0):=(others=>'Z');

begin
process(clk,reset)
begin
	if reset = '1' then
		stored_value<=(others=>'Z');
	elsif (clk'event and clk='1') then
		if load = '1' then
			stored_value <= input;
		end if;	
	end if;
end process;

output<=stored_value;

end mar_behaviro;