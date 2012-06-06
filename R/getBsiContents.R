getBsiContents <- 
    function
(
    file           # file to extract configuration
)
{
    bsi.lines.raw <- readLines(file)
    bsi.lines <- 
        suppressWarnings(
           lapply(bsi.lines.raw, function(l) strsplit(l, "[[:space:]]*#")[[1]][1])
        )    
    # Process biv
    biv <- 
    {
        biv.line <- strsplit(bsi.lines[[6]], " ")[[1]]
        if ( biv.line[1] != "STROEMUNG+INVERS") 
        {  
            stop('You have to define "STROEMUNG+INVERS" and an associated .biv-file')
        } else
        {
            biv.line[2]
        }
    }
    # Get run-time
    run_time <- as.numeric(bsi.lines[[16]])
    list(biv = biv, run_time = run_time)
    ### Returns a named list with configuration
}
