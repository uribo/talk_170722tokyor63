FROM rocker/shiny:latest
Maintainer "Shinya Uryu" suika1127@gmail.com

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
  libprotobuf-dev protobuf-compiler libssl-dev libv8-3.14-dev \
  && install2.r remotes dplyr htmlwidgets purrr shinydashboard leaflet \
  && install2.r DBI dbplyr later \
  && installGithub.r Appsilon/shiny.semantic
