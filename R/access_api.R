
library(plumber)
library(httr)
library(jsonlite)

p_url <- "https://beta.rstudioconnect.com/content/c4613884-55d4-41ff-a1f7-4495d4e44b58/countries?in_continent=Asia&in_lifeExpGT=China&in_popGT=50000"

URLencode(p_url)


data <- httr::GET(url = URLencode(p_url))

jdata <- jsonlite::fromJSON(txt = URLencode(p_url))
data$status_code
data$url

plumber::serializer_json(data)

df <- jsonlite::unbox(data.frame(data))





gapminder %>%
  filter(
    year == 2007,
    continent == "Europe",
    lifeExp > 80,
    pop > 10000
  )
