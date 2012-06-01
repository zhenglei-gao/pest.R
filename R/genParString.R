genParString <- 
    function       # Generate a parameter-data string
    ### Generates a parameter-data string, which could be readily put into the
    ### "parameter data"-section in the pest-templte
(
    x              # data-frame with names and values
   ,bounds =       # boundaries in which parameters could vary
      c(15, 60)
)
{
    apply(x, 1,    # String with parameter-data line
          function(e) {
              sprintf("%-15s   log   factor    %15s  %15s  %15s    fr   1.0   0.0"
                    , tolower(e[1]), e[2],  bounds[1], bounds[2])
          }
    )
    ### Returns a string of a line with parameter-data
}
