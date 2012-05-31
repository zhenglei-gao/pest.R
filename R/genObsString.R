genObsString <- 
    function       # Generate a observation-data string
    ### Generates a observation-data string for the pest-file
(
    x              # data-frame with name and value
)
{
    data(obs_type)
    apply(x, 1,     # strings witch lines of observation-data
          function(e) {
                ti <-  # index of type 
                    which(obs_type$type == e[3])
                group <- as.character(obs_type$group[ti])
              paste(e[1], e[2], "100", group)
          }
    )
    ### Returns a vector of lines of strings of observation-data
}

