#' Download Single Stock Data from Georgian Stock Exchange Website
#' 
#' \code{download.single.stock.trade} takes a stock ID and returns a data frame of its trade result
#' 
#' @param ID the single stock ID that we want trade results of
#'   
#' @return data frame containing the trade results of different stock issues from every day 
#'         available on the website. 
#'   
#' @seealso  \link{download.stockIDs}
#'   
#' @examples
#' download.single.stock.trade(ID = "AGVQ") 

download.single.stock.trade <- function(ID){
  
  ## remember to put sep = "", otherwise default by adding extra space
  stock.URL    <- paste("http://www.gse.ge/Stocks/data3.asp?Code=", ID, sep = "")
  temp <- readHTMLTable(stock.URL, header = T, trim = T, as.data.frame = TRUE)
  
  ## check if there's any trade results for this stock
  if(length(temp) >= 5){
    
    result.table <- temp[[5]]
    
    ## remove strange characters resulting from blanks
    ## or change sub = "0" if needed (remember quote marks)
    result.table[, 7] <- as.numeric(iconv(result.table[, 7], "latin1", "ASCII", sub = NA))
    
    ## remove commas in certain columns
    result.table[, 8] <- as.numeric(gsub(",","", result.table[, 8]))
    result.table[, 9] <- as.numeric(gsub(",","", result.table[, 9]))
    
    ## convert to correct numeric type
    for(i in 3:6){
      result.table[, i] <- as.numeric(levels(result.table[, i]))[result.table[, i]]
    }
    
  }
  else{
    result.table <- data.frame(matrix(NA, ncol = 9))
  }
  
  names(result.table) <- c("Session", "Date", "Trades", "Min. price", "Max.price", 
                           "Weighted avg. price", "Weighted closing price", "Volume in Securities",
                           "Volume in GEL")
  
  ## change Date format and type to Date type
  newdate = strptime(as.character(result.table$Date), "%d/%m/%y")
  
  return(result.table)
}