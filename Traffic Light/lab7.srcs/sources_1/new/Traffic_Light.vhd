----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.06.2020 14:20:32
-- Design Name: Yadav,Ankit
-- Module Name: FSM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
    Port ( CLK : in STD_LOGIC;
           R : in STD_LOGIC;
           La : out STD_LOGIC_VECTOR (1 downto 0);
           Lb : out STD_LOGIC_VECTOR (1 downto 0));
end FSM;

architecture Behavioral of FSM is

type s_type is (S0,S1,S2,S3,S4,S5);

signal state: s_type;
signal TA: std_logic :='1';
signal TB: std_logic :='1';
signal T0c: std_logic_vector(2 downto 0):= (others=>'0');
begin

process(CLK,R)begin

if R='1' then

state <=S0;

TA<='1';
TB<='1';

T0c<="000";
La<="00";
Lb<="10";

elsif rising_edge(CLK) then
case state is

when S0=>
if T0c =4 then
TA<='0';
T0c<="000";
else
T0c<=T0c+1;
end if;

if TA ='0' then
state<=S1;
TA<='1';
La<="01";
Lb<="10";
end if;

when S1=>
T0c<="000";
state<=S2;
La<="10";
Lb<="10";

when S2=>
if T0c =1 then
T0c<="000";
state<=S3;
La<="10";
Lb<="00";

else
T0c<=T0c+1;
end if;

when S3=>
if T0c =4 then
TB<='0';
T0c<="000";
else
T0c<=T0c+1;
end if;

if TB<='0' then
state<=S4;
TB<='1';
La<="10";
Lb<="01";

end if;

when S4=>
T0c<="000";
state<=S5;
La<="10";
Lb<="10";


when S5=>
if T0c =1 then
T0c<="000";
state<=S0;
La<="00";
Lb<="10";

else
T0c<=T0c+1;
end if;

end case;
end if;
end process;

end Behavioral;