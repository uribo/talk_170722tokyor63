library(shiny)
library(shinydashboard)
library(jpndistrict)
library(leaflet)
library(dplyr)
data("jpnprefs")

prefecture_selecterUI <- function(id, label = "1. 表示する都道府県を選択") {
  ns <- NS(id)
  
  tagList(
    selectInput(ns("pref"), "1. 表示する都道府県を選択",
                choices = 
                  list(
                    "北海道・東北" = jpnprefs %>% filter(region %in% c("北海道", "東北")) %>% use_series(prefecture),
                    "関東"   = jpnprefs %>% filter(region == "関東") %>% use_series(prefecture),
                    "中部"   = jpnprefs %>% filter(region == "中部") %>% use_series(prefecture),
                    "近畿"   = jpnprefs %>% filter(region == "近畿") %>% use_series(prefecture),
                    "中国"   = jpnprefs %>% filter(region == "中国") %>% use_series(prefecture),
                    "四国"   = jpnprefs %>% filter(region == "四国") %>% use_series(prefecture),
                    "九州・沖縄"   = jpnprefs %>% filter(region %in% c("九州", "沖縄")) %>% use_series(prefecture)
                  ),
                selected = "北海道")
  )
}

select.data <- function(input, output, session) {
  
  pref_data <- reactive( {jpndistrict::spdf_jpn_pref(admin_name = input$pref)})
  
  return(pref_data)
}
