library(shiny)
library(leaflet)

#Application Title
navbarPage("Opioids and HIV",

           #Maps - needs to have multiple tabs
          navbarMenu("Maps",
            tabPanel("Opioid Mortality by State",
                    mainPanel(leafletOutput("worldMap"))
                    ),
            tabPanel("Needle Exchange Programs by State", 
                     mainPanel()),                   
            tabPanel("Opioid Perscription Rate by State ", 
                     mainPanel())
          ),
          #Piecharts
          navbarMenu("Pie Charts",
           tabPanel("Opioid Overdose Age Groups",
                    mainPanel()),
           tabPanel("HIV Age Groups", 
                    mainPanel())
          ),
          #Scatter Plots
          navbarMenu("Scatter Plots",
                     tabPanel("Needle Exchange Programs vs HIV",
                              mainPanel()),
                     tabPanel("Opioid Prescription Rate vs Overdose Rate", 
                              mainPanel()),
                     tabPanel("Needle Exchange Programs vs Heroin Mortality",
                              mainPanel())
          )
)
