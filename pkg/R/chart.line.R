#' Create Simple Line Charts of Georgian Stock Trades
#' 
#' \code{chart.line} shows a specified line chart of a specific stock
#'
#' @inheritParams download.single.stock.trade
#' @param type take character string to decide what plot to draw. See ?plot for details on type
#' @param col take character string to decide what color to use. See ?plot for details on col
#' @param time take character string of either "Date" or "Session" to decide 
#'        whether to use date or session as x-axis
#' @param y determines what is the y-axis value; 
#'        take character string of "Min. price" or "Max.price" or "Weighted avg. price" or "Weighted
#'        closing price" or "Volume in Securities" or "Volume in GEL"
#'   
#' @seealso  \link{download.single.stock.trade}
#'   
#' @examples
#' chart.line(ID = "AGVQ", export = FALSE, type = "l", col = "red", time = "Date", y = "Min. price")
#' 

chart.line <- function(ID = "AGVQ", export = FALSE, type = "o", col = "red", time = "Date", y = "Min. price"){
  
  ## get the data of that stock
  temp <- download.single.stock.trade(ID = ID)
  
  plot(temp[[which(colnames(temp) == time)]], temp[[which(colnames(temp) == y)]], xlab = time, 
       ylab = y, type = type, col = col, main = paste(y, "of", ID, "for all time"))
  
  ## write export to jpeg later
  if(export == TRUE){
    ## write.csv(stockIDs.table, "All_Stocks_Symbols.csv")
  }
  
}