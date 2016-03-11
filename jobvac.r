#library(jsonlite)
#library(RJSONIO)

library(jsonlite)
library(formattable)

json_file <- "http://api.lmiforall.org.uk/api/v1/vacancies/search?keywords=cook"

result <-(fromJSON((json_file)))

formattable(result, list())









