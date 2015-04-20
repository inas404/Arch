vsim work.fetch
# vsim work.fetch 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_unsigned(body)
# Loading ieee.numeric_bit(body)
# Loading work.fetch(f)
# Loading work.my_dff(a_my_dff)
mem load -filltype inc -filldata 00000000 -fillradix symbolic -skip 0 /fetch/ram_block
add wave -position end  sim:/fetch/clk
add wave -position end  sim:/fetch/rst
add wave -position end  sim:/fetch/en_F
add wave -position end  sim:/fetch/en_update_PC
add wave -position end  sim:/fetch/br_taken
add wave -position end  sim:/fetch/PC
add wave -position end  sim:/fetch/INSTR
add wave -position end  sim:/fetch/ram_block
add wave -position end  sim:/fetch/PC_sig
add wave -position end  sim:/fetch/nPC
force -freeze sim:/fetch/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/fetch/rst 1 0
force -freeze sim:/fetch/en_F 1 0
force -freeze sim:/fetch/en_update_PC 1 0
force -freeze sim:/fetch/br_taken 0 0
force -freeze sim:/fetch/PC 00000000 0

run
force -freeze sim:/fetch/rst 0 0
run
run
run
run
run
run
