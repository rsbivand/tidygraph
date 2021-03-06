#' @export
#' @importFrom dplyr rename
rename.tbl_graph <- function(.data, ...) {
  .graph_context$set(.data)
  on.exit(.graph_context$clear())
  d_tmp <- as_tibble(.data)
  d_tmp <- rename(d_tmp, ...)
  set_graph_data(.data, d_tmp)
}
#' @export
#' @importFrom dplyr rename
rename.morphed_tbl_graph <- function(.data, ...) {
  .data[] <- lapply(.data, protect_ind, .f = rename, ...)
  .data
}
#' @export
dplyr::rename
