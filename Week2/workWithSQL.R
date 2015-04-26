
## Install MySQL R package if not installed
# install.packages("RMySQL")

library("RMySQL")

# connetcing and listing to MySQL data srver with example data

ucscDb <-dbConnect(MySQL(), user = "genome",
	host="genome-mysql.cse.ucsc.edu")


## send query to database where "show databeses" is MySQL command
result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb);


## connect to some specific DB from previos list

hg19 <-dbConnect(MySQL(), user="genome", db="hg19",
	host="genome-mysql.cse.ucsc.edu")

# show all Tables in this DB
allTables <-dbListTables(hg19)


length(allTables)

# If you look at the some scope of the tables, you get this tables here
allTables[2:11]


#If we know specific tabel interesting for us

dbListFields(hg19, "affyU133Plus2")

#get query to specific tables\

dbGetQuery(hg19, "select count(*) from affyU133Plus2")


# read from the tables
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)


# select a specific subset

query <-dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")

#fetch subset data and quantile
affyMis <-fetch(query); quantile(affyMis$misMatches)

# close connect for query with dbClearResult after make fetch data

affyMisSmall <-fetch(query, n=10); dbClearResult(query);

dim(affyMisSmall)

# close connet for DB
dbDisconnect(hg19)
