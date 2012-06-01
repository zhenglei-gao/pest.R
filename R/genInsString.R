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
          'basmnt' = genBsmntInsString
        )
}
