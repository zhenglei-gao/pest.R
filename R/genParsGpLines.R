genParsGpLines <-
  function                              # ^ create  parameter-group-lines
(
  pargp                                 # ^ parameter-groups
)
{
  sapply(pargp, function(x)
         sprintf("%-15s  relative  0.01   0.001    switch  2.0 parabolic", x))
}
