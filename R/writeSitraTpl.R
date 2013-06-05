writeSitraTpl <- 
    function       # Write parameters as tpl-file for sitra
(
     pars.df       # data-frame with sitra-parameters
   , i             # indices which parameters to estimate
   , file =        # file to write into
       stdout() 
)
{
    pars.df[i,'init'] <- paste("$", tolower(pars.df[i,'name']), "$", sep = "")
    cat("ptf $\n", file = file)
    write.table(pars.df, file = file, col.names = FALSE, sep = ";", 
                row.names = FALSE, quote = FALSE, append = TRUE)
}
