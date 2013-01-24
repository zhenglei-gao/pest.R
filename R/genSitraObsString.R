genSitraObsString <- 
    function       # Generate a observation-data string
    ### Generates a observation-data string for the pest-file
(
    x              # data-frame with name, value, and type 
)
{
    apply(x, 1,
          function(r) {
              sprintf("%-15s %-10.3f %.3f %10s",
                      r[1], as.numeric(r[2]), as.numeric(r[3]), r[4])
          }
    )
    ### Returns a vector of lines of strings of observation-data
}

