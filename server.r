library(shiny)
library(leaflet)
library(tidyverse)

nep_vs_hiv_table <- read.table("num-needle-exchange-programs.txt", header = TRUE, sep = ",")

function(input, output) {
 
 output$worldMap <- renderLeaflet({
   
   leaflet() %>%
     setView(lng = -95.7129, lat = 37.0902, zoom = 3.5) %>%
     addTiles()
   
 })
  
 observe({
   
   leafletProxy("worldMap") %>%
     setView(lng = -95.7219, lat = 37.0902, zoom = 3.5)
   
 })
 
 output$nep_vs_hiv <- renderPlot({
    
    ggplot(nep_vs_hiv_table, 
           aes(Number.of.Needle.Exchange.Programs, New.HIV.Cases.per.100000.People, color = Region)) + geom_point()
 
    })
 
 output$prescription_vs_overdose <- renderPlot({
    
    ggplot()
    
 })
}
