 
 
 
 
 
 
 
library(jsonlite)
library(formattable)
library(shiny)
 

#nInst = 4 # Change level of parallelism
#useBackend(parallel,executors = nInst)





#clean up the r environment.
rm(list = ls())
#@home working directory
#setwd("/Users/thorosm2002/Dropbox/Rcode/LDAShiny")


#@work working directory
setwd("/home/bigdata/LDA/textmining/")
#Afile<-'linked.txt'
#Afile<-'caravanelse.csv'

 


shinyServer(function(input, output, session) {

  output$indeed <- renderFormattable    ({
  
 
  

    json_file <- paste0(indeedapi1,input$choice,indeepapi2)
    #json_file <- paste0(indeedapi1,"cook",indeepapi2)
    
    result <-data.frame(fromJSON((json_file)))
    
    drops <- c("version","highlight","version","results.onmousedown","start","end","pagenumber",
               "results.noUniqueUrl","dupefilter","totalResults","pageNumber", "results.state",
               
               "results.url" ,"results.jobkey", 	"results.sponsored", 	"results.expired", 	"results.indeedApply"
               
               )
               
               
               

        result <- result[ , !(names(result) %in% drops)]
    formattable(result, list())
    


  })
  
  
 
  
  
  output$universal <- renderFormattable    ({
    
    json_file <- paste0("http://api.lmiforall.org.uk/api/v1/vacancies/search?keywords=",input$choice)
    result <-data.frame(fromJSON((json_file)))
    formattable(result,list())
    
    
  })
  
  

 })



