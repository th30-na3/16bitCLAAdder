-- Create Date: 11/15/2025 01:31:20 PM

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_16bit is
    Port (
        A   : in  std_logic_vector(15 downto 0);
        B   : in  std_logic_vector(15 downto 0);
        cin : in  std_logic;
        S   : out std_logic_vector(15 downto 0);
        cout: out std_logic
    );
end adder_16bit;

architecture Structural of adder_16bit is
    component adder_4bit
        port (
        A, B: in std_logic_vector(3 downto 0);
        cin: in std_logic;
        S: in std_logic_vector(3 downto 0);
        cout, P, G: out std_logic
        );
    end component;
    signal P, G : std_logic_vector(3 downto 0);
    signal C : std_logic_vector(4 downto 1);
begin
    -- 4×4-bit adders
    ad0: entity work.adder_4bit port map(A(3 downto 0),    B(3 downto 0),    cin,        S(3 downto 0),     open, P(0), G(0));
    ad1: entity work.adder_4bit port map(A(7 downto 4),    B(7 downto 4),    C(1),    S(7 downto 4),     open, P(1), G(1));
    ad2: entity work.adder_4bit port map(A(11 downto 8),   B(11 downto 8),   C(2),    S(11 downto 8),    open, P(2), G(2));
    ad3: entity work.adder_4bit port map(A(15 downto 12),  B(15 downto 12),  C(3),    S(15 downto 12),   cout, P(3), G(3));

    -- CLA
    cla: entity work.cla_4bit
        port map(p => P, g => G, cin => cin, c => C);

end Structural;

