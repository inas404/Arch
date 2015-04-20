Library ieee;
use ieee.std_logic_1164.all;
Entity my_DFF is
  port( 
      clk,rst,EN : in std_logic;
      d : in std_logic_vector(7 downto 0);
      q: out std_logic_vector(7 downto 0)
  );
end my_DFF;

Architecture a_my_DFF of my_DFF is
begin
  process(clk,rst)
  begin
    if(rst = '1') then
        q <= (others=>'0');
    elsif rising_edge(clk) and EN = '1' then
 	    q <= d;
    end if;
  end process;
end a_my_DFF;
