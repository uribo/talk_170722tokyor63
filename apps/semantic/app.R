library(shiny)
#devtools::install_github("Appsilon/shiny.semantic")
library(shiny.semantic)

ui <- function() {
  shinyUI(
    semanticPage(
      title = "My page",
      suppressDependencies("bootstrap"),
      div(class = "ui button", uiicon("user"),  "Icon button")
    )
  )
}

server <- shinyServer(function(input, output) {
})

shinyApp(ui = ui(), server = server)
