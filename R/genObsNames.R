genObsNames <-
  function                              # ^ Create unique observation-names
## Creates unique observation-names with not more than 15-characters
(
    x                                   # ^ observation-point vector
   ,y                                   # ^ difftime-vector
)
{
  adaptName <-
    function(n)       # ^ verifies that a name doesn't exceed 15-chars
      {
        NL <- 15                        # number character limit
        n <- tolower(n)
         if (nchar(n) > NL)
             paste(tail(strsplit(n, "")[[1]], n = 15), collapse = "")
        else
          n

      }
  tempname <- function(x) basename(tempfile("", "", ""))
  nms <- paste(as.character(x),as.character(y), sep = "")
  nms.l <-  sapply(nms, nchar)
  i <-                                  # to long names
    as.logical(nms.l > 15)
  if (any(i))
    nms[i] <- sapply(nms[i], adaptName)
  j <-                                  # duplicated names
    duplicated(nms)
  if (sum(j) > 0 )
    nms[j] <- sapply(nms[j], tempname)
  nms                      # ^ Returns a vector with observation-names
}
