
proc get_all_files {dir pattern} {
    set files {}

    foreach f [glob -nocomplain -directory $dir *$pattern] {
        lappend files $f
    }

    # Lặp qua subdir
    foreach subdir [glob -nocomplain -directory $dir -types d *] {
        set sub_files [get_all_files $subdir $pattern]
        foreach f $sub_files {
            lappend files $f
        }
    }

    return $files
}


create_project sim_project -force ./sim_project -part xcu50-fsvh2104-2-e 
set_property source_mgmt_mode None [current_project]
set_property verilog_define "SIMULATION" [get_filesets sources_1]
set_property verilog_define "SIMULATION" [get_filesets sim_1]

set src_dir "/home/hieu/Thesis/src/modules"

add_files /home/hieu/Thesis/src/test_benches/functional_cv/functional_cv.sv


foreach file [get_all_files $src_dir ".v"] {
    puts "Adding Verilog file: $file"
    add_files $file
}


set tb_dir "/home/hieu/Thesis/src/test_benches/functional_sv"
foreach file [get_all_files $tb_dir ".sv"] {
    puts "Adding TB SV file: $file"
    add_files $file
}


update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
set_property top top_module_tb [get_filesets sim_1]

launch_simulation


