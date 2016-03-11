library(tm)
library(RTextTools)
library(topicmodels)
library(dplyr)
library(stringi)
library(LDAvis)
library(slam)
library(lda)
library(plyr)
library(jsonlite)
library(formattable)
library(shiny)
library(XML)

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

  output$indeed <- renderUI    ({
  
 
  
    #json_file <- paste0("http://api.lmiforall.org.uk/api/v1/vacancies/search?keywords=",input$choice)
    XMLquery <- paste0(indeedapi1,input$choice,indeepapi2)
    
    
    
    txt <- htmlToText(XMLquery)
    HTML(txt)
    
#    html.raw     <- htmlTreeParse(XMLquery, useInternalNodes = TRUE)
    
    
#    topxml <- xmlSApply(xmlRoot(html.raw),
#                       function(x) xmlSApply(x, xmlValue))
     
    
    
 
    
    #result <- xmlToDataFrame(doc)
    #result <-(fromJSON((json_file)))
    #formattable(result,list())

  })
  
  
 
  
  
  output$universal <- renderFormattable    ({
    
    json_file <- paste0("http://api.lmiforall.org.uk/api/v1/vacancies/search?keywords=",input$choice)
    result <-(fromJSON((json_file)))
    formattable(result,list())
    
    
  })
  
  

 })



