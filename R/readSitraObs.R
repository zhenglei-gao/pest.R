readSitraObs <- 
    function       # Read sitra-observations
(
    file           # sitra-observation-file
)
{
  readPointData <-
    function(x, skip, pname, ptype)
      {
        d <- 
          read.table(text = x, skip = skip 
                   , stringsAsFactor = F
                   , col.names = c('Date', 'Ele', 'Q'))
        d.tu <- 
          transform(d, Date = round(as.numeric(procTu(Date))))
        with(d.tu,
             data.frame(Name = pname
                        , Date = Date
                        , Ele = Ele
                        , Q = Q
                        , Type = ptype))
      }
  procPointWithNodes <-
    function(x, pname, ptype)
      {
        s <- 
          scan(text = x, what = "character", nlines = 2, quiet = TRUE)
        nele <- as.numeric(s[length(s)])
        nds <- scan(text = x, skip = 2, nmax = nele, quiet = TRUE)
        n <- grep(nds[length(nds)], strsplit(x, "\n")[[1]]) 
        readPointData(x, skip = n, pname, ptype)
      }
  proc_tu_function <-  # functions how to process time-units
    list(
      'BEZUGSDATUM' =  function(d, units = "day")
      {
        asDate <- function(st) 
          as.POSIXct(strptime(st, format = "%d.%m.%Y"))
        difftime(asDate(d), asDate(time_unit_line[2]), units = units) 
      }
      ,'ZEITEINHEIT' =  function(d)
      d
      )
    obs.lines <- readLines(file) 
    time_unit_line <- unlist(strsplit(obs.lines[6], " +"))


    procTu <- proc_tu_function[[time_unit_line[1]]]

    obs.string <- paste(obs.lines[-seq(1,7)], collapse = "\n")
    obs.points <- strsplit(obs.string, "\n\\s*\n")[[1]]
  do.call(
    rbind, 
    lapply(obs.points, function(x)
           {
             header <-  # point-type
               scan(text = x,  what = "character", nlines = 1, quiet = T)
             ptype <- header[1]
             pname <- header[2]
             switch(
               ptype
               ,"POTE" = readPointData(x, skip = 2, pname, ptype)
               ,"KNOT" = procPointWithNodes(x, pname, ptype)
               ,"LKNO" = procPointWithNodes(x, pname, ptype)
               , stop('Keyword ', ptype, ' in .obs-file currently not supported')
               )
           }
           )
    ) # ^ Returns a data-frame with columns: date, waterlevel, standard-deviation and type
}
