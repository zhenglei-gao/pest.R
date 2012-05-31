pasteObsName <- 
    function       # converts a date object into a unique string
(   
    x              # character string with time-stamps: format ()
   ,id             # two-char id of hydrograph
   ,pat            # pattern to remove from name        
)
{
    paste(id ,gsub(pat, "", x), sep = "") # String with unique time-stamp
}
