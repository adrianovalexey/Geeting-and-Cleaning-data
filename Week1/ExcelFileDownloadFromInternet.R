
# use xlsx library
library(xlsx)
# download Excel file from internet

# set work directory
setwd("/Users/avant/mailDisk/Coursera/Geeting\ and\ Cleaning\ data/Week1")

# name our downloaded file
destFile <- "./cameras.xlsx"

# url variable
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"

# download file from url

download.file(fileUrl, destFile, method = "curl")
dateDownloaded <- date()


# read downloaded data

#use read xlsx function
cameraData <- read.xlsx(destFile, sheetIndex=1, header = TRUE)  

head(cameraData)


#read specific columns and rows

colIndex <- 2:3
rowIndex <-1:4

cameraDataSubset <- read.xlsx(destFile, sheetIndex =1, colIndex=colIndex, rowIndex=rowIndex)