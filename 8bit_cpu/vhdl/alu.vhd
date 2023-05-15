library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity alu is
port(
	en : in std_logic;
	operation : in std_logic;
	reg_a_in : in std_logic_vector(7 downto 0);
	reg_b_in : in std_logic_vector(7 downto 0);
	carry_out : out std_logic;
	res_out : out std_logic_vector(7 downto 0)
);
end entity;

architecture alu_behavior of alu is 

signal result : std_logic_vector(8 downto 0);
begin
	
	process(reg_a_in,reg_b_in,operation)
	begin
		if operation = '0' then
			result <= ('0'& reg_a_in) + ('0'& reg_b_in);
		elsif operation = '1' then
			result <= ('0'& reg_a_in) - ('0'& reg_b_in);
		end if;
	end process;
	
carry_out<= result(8) ;
res_out<=result(7 downto 0) when en='1' else (others=>'Z');	
	
	
end alu_behavior;