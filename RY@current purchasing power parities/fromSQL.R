library(DBI)
library(RMySQL)
library(dplyr)
install.packages(c('RSQLite','dplyr'))

RealGDP <- dbConnect(RMySQL::MySQL(),
                dbname = "RealGDP",
                host = "127.0.0.1",
                port = 3306,
                user = "root",
                password = "Cuiying1114")

# list tables in the database
dbListTables(RealGDP)

# read a table into a data frame
AU <- dbReadTable(RealGDP, "AU")
str(AU)

dbGetQuery(RealGDP, "select share_of_imports from AU")
imports <- dbGetQuery(RealGDP, "SELECT CAST(share_of_imports AS DECIMAL(10,2)) AS share_of_imports FROM AU")
