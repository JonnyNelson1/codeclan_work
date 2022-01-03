library(CodeClanData)
library(shinythemes)
library(shiny)
library(tidyverse)




ui <- fluidPage(
    
    titlePanel(tags$b("Reaction Time vs. Memory Game")),
    
    sidebarLayout(
        sidebarPanel(
            
            radioButtons("colour_input",
                         "Colour of Points",
                         choices = c(Blue = "#3891A6",
                                     Yellow = "#FDE74C",
                                     Red = "#E3655B")
                         ),
            
            sliderInput("points",
                        "Transparency of Points",
                        min = 0,
                        max = 1,
                        value = 30),
            
            selectInput("shape_input",
                        "Shape of Data Points",
                        choices = c(Square = 15, Circle = 16, Triangle = 17)
                        ),
            
            textOutput()
            
            
        ),
        
        mainPanel()
    )
)




server <- function(input, output, session) {
  
}

shinyApp(ui, server)