getTplArgs <- 
    function       # extracts variables from parameter-template-file
(
 fn     # file-name of parameter-template-file
,esc    # character which escapes variables-names
 )
{
    cmd <- paste("cat ", fn, " | grep ", esc, ".*", esc, 
                 " | awk -F ", esc, 
                 " '{ print "
                 ,paste('$', seq(2,100, 2), sep = '', collapse = ', '), " }' " 
                 , sep = "")
    con <- pipe(cmd)
    pn_sp <-                     # parameter-names; could contain empty ones
        unlist(strsplit(gsub("^[[:space:]]+|[[:space:]]+$", "", 
             readLines(con)
             ), " "))
    close(con)
    pn_sp[pn_sp != ""] #  parameter-names 
    ### Returns a vector with variables-names in parameter-template-file
}
