genBsmntInsString  <- 
    function       # Generate an pest-instruction-string for Basement
( 
    names          # vector with observation-names
   ,type           # type of observation-file; either "mark" or "hydrograph"
 )
{
    INSPRE <- "pif *" # first line in instruction-files 

    data(bsmnt_obs_type)
    sapply(c("pre_str", "ins_pre_line"), # assign constants according to type
           function(x){
               ti <-  which(bsmnt_obs_type$type == type) # type index 
               assign(x, as.character(bsmnt_obs_type[ti, x])
                    , pos = parent.env(environment()) )
               invisible(NULL)
           }
    )
    ins.lines <-         # instruction lines for each observation
        paste(paste(ins_pre_line, " !", names, "!", sep = ""), collapse = "\n")
    paste(c(INSPRE, pre_str, ins.lines), collapse = "\n") # Concatented ins-string
    ### Returns a string containing ins-file, which could be readily printed to
    ### file with cat
}

