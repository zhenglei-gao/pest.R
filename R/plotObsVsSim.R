plotObsVsSim <- 
    function       # plots a data-frame with time, observation and simulation columns
(
    x              # data-frame with time, observation and simulation columns 
   ,type =         # type of data; 
        c("hydrograph","marks") 
)
{
    if ( type[1] == "hydrograph" ) 
    {  
    require('basement', quietly = TRUE)
    require("ggplot2", quietly = TRUE)
    require("reshape2", quietly = TRUE)
    names(x) <- c("Time","Observation", "Simulation")
    data.df <- melt(x, id.vars = "Time", variable.name = "Type")
    names(data.df)[3] <- "Waterlevel"
    p <- ggplot(data.df, aes(x = Time, y = Waterlevel))
    p + 
        geom_line(aes(group = Type, colour = Type)) + 
        geom_point(aes(colour = Type)) + 
        labs(title = paste("Waterlevel starting from ", as.character(x[1,1]))
           , y = "Wasserspiegel [müM]"
           , x = "Zeit"
        )
    } else if (type[1] == "marks")
    {
        stop('Not implemented yet')
    } else
    {
        stop('Type not supported')
    }
}
