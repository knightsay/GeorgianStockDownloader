#' Download Multiple Stocks Data from Georgian Stock Exchange Website
#' 
#' \code{download.multi.stock.trade} takes a data frame of stock IDs and returns a data frame of its trade result
#' 
#' @param ID the data frame of stock IDs that we want trade results of.
#'            The data frame should contain only one column of symbols
#'   
#' @return data frame containing the trade results of different stock issues from every day 
#'         available on the website. 
#'   
#' @seealso  \link{download.stockIDs}
#'   
#' @examples
#' stocks = data.frame(ID = c("AGVQ", "AKAT"))
#' download.multi.stock.trade(ID = stocks) 

download.multi.stock.trade <- function(ID){
  result.table = data.frame()
  for(i in 1:length(ID[, 1])){
    temp <- download.single.stock.trade(ID = ID[i, 1])
    temp <- cbind(ID = ID[i, 1], temp)
    result.table = rbind(result.table, temp)
  }
  return(result.table)
}