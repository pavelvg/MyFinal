shinyUI(fluidPage(tags$img(src = "wblogo.png",height=128,width=128,alt="Image"),
    titlePanel(h3("CO2 Emission Investigation - World Bank Data")),
    navlistPanel(
      tabPanel("Introduction",h3("Who are the largest absolute polluters?"),hr(),h3("Who are the largest per capita polluters?"),hr(),
               h3("Corelation between CO2 emissions and other indicators?"),hr(),
               h3("Conclusions"),hr()
               ),
      tabPanel("Methodology",
               h3("Download World Bank data using API and python functions"),hr(),
               h3("Process data and load to a MySql database"),hr(),
               h3("Download data from MySql to R for more processing anf graphing"),hr(),
               h3("Present data in R Shiny"),hr(),
               tags$img(src = "Picture1.png",height=360,width=600,alt="WHatttt!")
               ),
      tabPanel("Explore Data",
               tabPanel("Scatter Plots",
                        selectInput("Indicator","Indicator Select",choices=names(na.omit(sd[,-1]))),
                        #selectInput("Indicator_y","Indic_y",choices=names(na.omit(sd[,-1]))),
                        hr(),
                        plotOutput("bar"),hr()
               )),
      tabPanel("Relationships",
               tabPanel("Scatter Plots",
                        selectInput("Indicator_x","Indic-X",choices=names(na.omit(sd[,-1]))),hr(),
                        selectInput("Indicator_y","Indic_y",choices=names(na.omit(sd[,-1]))),
                        hr(),
                        plotOutput("map")
                        
               )),#               ),
      
      tabPanel("Conclusion",
               h4("Worlds largest polluters are the highly industrialized and high population countries"),hr(),
               h4("Worlds largest per capita polluters are countries rich in fossil fuel resources"),hr(),
               h4("GDP/CO2PC is not a good inidcator of energy efficinecy but it appears to be a good indicator of use of human labor as energy"),hr(),
               h4("Correlations:"),
               p("Unexpected positive correlation between CO2PC and Life Expectancy"),
               p("Counties with large urban populations have higher CO2 per capita emissions"),
               p("Countries with higher CO2 per capita emissions tend to have higher GPD"),
               p("Extensive use of renewable energy has a positive impact on reduction of CO2 emissions per capita"),
               hr()
               
)          
      
      ),
      mainPanel = (
        tabsetPanel(
          tabPanel("Introduction"),
          tabPanel("Scatter Plots"
#                    selectInput("Indicator_x","Indic-X",choices=names(na.omit(sd[,-1]))),
#                    selectInput("Indicator_y","Indic_y",choices=names(na.omit(sd[,-1]))),
#                    hr(),
#
#                    plotOutput("map")
                   
                   ),
          tabPanel("Box Plots"),
          #tabPanel("Maps"),
          tabPanel("Conclusion")
                   
        )
      )
      #mainPanel = (textOutput("map"))
    )
      
)#)