install.packages("tidyverse")
library(tidyverse)
library(tidyr)
library(stringr)


install.packages("janitor")
library(janitor)

# we are using starwards dataset to understand the code

view(starwars)


data<- view(starwars)
# to view top & bottom variable use headand tail function


head(data, 10)
tail(data, 20)

#piping functions %>%

#count the variables in the given data set

data%>%count(species, sort = TRUE)
data %>%count(homeworld, sort = TRUE)

#filtering

data_filter <-data%>% filter (homeworld=="Tatooine", hair_color=="blond", sex=="male")

#select function

#data set with more filters
data_one <- data%>% select(name, height, mass, gender, homeworld, species, sex)%>% 
  filter(species=="Human")%>%
  arrange(gender)%>%
  arrange(desc(height))

#slice_max function to find highest numerical value

data_one %>% slice_max(height, n =10)

data_one %>% slice_min(height, n=8)

# Mutate function to add a column within the data set

data <- data%>%
  filter(!is.na(height))%>%
  filter(!is.na(mass))%>%
 mutate(avg_height = mean(height), total_mass = sum(mass))

