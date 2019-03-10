library(tidyverse)
library(leaflet)
library(tigris)
library(tidycensus)
library(RColorBrewer)
library(sf)

sovi <- st_read("SOVI.shp")


pal <- colorQuantile("Reds", domain = sovi$RANK, n=3)
pal

map <- leaflet() %>%
  addProviderTiles(provider = "CartoDB.Positron") %>%
  addPolygons(
    data=sovi,
    popup = ~ str_extract(RANK, "^([^,]*)"),
    color = "#444444",
    weight = 1,
    smoothFactor = 0,
    fillOpacity = 0.7,
    group="CA"
  )

map