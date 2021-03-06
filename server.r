library(shiny)
library(leaflet)
library(tidyverse)
library(rgdal)
library(readr)

nep_vs_hiv_table <- read.table("num-needle-exchange-programs.txt", header = TRUE, sep = ",")

prescrip_vs_overdose_table <- read.table("prescription-vs-overdose.txt", header = TRUE)

nep_vs_heroin_table <- read.table("nep-vs-heroin-mortality.txt", header = TRUE)

statesGeo <- readOGR("states.geo.json")

Overdoseage <- readxl::read_excel("Overdoseage.xlsx")

HIVAGE <- read_csv("HIVAGE.csv")

function(input, output) {
  
  output$opioidOverdosePie <- renderPlot({
    
    ggplot(Overdoseage, aes(x = "", fill = Age)) +
      geom_bar(aes_string(y = input$selectOpioidOverdosePie), stat = "identity", width = 1, color = "white") +
      coord_polar("y", start = 0) +
      
      theme_void()
    
  })
  
 output$prescripMap <- renderLeaflet({
   
   prescrip_vs_overdose_table$formattedState <- 
     gsub(".", " ", prescrip_vs_overdose_table$State, fixed = TRUE)
   
   statesGeo@data <- left_join(statesGeo@data, 
                               prescrip_vs_overdose_table,
                               by = c("NAME" = "formattedState")
   )
   
   pal <- colorBin("Reds", domain = statesGeo@data$Prescription.Rate.Per.100.People)
   
   
   leaflet(statesGeo) %>%
     setView(lng = -95.7129, lat = 37.0902, zoom = 3.5) %>%
     addPolygons(
       stroke = TRUE, 
       smoothFactor     = 0.3,
       fillOpacity      = 0.7,
       opacity          = 1,
       dashArray        = "3",
       weight           = 2,
       color            = "black",
       fillColor = ~pal(Prescription.Rate.Per.100.People)
     ) %>%
     
     addLegend("bottomright",
               pal          = pal, 
               values       = ~(Prescription.Rate.Per.100.People), 
               opacity      = 0.8, 
               title        = "Prescriptions per 100 Residents")
   
   
 })
  
 output$nepMap <- renderLeaflet({
   statesGeo@data <- left_join(statesGeo@data, 
                               nep_vs_hiv_table,
                               by = c("NAME" = "State")
   )
   
   pal <- colorBin("Greens", domain = statesGeo@data$Number.of.Needle.Exchange.Programs)
   
   
   leaflet(statesGeo) %>%
     setView(lng = -95.7129, lat = 37.0902, zoom = 3.5) %>%
     addPolygons(
       stroke = TRUE, 
       smoothFactor     = 0.3,
       fillOpacity      = 0.7,
       opacity          = 1,
       dashArray        = "3",
       weight           = 2,
       color            = "black",
       fillColor = ~pal(Number.of.Needle.Exchange.Programs)
     ) %>%
     
     addLegend("bottomright",
               pal          = pal, 
               values       = ~(Number.of.Needle.Exchange.Programs), 
               opacity      = 0.8, 
               title        = "Needle Exchange Programs in State (2018)")
   
 })
 
 output$opioidMortalityMap <- renderLeaflet({
   
   prescrip_vs_overdose_table$formattedState <- 
     gsub(".", " ", prescrip_vs_overdose_table$State, fixed = TRUE)
   
   statesGeo@data <- left_join(statesGeo@data, 
                               prescrip_vs_overdose_table,
                               by = c("NAME" = "formattedState")
                               )
   
   pal <- colorBin("Purples", domain = statesGeo@data$Opioid.Overdoses)
   
   
   leaflet(statesGeo) %>%
     setView(lng = -95.7129, lat = 37.0902, zoom = 3.5) %>%
     addPolygons(
       stroke = TRUE, 
       smoothFactor     = 0.3,
       fillOpacity      = 0.7,
       opacity          = 1,
       dashArray        = "3",
       weight           = 2,
       color            = "black",
       fillColor = ~pal(Opioid.Overdoses)
       ) %>%
     
     addLegend("bottomright",
               pal          = pal, 
               values       = ~(Opioid.Overdoses), 
               opacity      = 0.8, 
               title        = "Opioid Overdoses in State (2019)")
   
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
 
 output$hivAgePie <- renderPlot({
    ggplot(HIVAGE, aes(x = "" , y = Year_2017, fill = Age_Group)) +
       geom_bar(stat = "identity", width = 1, color = "white") +
       coord_polar("y", start = 0) +
       
       theme_void() +
       ggtitle("Distribution of HIV Diagnoses in 2017 by Age Group")
    
 })
 
 output$hivAgePie2 <- renderPlot({
    ggplot(HIVAGE, aes(x = "" , y = Year_2018, fill = Age_Group)) +
       geom_bar(stat = "identity", width = 1, color = "white") +
       coord_polar("y", start = 0) +
       
       theme_void() +
       ggtitle("Distribution of HIV Diagnoses in 2018 by Age Group")
    
 })
 
}