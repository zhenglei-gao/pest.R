genSitraInsString <- 
    function       # Generate a pest-instruction-string for Sitra
(
    names          # vector with names of observations
  , type =         # currently not used 
      "hydrograph"
)
{
    INSPRE <-      # first line in instruction-files 
        "pif *"
    pre_str <-     # comming before ins-lines
        "*Zeit*"
    ins_pre_line <- # in line coming before obs-name
        "l1 *;*"
    ins.lines <-   # instruction lines for each observation
        paste(paste(ins_pre_line, " !", names, "!", sep = ""), collapse = "\n")
    paste(c(INSPRE, pre_str, ins.lines), collapse = "\n") # Concatented ins-string
    ### Returns a string containing ins-file, which could be readily printed to
    ### file with cat
}
