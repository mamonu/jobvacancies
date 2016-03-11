library(shiny)
library(formattable)
fluidPage(
  # Application title
  titlePanel("Jobs API data examples"),
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel( 
      
      
      radioButtons("choice", "Job :", 
                   c ( "Data Scientist" = "Data%20Scientist", "Cook" = "Cook", "Singer" = "Singer" ), 
                   selected = "Cook", inline = TRUE, width = 300)
      
      
      
      ,
     
      hr()
#       ,
#       radioButtons("apichoice", "API :", 
#                         c ( 
#                           
#                             "Universal Jobmatch" = "1", 
#                             "Reed" = "2", 
#                             "Indeed" = "3" 
#                             ), 
#                         selected = "Universal Jobmatch", inline = TRUE, width = 300)
      

    ),
    
    
    mainPanel( 
      tabsetPanel(
        tabPanel("UniversalJobcentre API",formattableOutput ("universal")),
      tabPanel("Indeed API",uiOutput ("indeed"))
      
      
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




