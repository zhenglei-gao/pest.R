% genPestInput -- program to generate input-files for a BaseChain-pest calibration
% Michel Kuhlmann (kum), <kum@tkconsult.ch>
% 16 May 2012

Description
===========
Program -- in the R-Package [basement](basement-pkg) -- program to generate
input-files for a BaseChain-pest calibration

Usage
=====
    genPestInput [-[-help|h]] [-[-print-cnf-tmpl|p]] [-[-config|f]]


Options
=========
    -h,--help              Getting help
    -p,--print_cnf_tmpl    Prints a configuration template to stdout
    -f,--config            File-name of configuration file to use

Value
=====
Nothing useful returned; generates input files:

* .ins-files
* .pst-file
* run-command

Examples
=========

    genPestInput -p > myconfig.yaml # generate config-template
    edit myconfig.yaml
    genPestInput -f myconfig.yaml
