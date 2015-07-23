
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(datasets)

shinyServer(function(input, output) {
  
  my_data <- mtcars
  my_data$am <- factor(my_data$am, labels = c("Automatic", "Manual"))
  my_data$cyl<-as.factor(my_data$cyl); my_data$vs<-as.factor(my_data$vs)
  my_data$gear<-as.factor(my_data$gear); my_data$carb<-as.factor(my_data$carb)
  
  # First Plot
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })

  output$my_boxplot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = my_data,
            outline = input$outliers)
  })
  
  # Second Plot
  formulaTextPoint <- reactive({
    paste("mpg ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=my_data)
  })
  
  output$my_regression <- renderPlot({
    with(my_data, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })
    
  output$my_fit <- renderPrint({
    summary(fit())
  })
})
