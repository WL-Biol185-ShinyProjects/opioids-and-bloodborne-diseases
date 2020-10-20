library(shiny)
library(leaflet)

function(input, output) {
 
 output$worldMap <- renderLeaflet({
   
   btn <- input$newButton
   
   
   leaflet() %>%
     setView(lng = -95.7129, lat = 37.0902, zoom = 3.5) %>%
     addTiles()
   
 })
  
 observe({
   btn <- input$newButton
   
   leafletProxy("worldMap") %>%
     setView(lng = -95.7219, lat = 37.0902, zoom = 3.5)
   
 })
}
