library(tidyverse)
library(shiny)
library(shinythemes)
library(CodeClanData)
library(DT)

ui <- fluidPage(
    
    fluidRow(
        
        column(3,
               radioButtons('colour_input',
                            'Colour of Graph',
                            choices = c("bleu", "rouge"),
                            inline = TRUE)
        ), 
        
        column(3,
               radioButtons('handed_input',
                            'Handedness',
                            choices = unique(students_big$handed),
                            inline = TRUE)
        ), 
        
        column(3,
               selectInput("region_input", 
                           "Which Region?", 
                           choices = unique(students_big$region))
        ), 
        
        column(3,
               selectInput("gender_input", 
                           "Which Gender?",
                           choices = unique(students_big$gender))
        ),
    ),
    
    actionButton("update",
                 "Update Dashboard"),
    
    # ADD IN A FLUID ROW WITH OUR NEW PLOTS HERE
    fluidRow(
        column(6,
               plotOutput("travel_barplot")
        ),
        column(6,
               plotOutput("spoken_barplot")
        )
    ),
    DT::dataTableOutput("table_output")
)



server <- function(input, output) {
    
    students_filtered <- eventReactive(input$update, {
        students_big %>%
        filter(handed == input$handed_input) %>%
        filter(region == input$region_input) %>%
        filter(gender == input$gender_input)
        })
    
    output$table_output <- DT::renderDataTable({
        students_filtered()
    })
    
    # ADD IN OUR PLOTS HERE TO SERVER
    output$travel_barplot <- renderPlot({
        students_filtered() %>%
            ggplot() + 
            geom_bar(aes(x = travel_to_school), fill = input$colour_input)
    })
    
    output$spoken_barplot <- renderPlot({
        students_filtered() %>%
            ggplot() + 
            geom_bar(aes(x = languages_spoken), fill = input$colour_input)
    })
    
}

shinyApp(ui = ui, server = server)
