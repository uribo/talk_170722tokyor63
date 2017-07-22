library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              value = 20,
              min = 1,
              max = 100,
              label = "値を選択"),
  plotOutput("hist")
)

server <- function(input, output) {
  # uiでのsliderInputの値を用いる
  output$hist <- renderPlot({
    hist(rnorm(input$num))
  })
}

shinyApp(ui = ui, server = server)
