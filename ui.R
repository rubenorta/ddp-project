library(shiny)

shinyUI(fluidPage(

  # Title
  titlePanel("Variable Relatioship (mtcars)"),

  # Sidebar
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
                  )),
      checkboxInput("outliers", "Show Outliers", FALSE)    
    ),

    # Show two plots and summary data
    mainPanel(
      tabsetPanel(type = "tabs", 
        tabPanel('Graphics',
          h2('Boxplot'),
          plotOutput("my_boxplot"),
          h2('Linear Model'),
          plotOutput("my_regression")
        ),
        tabPanel('Data',
                 h2('Linear Model Summary'),
                 verbatimTextOutput("my_fit")
        )
      )
    )  
  )
  ))
