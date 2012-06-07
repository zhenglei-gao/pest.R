--- 
format: markdown 
categories: r package basement executable
toc: no
title: plotObsVsSim -- A program to plot basement-simulation-results versus observations
...

Description
===========
Program -- in the R-Package [basement](basement-pkg) -- to plot basement-simulation-results versus observations.


Usage
=====
    plotObsVsSim [-t,--type [x | x <- ["marks", "hydrograph"]]] res-file

Options
=======
    -t,--type       type: could be either marks or hydrograph

Arguments
=========

marks-file
----------
Columns: 

* name
* obs_wse
* sim_wse 

for example looks like :

     name obs_wse sim_wse
     HWSP_0.170 405.26 404.916
     HWSP_0.370 405.64 405.194
     HWSP_0.440 405.68 404.987
     HWSP_0.880 407.02 406.403
     HWSP_10.00 449.35 448.663
     HWSP_10.25 451.57 451.117
     HWSP_1.030 407.09 406.749
     HWSP_10.49 452.68 451.916
     HWSP_10.84 454.19 453.319

hydrograph-file
---------------
Columns: 

* time
* wse_obs
* wse_sim

For example looks like :

     time; wse_obs; wse_sim
     2005-08-01 06:00:00; 412.552; 411.718
     2005-08-01 07:00:00; 412.519; 411.748
     2005-08-01 08:00:00; 412.49; 411.754
     2005-08-01 09:00:00; 412.469; 411.755
     2005-08-01 11:00:00; 413.737; 411.755
     2005-08-01 12:00:00; 413.808; 411.755
     2005-08-01 13:00:00; 413.73; 411.755
     2005-08-01 14:00:00; 413.77; 413.563
     2005-08-01 15:00:00; 413.682; 413.817

Value
=====
Creates a pdf-file; same basename as argument.

Example
=======

    plotObsVsSim --type marks marks_res.dat
