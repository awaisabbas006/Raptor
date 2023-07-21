set project_name O_BUF_T_DS

puts "Creating $project_name..."
create_design $project_name -type gate-level
target_device GEMINI_COMPACT_10x8
pnr_netlist_lang verilog
read_netlist obuft_ds_post_synth.v
#add_constraint_file i_serdes_1_to_4.sdc

# Compilation
puts "Compiling $project_name..."

packing
place
route
sta
bitstream

puts "Completed run_raptor.tcl\n"