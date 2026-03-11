-- Create Date: 11/15/2025 01:14:33 PM

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fa_1bit is
    Port (
        a   : in  std_logic;
        b   : in  std_logic;
        cin : in  std_logic;
        s   : out std_logic;
        p   : out std_logic;
        g   : out std_logic
    );
end fa_1bit;

architecture Behavioral of fa_1bit is
begin
    p <= a xor b;
    g <= a and b;
    s <= (a xor b) xor cin;
end Behavioral;

