summarizeObs <- 
    function       # Generates a summary of observation provided
(
    x              # named list with observation; 
                   ### * key   : id
                   ### * value : file-name of observation
   ,type           # could be either "mark" or "hydrograph"
)
{
    if ( ! type %in% c("mark", "hydrograph") ) {  
        stop("Unknown type:", type)
    }
    data.frame(files  = as.character(unlist(x)) # Data-frame with files, ids and types
               ,ids   = names(x)
               ,types = rep(type, length(x))
    )
}
