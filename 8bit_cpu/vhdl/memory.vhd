library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity memory is
	port(
		clk : in std_logic;
		load :in std_logic;
		output_enable	: in std_logic;
		data_in : in std_logic_vector(7 downto 0);
		addr_in : in std_logic_vector(3 downto 0);
		data_out : out std_logic_vector(7 downto 0)
	);
end entity;


architecture memory_behavior of memory is

type memory_type is array(0 to 15) of std_logic_vector(7 downto 0);


--signal memory_obj:memory_type :=(x"0E",x"2F",x"1E",x"5E",x"41",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"FF",x"01");

signal memory_obj:memory_type :=(x"0E",x"3F",x"1E",x"5E",x"41",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"FF",x"01");
begin


memory_obj(to_integer(unsigned(addr_in)))<=data_in when load = '1';
data_out <= memory_obj(to_integer(unsigned(addr_in))) when output_enable = '1' else (others=>'Z');

end memory_behavior;








