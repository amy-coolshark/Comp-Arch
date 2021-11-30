library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder_5to32_tb is
end decoder_5to32_tb;

architecture Behavioral of decoder_5to32_tb is
  component decoder_5to32 is
    port ( A : in std_logic_vector(4 downto 0);
           Q : out std_logic_vector(31 downto 0)
    );
  end component;

  -- Inputs
  signal A : std_logic_vector(4 downto 0) := (others => '0');

  --Outputs
  signal Q : std_logic_vector(31 downto 0);

  begin
    -- Instantiate the Unit Under Test (UUT)
    uut : decoder_5to32 port map
    ( A,
      Q
    );
    stim_proc: process
    begin
      A <= "00000";
      wait for 10 ns;
      A <= "00001";
      wait for 10 ns;
      A <= "00010";
      wait for 10 ns;
      A <= "00011";
      wait for 10 ns;
      A <= "00100";
      wait for 10 ns;
      A <= "01010";
      wait for 10 ns;
      A <= "10101";
      wait for 10 ns;
      A <= "11111";
      wait for 10 ns;
    end process;
  end;
