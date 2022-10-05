library(here)
library(tidyverse)
US2020 <-read_csv(here("covid-19-data", "us-counties-2020.csv"))
US2021 <-read_csv(here("covid-19-data", "us-counties-2021.csv"))
US2022 <-read_csv(here("covid-19-data", "us-counties-2022.csv"))
USRECENT <-read_csv(here("covid-19-data", "us-counties-recent.csv"))
USLIVE <-read_csv(here("covid-19-data", "live", "us-counties.csv"))
COMBINE <- rbind(US2020, US2021, US2022, USRECENT, USLIVE)

PACounties <- filter(COMBINE, state == "Pennsylvania")
view(PACounties)
Lehigh <- filter(PACounties, county== "Lehigh")

LehighCases <- distinct(Lehigh, date, .keep_all = TRUE)

n <- length(LehighCases$date)
LehighCases$increase_cases <- 0

for (i in 2:n)
{
  LehighCases$increase_cases[i] <- (LehighCases$cases[i]-LehighCases$cases[i-1])
}  
view(LehighCases)

p <- ggplot(data = LehighCases)

p + geom_line(color="blue", mapping =aes(x=date,
                                         y=increase_cases),
                      group=1)+
  labs(x = "Date", y = "Increased COVID Cases",
       title = "COVID-19 Cases In Lehigh, PA")
