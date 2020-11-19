library(shiny) 
library(leaflet)
library(ggplot2)

Overdoseage <- readxl::read_excel("Overdoseage.xlsx")


#Application Title
navbarPage(title = span( "Opioids and HIV", style = "background-color: #AAA1C8"),
                      
                      #Introduction and Sources
                                 navbarMenu("Introduction and Contributors", tabPanel("Opioids and HIV",
                                          strong("Due to the overprescription of opioid medications by doctors beginning in the 1990s, rates of opioid abuse and overdose increased over the subsequent decades. Many people originally prescribed opioid painkillers eventually turned to heroin and synthetic opioids, which are generally cheaper than prescriptions. With the use of intravaneous drugs comes the risk of bloodborne diseases, like HIV. Our project seeks to describe the correlation between opioid overprescription, opioid abuse, and rates of HIV infection."),
                                          br(),
                                          br(),
                                          strong("Data was taken from amfAR, the Foundation for AIDS Research, and the Centers for Disease Control and Prevention. Links:"),
                                          br(),
                                          br(),
                                          strong("https://opioid.amfar.org/indicator/num_SSPs"),
                                          br(),
                                          br(),
                                          strong("https://www.cdc.gov/drugoverdose/maps/rxrate-maps.html"),
                                          br(),
                                          br(),
                                          strong("https://www.cdc.gov/mmwr/volumes/69/wr/mm6911a4.htm#T1_down"),
                                          br(),
                                          br(),
                                          strong("This web application was created by Tiffani Thomason, a tired Neuroscience and Philosophy major, and Gabrielle Jones, an equally tired Biology major, both at Washington and Lee University. Please feel free to send any suggestions for the site to jonesg22@mail.wlu.edu!")
                      )),
                      
           #Maps - needs to have multiple tabs
          navbarMenu("Maps",
            tabPanel("Opioid Mortality by State",
                    mainPanel(leafletOutput("opioidMortalityMap"),
                              p("A map of opioid mortality in the United States. Darker purple indicates a greater number of fatalities, while a grey state is one for which data could not be found."))
                    ),
            tabPanel("Needle Exchange Programs by State", 
                     mainPanel(leafletOutput("nepMap"),
                               p("A map of needle exchange programs in the United States. Darker green indicates a greater number of NEPs, while grey indicates that no data could be found for that state."))
                     ),                   
            tabPanel("Opioid Prescription Rate by State ", 
                     mainPanel(leafletOutput("prescripMap"),
                               p("A map of opioid prescriptions per 100 residents in each state. Darker red indicates a greater number of prescriptions per resident, while grey indicates that no data could be found for that state.")))
          ),
          #Piecharts
          navbarMenu("Pie Charts",
                     tabPanel("Opioid Overdose Age Groups",
                              mainPanel(fluidPage(
                                
                                # Copy the line below to make a select box
                                selectInput("selectOpioidOverdosePie", label = h3("Select chart"),
                                            choices = colnames(Overdoseage)[2:9],
                                            selected = 1),
                                
                                hr(),
                                fluidRow(column(width=12, plotOutput("opioidOverdosePie")))
                                
                              ))),
                     tabPanel("HIV Age Groups",
                              mainPanel(fluidPage(plotOutput("hivAgePie")), plotOutput("hivAgePie2"))
          )),
        
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
