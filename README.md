% pest --  R package to generate input-files for `PEST` 
% Michel Kuhlmann, <michel@kuhlmanns.info>
% June 2012 

# Description

The package ships some executables, which facilitate the generation of `PEST`-input-files for `sitra` and `basement`.

# Installation


    R> install.packages('devtools')
    R> require('devtools')
    R> install_github("r-pest", username = "michelk")

    sh> cp $(Rscript -e 'cat(system.file("exec", package = "pest"))')/* $HOME/bin

`$HOME/bin` should be in the system's search path.

# Usage

Look into the `github`-wiki
