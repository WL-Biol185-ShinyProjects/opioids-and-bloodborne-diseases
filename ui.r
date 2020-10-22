library(shiny)
library(leaflet)

#Application Title
navbarPage("Opioids and HIV",

           #Maps - needs to 
          navbarMenu("Maps",
            tabPanel("Opiod Mortality by State",
                    mainPanel(leafletOutput("worldMap"))
                    )
)
)