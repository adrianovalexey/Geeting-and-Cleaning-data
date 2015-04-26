
###
##### QUESTION 1 
###
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 

# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 

# and load the data into R. The code book, describing the variable names is here: 

# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 

# How many properties are worth $1,000,000 or more?

setwd("/Users/avant/mailDisk/Coursera/Geeting\ and\ Cleaning\ data/Week1/Quiz1")


fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

destFile <- "./question1.csv"

download.file(fileUrl, destFile, method = "curl")

q1Data <- read.table(destFile, sep = ",", header = TRUE)

head(q1Data)

count <- sum(!is.na(q1Data$VAL[q1Data$VAL==24])) ##count properties are worth more then 1000000$ 24 is code for >$1mil properties

## answer count = 53

########
###


###
##### QUESTION 2 
###

# Use the data you loaded from Question 1. Consider the variable FES in the code book. Which of the "tidy data" principles does this variable violate?
# Tidy data has one variable per column.
# Tidy data has one observation per row.
# Tidy data has variable values that are internally consistent.

## Correct answer is <- Each tidy data table contains information about only one type of observation.


########
###


###
##### QUESTION 3 
###

# Download the Excel spreadsheet on Natural Gas Aquisition Program here: 

# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 

# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
#  dat 
# What is the value of:
#  sum(dat$Zip*dat$Ext,na.rm=T) 
# (original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)

# 338924
# 154339
# 36534720
# 33544718

#use xlsx library
library(xlsx)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

destFile <- "./q3.xlsx"

download.file(fileUrl, destFile, method = "curl")

#read specific rows and column

colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx(destFile, spreadsheet = 1, colIndex = colIndex, rowIndex = rowIndex)


valueOf <-sum(dat$Zip*dat$Ext,na.rm=T) 

#value of  sum(dat$Zip*dat$Ext,na.rm=T)  is  36534720




########
###

###
##### QUESTION 4 
###

# Read the XML data on Baltimore restaurants from here: 

# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 

# How many restaurants have zipcode 21231?
# 156
# 127
# 130
# 28

library(XML)

fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

doc <- xmlTree(fileUrl, useInternal = TRUE)

rootNode <- xmlRoot(doc)

count <- sum(xpathSApply(rootNode, "//zipcode", xmlValue)==21231)

# count = 127

########
###


###
##### QUESTION 5 
###


########
###


