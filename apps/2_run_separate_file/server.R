
library(shiny)
shinyServer(function(input, output) {
  # uiでのsliderInputの値を用いる
  output$hist <- renderPlot({
    hist(rnorm(input$num))
  })
})
