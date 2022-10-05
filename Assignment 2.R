setwd("~/BIS 244/BIS-244-Fall-2022-mckennasean/covid-19-data")
#correct way to read csv for future reference
state <- read.csv(here("covid-19-data","us-states.csv")) 
state <- read.csv("us-states.csv")
View(state)
library(tidyverse)
state_PA <- filter(state, state=="Pennsylvania")
View(state_PA)
n <- length(state_PA$cases)
state_PA$incr_cases <- 1
state_PA$incr_deaths <- 1
for (i in 2:n) {
  state_PA$incr_cases[i] <- (state_PA$cases[i]-state_PA$case[i-1])
}
for (i in 2:n) {
  state_PA$incr_deaths[i] <- state_PA$deaths[i]-state_PA$deaths[i-1]
}
view(state_PA)
print(sd(state_PA$incr_cases))
