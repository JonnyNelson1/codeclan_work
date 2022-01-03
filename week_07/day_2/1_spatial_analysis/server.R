server <- function(input, output) {
  
  output$whiskey_map <- renderLeaflet({
    whiskey %>%
      filter(Region == input$region) %>%
      leaflet() %>%
      addTiles() %>%
      addProviderTiles(providers$Stamen.Toner) %>% 
      addMarkers(lng = ~long,
                 lat = ~lat,
                 popup = ~ Distillery,
                 clusterOptions = markerClusterOptions())
  })
}