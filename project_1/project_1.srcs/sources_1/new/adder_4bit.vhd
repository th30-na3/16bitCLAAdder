-- Create Date: 11/15/2025 01:22:57 PM

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_4bit is
    Port (
        A   : in  std_logic_vector (3 downto 0);
        B   : in  std_logic_vector (3 downto 0);
        cin : in  std_logic;
        S   : out std_logic_vector (3 downto 0);
        cout: out std_logic;
        P   : out std_logic;
        G   : out std_logic
    );
end adder_4bit;

architecture Structural of adder_4bit is
    component fa_1bit
        port (a, b, cin: in std_logic;
              s, p ,g: out std_logic);
    end component;
    
    component cla_4bit
        port (
        p, g: in std_logic_vector(3 downto 0);
        cin: in std_logic;
        c: out std_logic_vector(4 downto 1);
        P4, G4: out std_logic 
        ); 
    end component;
  
    signal ps, gs : std_logic_vector(3 downto 0);
    signal c    : std_logic_vector(4 downto 1);
begin

    -- Full adders
    fa0: entity work.fa_1bit port map(A(0), B(0), cin,    S(0), ps(0), gs(0));
    fa1: entity work.fa_1bit port map(A(1), B(1), c(1),   S(1), ps(1), gs(1));
    fa2: entity work.fa_1bit port map(A(2), B(2), c(2),   S(2), ps(2), gs(2));
    fa3: entity work.fa_1bit port map(A(3), B(3), c(3),   S(3), ps(3), gs(3));

    -- CLA
    cla: entity work.cla_4bit 
        port map(p => ps, g => gs, cin => cin, c => c, P4 => P, G4 => G);

    cout <= c(4);

end Structural;

