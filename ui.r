library(shiny)
library(formattable)
library(shinydashboard) 

fluidPage(
  # Application title
  titlePanel("Jobs API data examples"),
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel( 
      
      
      radioButtons("choice", "Job :", 
                   c ( "Data Scientist" = "Data%20Scientist", "Cook" = "Cook", "Statistician" = "Statistician" ), 
                   selected = "Cook",  width = 300),
      
      
      
       
     
      hr(),width = 2
      

    ),
    
    
    mainPanel( 
      tabsetPanel(
       
        
        tabPanel("UniversalJobcentre API",formattableOutput ("universal")),
        tabPanel("Indeed API",formattableOutput ("indeed"))
      
      
      )
      
      )
      
      
)
)





############################
#load file code
# fileInput('file1', 'Choose file to upload',
#           accept = c(
#             'text/csv',
#             'text/comma-separated-values',
#             'text/tab-separated-values',
#             'text/plain',
#             '.csv',
#             '.tsv'
#           )
# )




