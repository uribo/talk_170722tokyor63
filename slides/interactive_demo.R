# isolate -----------------------------------------------------------------
# observeEvent ------------------------------------------------------------
# library(shiny)
# ui <- fluidPage(
#   actionButton("btn", label = "クリック"),
#   sliderInput(inputId = "num",
#               value = 20,
#               min = 1,
#               max = 100,
#               label = "値を選択"),
#   textInput("title", label = "タイトルを入力"),
# 
#   plotOutput("hist"),
#   verbatimTextOutput("stats")
# 
# )
# 
# server <- function(input, output) {
#   
#   observeEvent(input$btn, {
#     print("hi!")
#   })
#   
#   data <- reactive({input$num})
# 
#   output$hist <- renderPlot({
#     hist(rnorm(data()),
#          main = input$title)
#   })
#   
#   output$stats <- renderPrint({
#     summary(data())
#   })
# }
# 
# shinyApp(ui = ui, server = server)

# minimum -----------------------------------------------------------------
# library(shiny)
# html.body <- tags$body(
#   # h1("title"),
#   tags$h1("title"),
#   tags$p("hello,", 
#          style = "font-family:impact",
#          tags$strong(tags$a(href = "https://www.rstudio.com/products/shiny-2/", "shiny!"))),
#   tags$br(),
#   tags$img(src = "http://hexb.in/vector/shiny.svg", width = 200)
# )
# 
# ui <- fluidPage(
#   # h1("title")
#   html.body
# )
# 
# server <- function(input, output) {
# 
# }
# shinyApp(ui = ui, server = server)


# bookmarking ------------------------------------------------------------
library(shiny)
# request
ui <- function(request) {
  fluidPage(
    textInput("txt", "Text"),
    checkboxInput("chk", "Checkbox"),
    bookmarkButton()
    
  )
}
server <- function(input, output, session) {
  enableBookmarking("url")
}
# server (state saved on server, always short url, no limit to data, no limit to data, can store uploaded files, requires shiny server)
# ... 状態をサーバに残しておく
# url (encoded... no state on server, urls may be long, url length limits data, can't store uploaded files, any hosting platform)
# urlで再現
shinyApp(ui = ui, server = server, enableBookmarking = "url")

