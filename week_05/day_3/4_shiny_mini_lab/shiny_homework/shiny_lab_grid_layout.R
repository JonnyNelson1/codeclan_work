library(shiny)
library(tidyverse)
library(shinythemes)

olympics_overall_medals <- read_csv("data/olympics_overall_medals.csv")


ui <- fluidPage(
  
  titlePanel(tags$h3("Five Country Medal Comparison")),
  
  plotOutput("medal_plot"),
  
  
  fluidRow(
    
    column(1,
    ),
    
    column(5,
           
           radioButtons("season_input",
                        tags$i("Which season?"),
                        choices = c("Summer", "Winter")
           )
           
           
    ),
    
    column(5,
           radioButtons("medal_input",
                        tags$i("Gold, Silver or Bronze?"),
                        choices = c("Gold", "Silver", "Bronze")
           )
    ),
    
    column(1,
    )
    
    
  )
  
)





server <- function(input, output){
  
  
  output$medal_plot <- renderPlot({
    
    olympics_overall_medals %>%
      filter(team %in% c("United States",
                         "Soviet Union",
                         "Germany",
                         "Italy",
                         "Great Britain")) %>%
      filter(medal == input$medal_input) %>%
      filter(season == input$season_input) %>%
      mutate(as.factor(medal)) %>%
      ggplot() +
      aes(x = team, y = count, fill = medal) +
      geom_col() +
      scale_fill_manual(values = c("Gold" = "gold",
                                   "Silver" = "grey87",
                                   "Bronze" = "tan3")) +
      theme_minimal()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

