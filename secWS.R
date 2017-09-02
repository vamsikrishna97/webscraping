library(stringr)
library(xml2)
library(rvest)
library(dplyr)
library(lubridate)

#1 st problem
url <- "https://www.sec.gov/foia/iareports/inva-archive.htm"
pg <- read_html(url)
links<- html_attr(html_nodes(pg, "a"), "href")

pg %>% html_nodes("a") %>% html_text() 

links <-pg %>% html_nodes("a") %>% html_attr("href") 

sec <-as.data.frame(links) %>% filter(grepl(".zip",links))
 
sec$type <- ifelse(grepl("exempt",sec$links),"Exempt","Non-Exempt")

 x<- str_match(sec$links, "/foia/iareports/ia(.*?).zip" )
 sec$date <- x[,2]
 x1 <- str_match( sec[sec$type=="Exempt","date"],"(.*?)-exempt")
 sec[sec$type=="Exempt","date"] <- x1[,2]
 
 
 #2nd problem
 
 
 