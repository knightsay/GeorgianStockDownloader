#' Export Stock Data to CSV Files
#' 
#' \code{export.csv} writes a csv file for the stock data
#' 
#' @param data the data file to write into csv files
#'
#' @seealso  \link{download.all.stock.trade}
#'   
#' @examples
#' export.csv()
#' 

export.csv <- function(data){
  
  write.csv(data, file = "MyData.csv",row.names=FALSE)
  
}