library(shiny)
library(leaflet)
library(tidyverse)

nep_vs_hiv_table <- read.table("num-needle-exchange-programs.txt", header = TRUE, sep = ",")

prescrip_vs_overdose_table <- read.table("prescription-vs-overdose.txt", header = TRUE)

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
    
   ggplot(prescrip_vs_overdose_table, 
          aes(Prescription.Rate.Per.100.People, Opioid.Overdoses, color = Region)) + geom_point()
    
 })
 
 output$nep_vs_heroin <- renderPlot({
    
    ggplot(nep_vs_heroin_table, 
           aes(Number.NEP, Heroin.Overdoses, color = Region)) + geom_point()
    
 })


 output$OverdoseAge <- renderPlot({
   
    ggplot(Overdoseage, aes(x = "" , y = All2017, fill = Age)) +
       geom_bar(stat = "identity", width = 1, color = "white") +
       coord_polar("y", start = 0) +
       
       theme_void() +
       ggtitle("Distribution of All Opioid Mortalities in 2017 by Age Group")
   
})
}