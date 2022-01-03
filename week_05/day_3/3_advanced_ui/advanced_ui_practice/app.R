library(shiny)
library(tidyverse)
library(shinythemes)

olympics_overall_medals <- read_csv("data/olympics_overall_medals.csv")
all_teams <- unique(olympics_overall_medals$team)

ui <- fluidPage(
    titlePanel("Olympic Medals"),
    tabsetPanel(
        tabPanel("Plot",
                 plotOutput("medal_plot")
        ),
        tabPanel("Which Season?",
                 radioButtons("season_input", 
                              "Summer or Winter Olympics?", 
                              choices = c("Summer", "Winter")
                 )
        ),
        tabPanel("Which Country?",
                 selectInput("team_input", 
                             "Which team?", 
                             choices = all_teams)
        ),
        tabPanel("The Olympics Website",
                tags$a("The Olympics Website",
                href = "https://www.olympics.com")
        )
    )
)

















server <- function(input, output) {
    
    output$medal_plot <- renderPlot({
        olympics_overall_medals %>%
            filter(team == input$team_input) %>%
            filter(season == input$season_input) %>%
            ggplot() +
            aes(x = medal, y = count, fill = medal) +
            geom_col()
    })
    
}

shinyApp(ui = ui, server = server)











