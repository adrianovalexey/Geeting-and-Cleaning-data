# download file from internet

# set work directory
setwd("/Users/avant/mailDisk/Coursera/Geeting\ and\ Cleaning\ data/Week1")

# name our downloaded file
dest <- "./cameras.csv"

# url variable
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD&bom=true"

# download file from url

download.file(fileUrl, destfile = dest, method = "curl")
dateDownloaded <- date()


# read downloaded data

cameraData <- read.table(dest, sep = ",", header = TRUE)  ##may use function for csv files, when don't need using sep and header methods.  Just type read.csv(dest)

