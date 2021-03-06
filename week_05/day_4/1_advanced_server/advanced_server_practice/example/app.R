library(tidyverse)
library(shiny)
library(CodeClanData)
                        
ui <- fluidPage(
    sliderInput("sample_size", "Sample Size", value = 50, min = 1, max = 912),
    plotOutput("histogram")
)

server <- function(input, output) {
    
    
    
    sampled_data <- reactive ({
        students_big %>%
            select(height) %>%
            sample_n(input$sample_size) 
    })
        
    browser()
    
    output$histogram <- renderPlot({
        
        ggplot(sampled_data()) +
            aes(x = height) +
            geom_histogram()
        
    })
    
    }
    
    shinyApp(ui, server)
    
   
    