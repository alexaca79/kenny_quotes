library(tidyverse)
library(jsonlite)
library(purrr)



 list.of.json <- list.files(path = "D:/NoEsri Slack export May 14 2016 - May 8 2019", pattern = "*.json", all.files = FALSE,
                            full.names = FALSE, recursive = TRUE,
                            ignore.case = FALSE, include.dirs = TRUE, no.. = FALSE)

 
 
 path <- "D:/NoEsri Slack export May 14 2016 - May 8 2019"

 data <- list.of.json %>%
              map_df(~fromJSON(file.path(path, .), flatten = TRUE))
                     
                     
data <-  data %>% filter(user == "U9APJ3XKN" )


data[data==""]<-NA

Kenny_quotes<- data[data$text != "",]



Kenny_quotes <- sort(Kenny_quotes$text)



write.csv(Kenny_quotes, "quotes_1.csv",row.names = FALSE)
