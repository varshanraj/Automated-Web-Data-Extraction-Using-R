if (!require("rvest")) install.packages("rvest")
if (!require("dplyr")) install.packages("dplyr")

library(rvest)
library(dplyr)

# Set the URL for the webpage (using Wikipedia's main page)
url <- "https://en.wikipedia.org/wiki/Main_Page"

# Read the HTML content from the page
web_page <- read_html(url)

# The specific CSS selector might change based on website updates
news_headlines <- web_page %>%
  html_elements("#content b a") %>%  # CSS selector for "In the news" headlines
  html_text()

# Print the extracted headlines
print(news_headlines)

# Optional: Save the headlines to a CSV file
write.csv(news_headlines, "news_headlines.csv", row.names = FALSE)
