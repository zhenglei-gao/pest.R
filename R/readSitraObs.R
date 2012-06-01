readSitraObs <- 
    function       # Read sitra-observations
(
    file           # sitra-observation-file
)
{
    obs.lines <- readLines(file) 
    time_unit_line <- unlist(strsplit(obs.lines[6], " +"))

    proc_tu_function <-  # functions how to process time-units
        list(
           'BEZUGSDATUM' =  function(d)
           {
               asDate <- function(st) 
                   as.POSIXct(strptime(st, format = "%d.%m.%Y"))
               difftime(asDate(d), asDate(time_unit_line[2])) 
           }
          ,'ZEITEINHEIT' =  function(d)
              d
        )

    procTu <- proc_tu_function[[time_unit_line[1]]]

    obs.string <- paste(obs.lines[-seq(1,6)], collapse = "\n")
    obs.points <- strsplit(obs.string, "\nPOTE\\s*")[[1]][-1]
    obs.df <- 
    Reduce(
       rbind, 
       lapply(obs.points, function(x)
       {
           point.lines.in <- strsplit(x, "\n")[[1]]
           point.lines <- point.lines.in[point.lines.in != ""]
           point.name <- 
           {
               if ( length(grep(" +", point.lines[1])) > 0 ) 
               {  
                   pn <- unlist(strsplit(point.lines[1], " +"))
                   pn[length(pn)]
               } else {
                   point.lines[1]
               }
           }
           Reduce(
              rbind,
              lapply(point.lines[-c(1,2)], function(r)
              {
                  obs <- unlist(strsplit(r, " +"))[1:3]
                  obs.name <- round(as.numeric(procTu(obs[1])))
                  c(point.name, as.numeric(obs.name), as.numeric(obs[-1]))
              }
              )
              , c(character(), numeric(), numeric()) 
           )
       }
       )
     , data.frame()
   )
    # Convert Factors to numeric
    out.df <- 
        data.frame(cbind(obs.df[,1]
                       , data.frame(matrix(as.numeric(as.matrix(obs.df[,-1])),
                              , ncol = 3
                         ))
                   )
        )
    names(out.df) <- c('obs_point', 'difftime', 'wse', 'sd')
    out.df
    ### Returns a data-frame with columns: date, waterlevel and
    ### standard-deviation
}
