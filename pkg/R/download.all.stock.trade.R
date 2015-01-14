#' Download All Stocks Data from Georgian Stock Exchange Website
#' 
#' \code{download.all.stock.trade} returns a data frame of all stocks trade result
#' 
#' @param export boolean value of whether to export the data to a csv file
#' 
#' @return data frame containing the trade results of all stocks issues from every day 
#'         available on the website. 
#'   
#' @seealso  \link{download.stockIDs}
#'   
#' @examples
#' \dontrun{
#'    download.all.stock.trade() 
#' }

download.all.stock.trade <- function(export = FALSE){
  stocks <- download.stockIDs()
  result.table <- download.multi.stock.trade(stocks)
  
  if(export == TRUE){
    write.csv(result.table, "All_trade_result.csv")
  }
  
  return(result.table)
}