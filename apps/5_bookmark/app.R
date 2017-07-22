# bookmarable
library(shinydashboard)
library(jpndistrict)
library(leaflet)

ui <- function(request){
  
  dashboardPage(
  dashboardHeader(title = "Shiny Dashboard"),
  dashboardSidebar(
    selectInput(inputId = "pref",
                label = "表示する都道府県を選択",
                selected = "北海道",
                multiple = FALSE,
                choices = jpndistrict::jpnprefs$prefecture),
    # selectInput(),
    bookmarkButton()
  ),
  dashboardBody(
    leafletOutput("plot", height = 250)
  )
)
}

server <- function(input, output, session) {
  
  pref_data <- reactive( {jpndistrict::spdf_jpn_pref(admin_name = input$pref)})
  
  observe({ 
    updateSelectInput(session,
                      "city", "2. 表示店舗の市区町村を選択",
                      choices = c("すべて", sort(c(stores()$geo_1))),
                      selected = "すべて")
  })
  
  output$plot <- renderLeaflet({
    leaflet() %>% addTiles() %>% 
      addPolygons(data = pref_data(),
                  label = ~city_name_full)
  })
}

shinyApp(ui, server, enableBookmarking = "url")
