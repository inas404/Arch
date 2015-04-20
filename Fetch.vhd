Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_bit.all;
--The memory address space is 256 bytes and is byte addressable
entity Fetch is 
  port(
     clk,rst,en_F,en_update_PC,br_taken : in std_logic;
     PC: in std_logic_vector(7 downto 0);
     INSTR: out std_logic_vector(7 downto 0)--npc
  );
end Fetch;

architecture F of Fetch is
  TYPE mem IS ARRAY(0 TO 31) OF std_logic_vector(7 DOWNTO 0);
  SIGNAL ram_block : mem;
  SIGNAL PC_sig,nPC : std_logic_vector(7 downto 0);
  component my_DFF is
    port( 
         clk,rst,EN : in std_logic;
         d : in std_logic_vector(7 downto 0);
         q: out std_logic_vector(7 downto 0)
    );
  end component;
  begin
 
   myPC: my_DFF port map(clk,rst,en_update_PC,PC,nPC);
 
   SPEC_ADDR:process(clk,rst,en_update_PC,en_F)
     begin
       if rst='1' then 
          PC_sig<=(others=>'0');
       elsif rising_edge(clk) then
         if en_F='1' then
            INSTR<=ram_block(CONV_INTEGER(PC_sig));
         end if;
         if en_update_PC ='1' then
            PC_sig<=PC_sig+"00000001";
         end if;
       end if;
   end process;
  
 --  nPC<=PC_sig+"00000001";
end F;

