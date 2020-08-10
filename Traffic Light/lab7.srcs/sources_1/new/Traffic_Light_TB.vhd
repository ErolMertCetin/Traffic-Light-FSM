library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity FSM_tb is
end;

architecture bench of FSM_tb is

  component FSM
      Port ( CLK : in STD_LOGIC;
             R : in STD_LOGIC;
             La : out STD_LOGIC_VECTOR (1 downto 0);
             Lb : out STD_LOGIC_VECTOR (1 downto 0));
  end component;

  signal CLK: STD_LOGIC:='1';
  signal R: STD_LOGIC:='1';
  signal La: STD_LOGIC_VECTOR (1 downto 0);
  signal Lb: STD_LOGIC_VECTOR (1 downto 0);

begin

  uut: FSM port map ( CLK => CLK,
                      R   => R,
                      La  => La,
                      Lb  => Lb );

  stimulus: process
  begin
  
    -- Put initialisation code here
    wait for 15 ns;
       R <= '0';

    -- Put test bench stimulus code here

    wait;
  end process;

  clocking: process
  begin
  
  wait for 10 ns;
  CLK<=not CLK;
  end process;

end;