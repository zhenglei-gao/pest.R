genBsmntBcPestInput.cli <- 
function        # ^ Process command-arguments of `genPestInput`
(
   opt    # ^ command-line options
  ,tmpl   # ^ file-path of template
)
{
    require('getopt', quietly = TRUE)
    opt_spec <- 
        matrix(c(
          'help',             'h', 0, "logical", 
            "Getting help",
          'print-cnf-tmpl',   'p', 0, "logical",
            "Prints a configuration template to `stdout`" ,
          'config',           'f', 1, "character",            
            "File-name of configuration file to use"
                         ), ncol = 5, byrow = TRUE)
    opt <- getopt(spec = opt_spec, opt = opt)
    if ( !is.null(opt$help) || is.null(commandArgs()) )   {    
        cat(getopt(spec = opt_spec, usage = TRUE, command = "genPestInput"))
        q(status=0)
    }

    if ( !is.null(opt[["print-cnf-tmpl"]]) )    {  #  Print config-template 
        cat(paste(readLines(tmpl), collapse = "\n"))
        q(status=0)
    }
    return(opt) # ^ Returns command-line options; or prints information to stdout
}
