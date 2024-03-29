genInsString <- 
    function       # generates a ins string 
( 
    names          # vector with observation-names
   ,type           # type of observation-file; either "mark" or "hydrograph"
   ,prog = 'bsmnt' # program to produce ins-string for
 )
{
    functions <- 
        list(
          'bsmnt' = genBsmntInsString
         ,'sitra' = genSitraInsString
        )
    if ( ! prog %in% names(functions)) 
        stop('Currently there is only `bsmnt` and `sitra` supported for `prog`')
    functions[[prog]](names, type)
}
