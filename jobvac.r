#library(jsonlite)
#library(RJSONIO)
#library(httr)    # for GET(...)
library(jsonlite)
library(formattable)
library(RCurl)

#json_file <- "http://api.lmiforall.org.uk/api/v1/vacancies/search?keywords=cook"



#You will need to include your api key 
#for all requests in a basic authentication http header as the username, leaving the password empty.



query <- "http://www.reed.co.uk/api/1.0/search?keywords=accountant&location=london&distancefromlocation=15"
#getdata<-GET(url=query, authenticate("a3296058-fe85-4e6e-934e-50f2f0f78f88", "")) 

reedjson<- getURL(query, userpwd="a3296058-fe85-4e6e-934e-50f2f0f78f88:", httpauth = 1L)


result<-(fromJSON( reedjson ))

#result <-(fromJSON((json_file)))

formattable(result, list())









