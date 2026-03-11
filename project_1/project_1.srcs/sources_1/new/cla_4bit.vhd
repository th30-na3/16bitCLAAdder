-- Create Date: 11/15/2025 01:17:24 PM

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cla_4bit is
    Port (
        p   : in  std_logic_vector(3 downto 0);
        g   : in  std_logic_vector(3 downto 0);
        cin : in  std_logic;
        c   : out std_logic_vector(4 downto 1);
        P4   : out std_logic;
        G4   : out std_logic
    );
end cla_4bit;

architecture Behavioral of cla_4bit is
begin

    c(1) <= g(0) or (p(0) and cin);
    c(2) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and cin);
    c(3) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and cin);
    c(4) <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and cin);

    P4 <= p(3) and p(2) and p(1) and p(0);

    G4 <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0));

end Behavioral;

