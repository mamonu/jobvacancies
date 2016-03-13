
library(RCurl)
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
#setwd("/home/bigdata/LDA/textmining/")
#Afile<-'linked.txt'
#Afile<-'caravanelse.csv'

 


shinyServer(function(input, output, session) {

  
  filteredData <- reactive({
    json_file <- paste0(indeedapi1,input$choice,indeepapi2)
    #json_file <- paste0(indeedapi1,"cook",indeepapi2)
    
    result <-data.frame(fromJSON((json_file)))
    
    drops <- c("version","highlight","version","results.onmousedown","start","end","pagenumber",
               "results.noUniqueUrl","dupefilter","totalResults","pageNumber", "results.state",
               
               "results.url" ,"results.jobkey", 	"results.sponsored", 	"results.expired", 	"results.indeedApply"
               
    )
    
    
    
    
    result <- result[ , !(names(result) %in% drops)]
    
    
  })
  
  
  
  
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
  
  
 
  output$reed <- renderFormattable    ({
  
  query <- "http://www.reed.co.uk/api/1.0/search?keywords=accountant&location=london&distancefromlocation=15"
  #getdata<-GET(url=query, authenticate("a3296058-fe85-4e6e-934e-50f2f0f78f88", "")) 
  
  reedjson<- getURL(query, userpwd="a3296058-fe85-4e6e-934e-50f2f0f78f88:", httpauth = 1L)
  
  
  result<-(fromJSON( reedjson ))
  
  #result <-(fromJSON((json_file)))
  
  
  
  
  formattable((result$results), list())
  
  })
  
  
  
  
  
  output$universal <- renderFormattable    ({
    
    json_file <- paste0("http://api.lmiforall.org.uk/api/v1/vacancies/search?keywords=",input$choice)
    result <-data.frame(fromJSON((json_file)))
    formattable(result,list())
    
    
  })
  
  
  output$mymap <- renderLeaflet   ({
    

   
    
    
  m <- leaflet()   %>% setView(lng = -1.24757, lat = 50.862676, zoom = 6)%>%
    #addTiles() %>%  # Add default OpenStreetMap map tiles  set PO15 5RR as default view
    
    
    addProviderTiles("CartoDB.Positron", group = "CartoDB.Positron",options = providerTileOptions(noWrap = FALSE)) %>%

    
    addMarkers( data =  filteredData(), lat = ~ results.latitude, lng = ~ results.longitude , popup=~results.snippet ) 
  
  
  # %>%
    
    
    # Layers control
    # addLayersControl(
    #   baseGroups = c("OSM (default)")
    # )
  
  m
  
  })
  

 })



