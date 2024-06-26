create_design axi_register_prj

target_device 1GE100-ES1
set IP_PATH ./axi_register_prj/run_1/IPs/


#Configuring axi_register_v1_0 IP
configure_ip axi_register_v1_0 -mod_name axi_register_wrapper -Pdata_width=64 -Paddr_width=8 -out_file $IP_PATH/axi_register_wrapper

#Generate IP
ipgenerate

#Add generate IP as a design and synthesize it
add_design_file  $IP_PATH/rapidsilicon/ip/axi_register/v1_0/axi_register_wrapper/src/axi_register_wrapper_v1_0.v
add_library_path $IP_PATH/rapidsilicon/ip/axi_register/v1_0/axi_register_wrapper/src/
set_top_module axi_register_wrapper
parser_type surelog
synth_options -new_tdp36k
synth delay

