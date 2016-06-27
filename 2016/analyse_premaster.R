
library("stringr")
all <- list.files("~/Downloads/120-121 (2016 СО)/121/")
numbers <-  as.numeric(str_extract(all, "^[0-9]+"))
write.csv(numbers, file = "numbers.csv")


library("readxl")
library("dplyr")
library("reshape2")

df <- read_excel("premaster_16.xls")
df_nosum <- select(df, -sum)
df_melted <- melt(df_nosum, id.vars = c("program", "id"), variable.name = "problem")

glimpse(df_melted)
summary <- df_melted %>% group_by(problem) %>% summarise(mean_result = mean(value, na.rm = TRUE),
                                                         n_positive = sum(value > 0, na.rm = TRUE))
write.csv(summary, file = "summary_premaster_16.csv")
