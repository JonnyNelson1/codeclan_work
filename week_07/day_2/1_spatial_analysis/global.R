library(shiny)
library(tidyverse)
library(leaflet)

whiskey %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(lat = ~lat, lng = ~long, popup = ~Distillery)