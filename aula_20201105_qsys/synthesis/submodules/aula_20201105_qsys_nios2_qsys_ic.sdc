# Legal Notice: (C)2020 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_internal_jtag|tckutap}
#set_clock_groups -asynchronous -group {altera_internal_jtag|tckutap}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	aula_20201105_qsys_nios2_qsys_ic 	aula_20201105_qsys_nios2_qsys_ic:*
set 	aula_20201105_qsys_nios2_qsys_ic_oci 	aula_20201105_qsys_nios2_qsys_ic_nios2_oci:the_aula_20201105_qsys_nios2_qsys_ic_nios2_oci
set 	aula_20201105_qsys_nios2_qsys_ic_oci_break 	aula_20201105_qsys_nios2_qsys_ic_nios2_oci_break:the_aula_20201105_qsys_nios2_qsys_ic_nios2_oci_break
set 	aula_20201105_qsys_nios2_qsys_ic_ocimem 	aula_20201105_qsys_nios2_qsys_ic_nios2_ocimem:the_aula_20201105_qsys_nios2_qsys_ic_nios2_ocimem
set 	aula_20201105_qsys_nios2_qsys_ic_oci_debug 	aula_20201105_qsys_nios2_qsys_ic_nios2_oci_debug:the_aula_20201105_qsys_nios2_qsys_ic_nios2_oci_debug
set 	aula_20201105_qsys_nios2_qsys_ic_wrapper 	aula_20201105_qsys_nios2_qsys_ic_jtag_debug_module_wrapper:the_aula_20201105_qsys_nios2_qsys_ic_jtag_debug_module_wrapper
set 	aula_20201105_qsys_nios2_qsys_ic_jtag_tck 	aula_20201105_qsys_nios2_qsys_ic_jtag_debug_module_tck:the_aula_20201105_qsys_nios2_qsys_ic_jtag_debug_module_tck
set 	aula_20201105_qsys_nios2_qsys_ic_jtag_sysclk 	aula_20201105_qsys_nios2_qsys_ic_jtag_debug_module_sysclk:the_aula_20201105_qsys_nios2_qsys_ic_jtag_debug_module_sysclk
set 	aula_20201105_qsys_nios2_qsys_ic_oci_path 	 [format "%s|%s" $aula_20201105_qsys_nios2_qsys_ic $aula_20201105_qsys_nios2_qsys_ic_oci]
set 	aula_20201105_qsys_nios2_qsys_ic_oci_break_path 	 [format "%s|%s" $aula_20201105_qsys_nios2_qsys_ic_oci_path $aula_20201105_qsys_nios2_qsys_ic_oci_break]
set 	aula_20201105_qsys_nios2_qsys_ic_ocimem_path 	 [format "%s|%s" $aula_20201105_qsys_nios2_qsys_ic_oci_path $aula_20201105_qsys_nios2_qsys_ic_ocimem]
set 	aula_20201105_qsys_nios2_qsys_ic_oci_debug_path 	 [format "%s|%s" $aula_20201105_qsys_nios2_qsys_ic_oci_path $aula_20201105_qsys_nios2_qsys_ic_oci_debug]
set 	aula_20201105_qsys_nios2_qsys_ic_jtag_tck_path 	 [format "%s|%s|%s" $aula_20201105_qsys_nios2_qsys_ic_oci_path $aula_20201105_qsys_nios2_qsys_ic_wrapper $aula_20201105_qsys_nios2_qsys_ic_jtag_tck]
set 	aula_20201105_qsys_nios2_qsys_ic_jtag_sysclk_path 	 [format "%s|%s|%s" $aula_20201105_qsys_nios2_qsys_ic_oci_path $aula_20201105_qsys_nios2_qsys_ic_wrapper $aula_20201105_qsys_nios2_qsys_ic_jtag_sysclk]
set 	aula_20201105_qsys_nios2_qsys_ic_jtag_sr 	 [format "%s|*sr" $aula_20201105_qsys_nios2_qsys_ic_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$aula_20201105_qsys_nios2_qsys_ic_oci_break_path|break_readreg*] -to [get_keepers *$aula_20201105_qsys_nios2_qsys_ic_jtag_sr*]
set_false_path -from [get_keepers *$aula_20201105_qsys_nios2_qsys_ic_oci_debug_path|*resetlatch]     -to [get_keepers *$aula_20201105_qsys_nios2_qsys_ic_jtag_sr[33]]
set_false_path -from [get_keepers *$aula_20201105_qsys_nios2_qsys_ic_oci_debug_path|monitor_ready]  -to [get_keepers *$aula_20201105_qsys_nios2_qsys_ic_jtag_sr[0]]
set_false_path -from [get_keepers *$aula_20201105_qsys_nios2_qsys_ic_oci_debug_path|monitor_error]  -to [get_keepers *$aula_20201105_qsys_nios2_qsys_ic_jtag_sr[34]]
set_false_path -from [get_keepers *$aula_20201105_qsys_nios2_qsys_ic_ocimem_path|*MonDReg*] -to [get_keepers *$aula_20201105_qsys_nios2_qsys_ic_jtag_sr*]
set_false_path -from *$aula_20201105_qsys_nios2_qsys_ic_jtag_sr*    -to *$aula_20201105_qsys_nios2_qsys_ic_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$aula_20201105_qsys_nios2_qsys_ic_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$aula_20201105_qsys_nios2_qsys_ic_oci_debug_path|monitor_go
