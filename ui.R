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
        tabPanel('Info',
                 h2('Use'),
                 p("The application will show the box plot and the graph of the linear model of the selected variable and the 'miles per gallon' variable (mpg)"),
                 tags$ul(
                   tags$li("Select the variable to which you want to predict consumption."), 
                   tags$li("Select whether you want the outliners are included in the output or not."), 
                   tags$li("Explore the graphics relating to both variables."),
                   tags$li("Enter details in all the variables related to the linear model.")
                 )),
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
