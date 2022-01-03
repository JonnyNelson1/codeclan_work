library(shiny)
library(tidyverse)
library(CodeClanData)

students_big_data <- students_big

ui <- fluidPage(

    radioButtons("age_input",
                 "Age",
                 choices = unique(students_big_data$ageyears),
                 inline = TRUE),
    
    actionButton("update", "Update dashboard"),
    
    fluidRow(
        column(6,
               plotOutput("height_barplot")
        ),
        column(6,
               plotOutput("arm_span_barplot")
        )
    )
)

server <- function(input, output, session) {
    
    filtered_students <- eventReactive(input$update, {
        students_big_data %>%
            filter(ageyears == input$age_input)
            })
    
    output$height_barplot <- renderPlot({
        filtered_students() %>%
            ggplot() +
            geom_bar(aes(x = height), fill = "steel blue")
    })
    
    output$arm_span_barplot <- renderPlot({
        filtered_students() %>%
            ggplot() +
            geom_bar(aes(x = arm_span), fill = "steel blue")
    })
  
}

shinyApp(ui, server)
