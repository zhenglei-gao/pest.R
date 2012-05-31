getPsttArgs <- 
    function       # extract variables from pest-template-file
(
    ls             # vector with lines of pest-template-file
   ,esc = '\\$'    # escape character of variables
 )
{
    getVar <- 
        function   # finds escaped variables in vector of strings
    (
         x           # vector with strings
        ,esc = '\\$' #  escape-character
     )
    {
        grep(paste(esc,".*", esc, sep = ""), x) # Indices of parameters in pest-file
        ### Returns indices of variables in `x`
    }
    pargsi <- getVar(ls)
    as.character(unlist(sapply(ls[pargsi], 
                               function(x) {
                                   xs <- unlist(strsplit(x, " "))
                                   i <- getVar(xs)
                                   gsub("\\$","",xs[i])
                               }
                               )))

}

