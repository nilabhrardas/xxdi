#' @title xd_index
#'
#' @description Compute xd index for an institution
#'
#' @param df A data frame object
#' @param cat Data frame column containing categories
#' @param id Data frame column containing IDs
#' @param cit Data frame column containing citations
#' @param dlm Delimiter in cat_col. Default delimiter set to ";"
#'
#' @return xd index value for institution
#'
#' @examples
#' dat1 <- data.frame(citations = c(0, 1, 1, 2, 3, 5, 8),
#'                    keywords = c("a; b; c", "b; d", "c", "d", "e; g", "f", "g"),
#'                    id = c("abc123", "bcd234", "def345", "efg456", "fgh567", "ghi678", "hij789"),
#'                    categories = c("a; d; e", "b", "c", "d; g", "e", "f", "g"))
#' xd_index(df = dat1, cat = "categories", id = "id", cit = "citations", dlm = ";")
#'
#' dat2 <- data.frame(citations = c(0, 1, 1, 2, 3, 5, 8),
#'                   keywords = c("a/ b/ c", "b/ d", "c", "d", "e/ g", "f", "g"),
#'                   id = c("123", "234", "345", "456", "567", "678", "789"),
#'                   categories = c("a/ d/ e", "b", "c", "d/ g", "e", "f", "g"))
#' xd_index(df = dat2, cat = "categories", id = "id", cit = "citations", dlm = "/")
#'
#' dat3 <- data.frame(citations = c(0, 1, 1, 2, 3, 5, 8),
#'                   keywords = c("a, b, c", "b, d", "c", "d", "e, g", "f", "g"),
#'                   id = c(123, 234, 345, 456, 567, 678, 789),
#'                   categories = c("a: d: e", "b", "c", "d: g", "e", "f", "g"))
#' xd_index(df = dat3, cat = "categories", id = "id", cit = "citations", dlm = ":")
#' @export
#' @importFrom tidyr separate_rows
#' @importFrom Matrix colSums
#' @importFrom agop index.h
#' @importFrom stats na.omit

# Function to calculate xd index
xd_index <- function(df, cat, id, cit, dlm = ";") {

  # Load dependent libraries
  library(tidyr)
  library(Matrix)
  library(agop)

  dat <- data.frame(cat = df[[cat]], idc = df[[id]], ctc = df[[cit]])

  #Change structure
  dat$kwc <- as.character(dat$cat)
  dat$idc <- as.character(dat$idc)
  dat$ctc <- as.numeric(dat$ctc)

  # Clean dataset
  df_separated <- separate_rows(dat, cat, sep = dlm)

  df_separated <- data.frame(lapply(df_separated, function(x) ifelse(x == "", NA, x)))

  df_sep <- na.omit(df_separated)

  # Filter out unique keywords and unique WOS IDs
  unique_keywords <- unique(trimws(df_sep$cat))
  unique_ids <- unique(df_sep$idc)

  # Create an empty matrix with rows for unique IDs and columns for unique keywords
  citation_matrix <- matrix(0, nrow = length(unique_ids), ncol = length(unique_keywords),
                            dimnames = list(unique_ids, unique_keywords))

  # Fill the matrix with citation numbers
  for (i in 1:nrow(df_sep)) {
    col_name <- trimws(df_sep$cat[i])
    row_name <- df_sep$idc[i]
    citation_matrix[row_name, col_name] <- df_sep$ctc[df_sep$idc == row_name & trimws(df_sep$cat) == col_name]
  }

  # Form a vector of the column sums without the names of the columns
  col_sum_citation_matrix <- unname(colSums(citation_matrix))

  return(index.h(col_sum_citation_matrix))
}
