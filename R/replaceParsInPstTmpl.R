replaceParsInPstTmpl <- 
    function
(
     pars.lines     # vector with parameter-lines
  ,  obs.lines      # vector with observation-lines
  ,  mio.lines      # model-input-output-lines
  ,  ntpl           # number of pest-template-files
  ,  nins           # number of instruction-files
  ,  runsh          # character with command to run-model
  ,  obsgp = c("hwsp", "hydrograph")    # observation-groups
)
{
  require('whisker', quietly = TRUE)
    pst.repl.list <- # Named list pest-par and  replacement string
        list(                  
             npar    = length(pars.lines)
            ,nobs    = length(obs.lines)
            ,nobsgp  = length(obsgp)
            ,ntpl    = ntpl
            ,nins    = nins
            ,pardata = paste(pars.lines, collapse = "\n")
            ,obsgp   = paste(obsgp, collapse = "\n")
            ,obsdata = paste(obs.lines, collapse = "\n")
            ,runsh   = runsh
            ,mio     = paste(paste(mio.lines, collapse = "\n"), "\n", sep = "")
        )
    
    pst.tmpl <-           # read pest-template
        paste(
          readLines(system.file("config-templates", "pest.pst", package = "pest"))
         ,collapse = "\n")
    
    whisker.render(pst.tmpl, pst.repl.list)
   #subParsInTmpl(repls = pst.repl.list ,tmpl  = pst.tmpl
   )
}
