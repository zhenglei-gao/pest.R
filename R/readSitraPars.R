readSitraPars <- 
    function       # Read a Sitra parameter-file
(
    file           # file to read-in
)
{
    pars.df <- read.csv2(file, stringsAsFactor = FALSE, header = FALSE)
    names(pars.df) <- 
        c('type', 'zone', 'element', 'init', 'sd', 'obs', 
          'l_bound', 'u_bound', 'fixed', 'name')
    # Check for non-unique names
    dup_names_i <- which(duplicated(pars.df$name))
    if ( length(dup_names_i) > 0 ) 
    {  
        stop("There are non-unique parameter-names in file ", file, ". Namely ", 
             paste(pars.df$name[dup_names_i], collapse = ", "))
    } else {
        pars.df
    }
}
