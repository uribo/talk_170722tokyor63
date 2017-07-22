library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Shiny Dashboard"),
  dashboardSidebar(
    sliderInput("num", "値を選択", 1, 100, 20)
  ),
  dashboardBody(
 plotOutput("plot", height = 250)
  )
)

server <- function(input, output) {

  output$plot <- renderPlot({
    hist(rnorm(input$num))
  })
}

shinyApp(ui, server)
