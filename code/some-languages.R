library(tidyverse)

# https://www.kaggle.com/datasets/muhammadkhalid/most-popular-programming-languages-since-2004?resource=download
df_languages <- read_csv("data/kaggle-popular-languages-2004-2022.csv")

df_languages <- df_languages |> 
  rename(date = Date) |> 
  mutate(
    date = str_c("01", date, sep = " "),
    date = as.Date(date, format = "%d %B %Y")
  )



df_languages |> 
  select(date, `C/C++`, `C#`, Rust) |> 
  pivot_longer(-date, names_to = "language") |> 
  ggplot() + 
  geom_line(aes(x = date, y = value, col = language), linewidth = 1) + 
  labs(x = "", y = "Percentage of use")

df_languages |> 
  select(date, R) |> 
  pivot_longer(-date, names_to = "language") |> 
  ggplot() + 
  geom_line(aes(x = date, y = value, col = language), linewidth = 1) + 
  labs(x = "", y = "Percentage of use")
