genObsString <- 
    function       # Generate a observation-data string
    ### Generates a observation-data string for the pest-file
(
    x              # data-frame with name, value, and type 
  , weight         # vector with weights for each observations
      = rep(100, nrow(x))
)
{
    data(bsmnt_obs_type)
    sapply(seq_len(nrow(x)),
          function(i) {
                ti <-  # index of type 
                    which(bsmnt_obs_type$group == as.character(x[i,3]))
                group <- as.character(bsmnt_obs_type$group[ti])
              sprintf("%-15s%-10.3f%.3f%10s", x[i,1], x[i,2], weight[i], group)
          }
    )
    ### Returns a vector of lines of strings of observation-data
}

