
# Loading libraries: ------------------------------------------------------

library(tidyverse)
library(lubridate)
library(here)

# Create a chr vector of file names: --------------------------------------

myfiles = list.files(path=here("Data","scoot_data"),
                     pattern="*.csv",
                     full.names=TRUE)
myfiles


# Read in files, bind rows, and add column for file name: -----------------

df <- do.call("rbind", lapply(myfiles, function(x) {
  dat <- read.csv(x, header=TRUE)
  dat$fileName <- tools::file_path_sans_ext(basename(x))
  dat
}))


# Extract scn and read date as POSIXct: -----------------------------------

scoot_data <- myDB %>%
  janitor::clean_names() %>%
  mutate(date = lubridate::dmy_hms(date),
         scn = str_split(file_name, pattern = " "),
         scn = lapply(scn, `[`, 2),
         scn = unlist(scn)) %>% 
  select(-x,
         -file_name)


# Adding in loop info: ----------------------------------------------------

loop_info <- read_csv(here("Data","loop_info.csv")) %>%
  janitor::clean_names()

scoot_data <-  scoot_data %>%
  left_join(loop_info, by = 'scn')


# Saving as csv: ----------------------------------------------------------

scoot_data %>%
  write_csv(here("Data", "cleaned_scoot.csv"))

