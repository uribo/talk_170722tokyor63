library(shiny)
shinyUI(fluidPage(
  sliderInput(inputId = "num",
              value = 20,
              min = 1,
              max = 100,
              label = "値を選択"),
  plotOutput("hist")
))
