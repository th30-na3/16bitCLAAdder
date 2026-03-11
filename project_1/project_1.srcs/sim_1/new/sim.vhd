-- Create Date: 11/15/2025 01:33:21 PM

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_adder_16bit is
end tb_adder_16bit;

architecture sim of tb_adder_16bit is
    component adder_16bit
        port (
        A, B: in std_logic_vector(15 downto 0);
        cin: in std_logic;
        S: out std_logic_vector(15 downto 0);
        cout: out std_logic
        );
    end component;
    signal A, B : std_logic_vector(15 downto 0);
    signal S    : std_logic_vector(15 downto 0);
    signal cin, cout : std_logic;
begin

    UUT: entity work.adder_16bit
        port map(A => A, B => B, cin => cin, S => S, cout => cout);

    process
    begin
        cin <= '0';

        A <= x"0001"; B <= x"0001"; wait for 10 ns;
        A <= x"80FF"; B <= x"8001"; wait for 10 ns;
        A <= x"1234"; B <= x"1111"; wait for 10 ns;
        A <= x"FFFF"; B <= x"0001"; wait for 10 ns;
        A <= x"AAAA"; B <= x"5555"; wait for 10 ns;
        
        cin <= '1';
        A <= x"0001"; B <= x"0000"; wait for 10 ns;
        A <= x"0005"; B <= x"0009"; wait for 10 ns;

        wait;
    end process;

end sim;
