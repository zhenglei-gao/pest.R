subParsInTmpl <- 
    function       # Substitute parameters in template-file
(
    repls          # named list with key as parameter to substitue, and value
                   ### the string to insert
   ,tmpl           # vector of lines of template file to do the substitutions in
                   ### eg. read in with readLines()
   ,esc = "\\$"    # escape character for variables in pest-template
)
{
   exts <-         # nothing usefull returned; `tmpl` was modified
     sapply(names(repls),
          function(x){
             tmpl <<-  # ! inplace modification of tempate strings
                 sub(paste(esc, "[[:space:]]*",x,"[[:space:]]*", esc, sep = ""), 
                      repls[[x]], tmpl)
              }
       )
   paste(tmpl, collapse = "\n") # String with parameter-replaced template file
   ### Returns a string of the parameter-replaced template file, which is ready
   ### for `cat`
}
