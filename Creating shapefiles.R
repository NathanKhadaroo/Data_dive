
# Loading packages: -------------------------------------------------------

library(tidyverse)
library(sf)
library(ggspatial)
library(tmap)


# Reading in data: --------------------------------------------------------

# Shapefile for Chorlton ward:

chorlton <- st_read(here::here(
  "Data",
  "England_wa_ru_classn_2011",
  "england_wa_ru_classn_2011.shp")) %>%
  filter(name == "Chorlton") %>%
  st_transform(4326) 

# Scoot loop info:

loop_start <- read_csv(here::here(
  "Data",
  "Loops on 25.02.2021.csv")) %>%
  janitor::clean_names() %>%
  drop_na(start_lat, start_long) %>%
  st_as_sf(
    coords = c("start_long", "start_lat"),
    crs = 4326
  )

loop_end <- read_csv(here::here(
  "Data",
  "Loops on 25.02.2021.csv")) %>%
  janitor::clean_names() %>%
  drop_na(start_lat, start_long) %>%
  st_as_sf(
    coords = c("end_long", "end_lat"),
    crs = 4326
  )


# Creating shapefile for loop segments: -----------------------------------

# Combining the sf objects:

loops_full <- cbind(loop_start, loop_end)

# Combining start and end points into lines"

loops_as_sf <- st_sfc(mapply(function(a,b){st_cast(st_union(a,b),"LINESTRING")},
                       loops_full$geometry, loops_full$geometry.1,
                       SIMPLIFY=FALSE))

# Adding scn and description for each loop:

loops_as_sf <- sf:::cbind.sf(loops_full$scn,
                             loops_full$description,
                             loops_as_sf) %>%
  rename(scn = loops_full.scn,
         description = loops_full.description)

# Adding projection:

st_crs(loops_as_sf)= 4326

# Writing as a shapefile:

st_write(loops_as_sf,here::here("Data","scoot_linestring.shp"))



# Filtering Chorlton loops: -----------------------------------------------


ch_loops <- st_intersects(chorlton, loops_as_sf)

ch_loops <- loops_as_sf[unlist(ch_loops),]



# Plotting the loops to check it has worked: ------------------------------

tm_shape(shp = ch_loops)+
  tm_lines(lwd = 2)



tm_shape(chorlton,
         bbox = loops_as_sf)+
  tm_polygons(col = "red",
              alpha = 0.3)+
  tm_shape(loops_as_sf)+
  tm_lines(lwd = 2)
