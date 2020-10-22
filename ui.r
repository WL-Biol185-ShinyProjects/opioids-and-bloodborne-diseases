library(shiny)
library(leaflet)

#Application Title
navbarPage("Opioids and HIV",

           #Maps - needs to have multiple tabs
          navbarMenu("Maps",
            tabPanel("Opioid Mortality by State",
                    mainPanel(leafletOutput("worldMap"))
                    )
)
)