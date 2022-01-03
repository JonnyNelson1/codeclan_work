ui <- fluidPage(
  
  selectInput("region",
              "Region:",
              choice = unique(whiskey$Region)
              ),
  
  leafletOutput("whiskey_map")
  
)