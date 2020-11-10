library(shiny)
library(leaflet)
library(ggplot2)

#Application Title
navbarPage(title = span( "Opioids and HIV", style = "background-color: #AAA1C8"),

           #Introduction to Our Project
           navbarMenu("Introduction and Contributors",
                      tabPanel("The Opioid Epidemic and HIV",
                               p("Due to the overprescription of opioid medications by doctors beginning in the 1990s, rates of opioid abuse and overdose increased over the subsequent decades. Many people originally prescribed opioid painkillers eventually turned to heroin and synthetic opioids, which are generally cheaper than prescriptions. With the use of intravaneous drugs comes the risk of bloodborne diseases, like HIV. Our project seeks to describe the correlation between opioid overprescription, opioid abuse, and rates of HIV infection.")),
                      tabPanel("Sources",
                               p("Data was taken from the American amfAR, the Foundation for AIDS Research, and the Centers for Disease Control and Prevention.")),
                      tabPanel("About the Creators",
                               p("This web application was created by Tiffani Thomason, a tired Neuroscience and Philosophy major, and Gabrielle Jones, an equally tired Biology major, both at Washington and Lee University. Please feel free to send any suggestions for the site to jonesg22@mail.wlu.edu!"))
                      ),
           
           
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
                    mainPanel(plotOutput("OverdoseAge"))),
           tabPanel("HIV Age Groups", 
                    mainPanel())
          ),
          #Scatter Plots
          navbarMenu("Scatter Plots",
                     tabPanel("Needle Exchange Programs vs HIV",
                              mainPanel(plotOutput("nep_vs_hiv"),
                                        p("This graph shows the number of new HIV cases per 100,000 residents in each state versus the number of needle exchange programs in each state. Each point on the graph represent a single state or US territory, color-coded by region for clarity."))),
                     tabPanel("Opioid Prescription Rate vs Overdose Rate", 
                              mainPanel(plotOutput("prescription_vs_overdose"),
                                        p("This graph shows the total number of opioid cases per 100 residents in each state versus the prescription rate per 100 residents in each state. Each point on the graph represents a single state, color-coded by region for clarity."))),
                     tabPanel("Needle Exchange Programs vs Heroin Mortality",
                              mainPanel(plotOutput("nep_vs_heroin"),
                                        p("This graph shows the total number of heroin overdoses in each state versus the total number of needle exchange programs in each state. Each point represents a single state, color-coded by region for clarity.")))
          )
)
