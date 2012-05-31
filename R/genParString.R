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
              paste(tolower(e[1]),"   log   factor    ",e[2],
                    "     ", bounds[1],"     ",    bounds[2], "    fr   1.0     0.0     1")
          }
    )
    ### Returns a string of a line with parameter-data
}
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

