library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              value = 20,
              min = 1,
              max = 100,
              label = "値を選択"),
  
  plotOutput("hist"),
  verbatimTextOutput("stats")
  
)

server <- function(input, output) {
  
  # 共通のinputを利用している場合、reactive()によりモジュール化しておく
  # output$hist <- renderPlot({
  #   hist(rnorm(input$num))
  # })
  # 
  # output$stats <- renderPrint({
  #   summary(input$num)
  # })
  
  data <- reactive({input$num})
  
  output$hist <- renderPlot({
    hist(rnorm(data()))
  })
  
  output$stats <- renderPrint({
    summary(data())
  })
}

shinyApp(ui = ui, server = server)
