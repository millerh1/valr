#' Calculate jaccard statistics on two sets of intervals.
#' 
#' @param x tbl of intervals
#' @param y tbl of intervals
#' 
#' @return \code{data_frame} with the following columns:
#'  \itemize{
#'    \item{\code{len_i}}{ length of the intersection}
#'    \item{\code{len_u}}{ length of the union}
#'    \item{\code{jaccard}}{ jaccard statistic}
#'    \item{\code{n_int}}{ number of intersecting intervals between x and y}
#'  }
#'  
#' @seealso \url{http://bedtools.readthedocs.org/en/latest/content/tools/jaccard.html}
#'  
#' @examples
#' x <- tibble::tribble(
#'   ~chrom, ~start, ~end,
#'   "chr1", 10,     20,
#'   "chr1", 30,     40
#' )
#'  
#' y <- tibble::tribble(
#'   ~chrom, ~start, ~end,
#'   "chr1", 15,     20
#' )
#'  
#' bed_jaccard(x, y)
#'  
#' @export
bed_jaccard <- function(x, y) {
  
  res_intersect <- bed_intersect(x, y)
  res_intersect <- summarize(res_intersect, 
                             sum_overlap = sum(.overlap),
                             n_int = n())
        
  res_x <- mutate(x, .size = end - start)
  res_x <- summarize(res_x, sum_x = sum(.size))
  
  res_y <- mutate(y, .size = end - start)
  res_y <- summarize(res_y, sum_y = sum(.size))

  n_i <- res_intersect$sum_overlap
  n <- res_intersect$n_int
  n_x <- res_x$sum_x
  n_y <- res_y$sum_y
  n_u <- n_x + n_y
  
  jaccard <- n_i / (n_u - n_i)

  res <- tibble::tribble(
    ~len_i, ~len_u, ~jaccard, ~n,
    n_i,    n_u,    jaccard,  n
  )  

  res    
}
