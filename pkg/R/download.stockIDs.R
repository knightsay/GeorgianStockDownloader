#' Download Stock IDs from Georgian Stock Exchange Website
#' 
#' \code{download.stockIDs} returns a data frame of stock IDs and corresponding company names
#'
#' @param export boolean value of whether to export the data to a csv file
#'
#' @return data frame containing the stock IDs and corresponding company names
#'   
#' @seealso  \link{download.single.stock.trade}
#'   
#' @examples
#' download.stockIDs()
#' 

download.stockIDs <- function(export = FALSE){
  stockIDs.URL   <- "http://www.gse.ge/Stocks/all1.asp"
  stockIDs.table <- readHTMLTable(doc = stockIDs.URL, header = T, trim = T, as.data.frame = TRUE)[[3]]
  
  names(stockIDs.table) <- c("Trade Symbol", "Name of JSC")
  
  ## change factor to characters
  stockIDs.table[, 1] <- levels(stockIDs.table[, 1])
  
  ## notice that company name for TRAL is bad because of its quotation marks.
  ## no need to solve this now since we only need the stock symbols, not the company names
  
  if(export == TRUE){
    write.csv(stockIDs.table, "All_Stocks_Symbols.csv")
  }
  
  return(stockIDs.table)
}