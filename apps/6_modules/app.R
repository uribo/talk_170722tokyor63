# module
source("~/git/slides/talk_170722tokyor63/apps/6_modules/module.R")

ui <- function(request){
  
  dashboardPage(
    dashboardHeader(title = "Shiny Dashboard"),
    dashboardSidebar(
      prefecture_selecterUI("select_data", "1. 表示する都道府県を選択"),
      selectInput("city", 
                  "2. 市区町村を選択", 
                  choices = "すべて",
                  selected = "すべて",
                  multiple = TRUE)
    ),
    dashboardBody(
      leafletOutput("mymap", height = 250)
    )
  )
}

server <- function(input, output, session, server) {
  
  datafile <- callModule(select.data, "select_data")
  
  observe({ 
    updateSelectInput(session,
                      "city", "2. 市区町村を選択",
                      choices = c("すべて", sort(c(datafile()$city_name_full))),
                      selected = "すべて")
  })

  output$mymap <- leaflet::renderLeaflet({
    
    leaflet() %>%
      addTiles() %>% 
      addProviderTiles("CartoDB.Positron") %>% 
      addPolygons(data = datafile(), label = ~city_name_full)
  })
  
  observeEvent(
    input$city, {
      proxy <- leafletProxy("mymap", data = datafile())
      if (input$city != "すべて") {
        proxy %>% 
          addPolygons(data = datafile() %>% dplyr::filter(city_name_full %in% input$city))
      }
    }
  )
}

shinyApp(ui, server)
