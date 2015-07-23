
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Variable Relatioship (mtcars)"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "Variable:",
                  c("# cylinders" = "cyl",
                    "Displacement" = "disp",
                    "Gross horsepower" = "hp",
                    "Rear axle ratio" = "drat",
                    "Weight" = "wt",
                    "1/4 mile time" = "qsec",
                    "V/S" = "vs",
                    "Transmission" = "am",
                    "# gears" = "gear",
                    "# carburetors" = "carb"
                  ))
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
        tabPanel('Graphics',
          h2('Boxplot'),
          plotOutput("my_boxplot"),
          h2('Linear Model'),
          plotOutput("my_regression")
        ),
        tabPanel('Data',
                 h2('Linear Model Info'),
                 verbatimTextOutput("my_fit")
        )
      )
    )  
  )
)
)
