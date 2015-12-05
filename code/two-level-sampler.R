require(RItools)

#' Overview: given an upper and lower level factor variable, 
#' create samples for a two stage random assignment in which the lower level
#' gets assigned to treatment only if the upper level also gets assigned to
#' treatment
#'
#' This implementation is a little wastful in that is computes assignments for
#' all lower level units first, and then discards for those units in control
#' upper level groups.
#' 
#' @param upperBlockSize A vector of the size of the upper blocks (in our
#' case, probably all have size 3)
#' @param treatedUpper The number of upper level blocks that will be treated
#' in each sample. (In our case, probably 1 per upper block).
#' @param lowerBlockSize A vector of the sizes of the lower level blocks.
#' Should have length equal to sum(upperBlockSize).
#' @param treatedLower A vector of the number that will be treated in lower
#' level block, if it is selected.
#' @return A function that returns a matrix of units by treatment assignments.
#' Data are assumed to be in upper block order (that is, all of unit 1 are
#' first, then all of unit 2, etc.)
upperLowerSampler <- function(upperBlockSize, treatedUpper, lowerBlockSize, treatedLower) {
  # sanity checks:
  stopifnot(length(upperBlockSize) == length(treatedUpper))
  stopifnot(all(upperBlockSize > treatedUpper))
  
  stopifnot(length(lowerBlockSize) == length(treatedLower))
  stopifnot(all(lowerBlockSize > treatedLower))

  stopifnot(length(lowerBlockSize) == sum(upperBlockSize))

  sampleUpper <- simpleRandomSampler(total = upperBlockSize, 
                                     treated = treatedUpper)

  sampleLower <- simpleRandomSampler(total = lowerBlockSize,
                                     treated = treatedLower)

  
  # return value is a function that takes the number of samples desired
  function(n) {
    uppers <- sampleUpper(n)$samples
    lowers <- sampleLower(n)$samples

    uwidth <- dim(uppers)[2]
    # if we've exceed the total number of ways to sample from uppers, sample
    # with replacement
    if (uwidth < n) {
      # get enough school level randomizations
      uppers <- uppers[, sample.int(uwidth, size = n, replace = T)]
    }

    repUppers <- apply(uppers, 2, 
      function(upper) {
        rep(upper, times = lowerBlockSize)
    })

    return(list(weight = 1, samples = repUppers * lowers))
  }
}
