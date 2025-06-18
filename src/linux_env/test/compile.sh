SRC_DIR="../modules"

vlib work
verilog_files=$(find "$SRC_DIR" -type f -name "*.v")

echo "Compiling the following files:"
echo "$verilog_files"
echo

vlog +define+SIMULATION $verilog_files
# vlog +define+SIMULATION +cover=stt+cond+tgl "${verilog_files[@]}"


TB_DIR="../test_benches/functional_cv"
sv_files=$(find "$TB_DIR" -type f -name "*.sv")
echo "Compiling testbench files:"
echo "$sv_files"
echo
vlog +define+SIMULATION $sv_files
# 
vsim -c -do "run -all; quit" top_module_tb
