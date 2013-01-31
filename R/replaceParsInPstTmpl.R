replaceParsInPstTmpl <- 
    function
(
     pars.gp
  ,  pars.lines     # vector with parameter-lines
  ,  obs.lines      # vector with observation-lines
  ,  mio.lines      # model-input-output-lines
  ,  ntpl           # number of pest-template-files
  ,  nins           # number of instruction-files
  ,  runsh          # character with command to run-model
  ,  obsgp = c("mark", "hydrograph")    # observation-groups
  ,  pi = NULL      # prior information
)
{
  require('whisker', quietly = TRUE)
  join <- function(l, ...) paste(l, collapse = "\n", ...)
    pst.repl.list <- # Named list pest-par and  replacement string
        list(                  
             npargp  = length(pars.gp)
            ,npar    = length(pars.lines)
            ,nobs    = length(obs.lines)
            ,nobsgp  = length(obsgp)
            ,ntpl    = ntpl
            ,nins    = nins
            ,npi     = length(pi)
            ,pargp   = join(pars.gp)
            ,pardata = join(pars.lines)
            ,obsgp   = join(obsgp)
            ,obsdata = join(obs.lines)
            ,runsh   = runsh
            ,mio     = join(join(mio.lines), sep = "")
            ,pi      = join(c("* prior information", join(pi)))
        )
    
    pst.tmpl <-           # read pest-template
        paste(
          readLines(system.file("config-templates", "pest.pst", package = "pest"))
         ,collapse = "\n")
    
    whisker.render(pst.tmpl, pst.repl.list)
}
