
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

plumb_api("plumber", "04-mean-sum") %>% pr_run(port = 8000)



gapminder %>%
  filter(
    year == 2007,
    continent == "Europe",
    lifeExp > 80,
    pop > 10000
  )





response <- httr::GET("http://httpbin.org/get")
response

results <- httr::content(x = response)

something <- jsonlite::fromJSON(rawToChar(results))

jsonlite::fromJSON(response)

something_more <- jsonlite::flatten(as.data.frame(something))





# something else4 ---------------------------------------------------------

# this works
new_url <- "https://eu.httpbin.org/get?foo=123"

req <- curl::curl_fetch_memory(new_url)
str(req)
curl::parse_headers(req$headers)

tmp <- tempfile()
curl::curl_download(url = new_url, destfile = tmp)
data <- jsonlite::prettify(readLines(tmp))

results <- jsonlite::fromJSON(data)
results2 <- jsonlite::flatten(as.data.frame(results))
View(results2)


# Another thing -----------------------------------------------------------

req_2 <- httr::GET(url = new_url)
str(req_2)
content <- httr::content(x = req_2)

jsonlite::prettify(readLines(content))
results_another <- jsonlite::fromJSON(content)




