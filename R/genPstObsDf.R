genPstObsDf <- 
    function       # Generates a list with observations with observations, value and type
    ### Generates a list with elements conataining a data-frame with
    ### observations, value and type
(
    x              # Data-frame with files, ids and types
                   ### files -> character : file-name of observation data
                   ### ids   -> character : unique identifier
                   ### type  -> factor    : levels are "mark" or "hydrograph"
)
{
    data(bsmnt_obs_type)
    obs.list <- 
        apply(x, 1, 
               function(e){
                   # Assign read according to type, see `obs_type`
                   read_fun <- as.character(bsmnt_obs_type$read_fun[bsmnt_obs_type$type == e[3]])
                   read <-  eval(parse(text = read_fun))
                   # Read data in
                   d <- read(e[1], header = TRUE)
                   # Generate uniqute names
                   sub_pat <-  as.character(bsmnt_obs_type$name_sub[bsmnt_obs_type$type == e[3]])
                   odf        <- list()
                   odf$names  <- pasteObsName(d[,1], e[2], sub_pat)
                   odf$values <- d[,2]
                   odf$type   <- rep(e[3], nrow(d))
                   as.data.frame(odf)
               }
        )
    names(obs.list) <- x[,2]
    obs.list       # List  with observations, containing name, value and type
    ### Each element containing a data-frame with
    ###     name  ->  character : unique name of observation
    ###     value ->  numeric   : observation value
    ###     type  ->  factor    : levels are "mark" or "hydrograph"
}

