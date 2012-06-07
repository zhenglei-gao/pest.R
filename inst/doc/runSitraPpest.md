--- 
format: markdown 
categories: r package basement executable
toc: no
title: runSitraPpest -- Running Sitra-calibration with parallel-pest
...

Description
===========
The program facilitates the calibration of a sitra-model. The programs does

* generate pest-input-files out of your parameter and observation files and
* runs parallel-pest within `screen`.

Currently you could only start with one host -- but which you could expand
manually to other hosts.

You can switch to the different run-outputs with the key-combination `Ctrl-o`
and `1-9` for the different threads respectively.

ToDo
===

* add a controller window 
    - add wrapper `addSitraSlave <host> <#threads>`
* plot the residuals

Usage
=====
    runSitraPpest -s <#thears>

Options
=======
    -s,--single-host       number of theards to use initially


