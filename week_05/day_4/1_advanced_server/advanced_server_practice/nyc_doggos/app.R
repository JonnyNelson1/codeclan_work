library(CodeClanData)
library(shiny)
library(shinythemes)
library(tidyverse)
library(DT)

nyc_doggos <- read_csv("data/nyc_dogs.csv")

ui <- fluidPage(
    
    fluidRow(
        
        column(3,
            radioButtons("gender_input",
                         "Gender of Dog",
                         choices = c("Male", "Female"))
        ),
        
        column(3,
            selectInput("colour_input",
                        "Colour of Dog",
                        choices = unique(nyc_doggos$colour))
        ),
        
        column(3,
            selectInput("borough_input",
                        "Borough",
                        choices = unique(nyc_doggos$borough)),
        ),
        
        column(3,
            selectInput("breed_input",
                        "Breed",
                        choices = unique(nyc_doggos$breed)),
        )
    ),
    
    actionButton("update",
                 "Update Dashboard"),

    DT::dataTableOutput("table_output")
)

server <- function(input, output) {
    browser()
    nyc_doggos_filtered <- eventReactive(input$update, {
        nyc_doggos %>%
            filter(gender == input$gender_input) %>%
            filter(colour == input$colour_input) %>%
            filter(borough == input$borough_input) %>%
            filter(breed == input$breed_input)
    })
    browser()
    output$table_output <- DT::renderDataTable({
        nyc_doggos_filtered()
    })
    

}

shinyApp(ui = ui, server = server)

