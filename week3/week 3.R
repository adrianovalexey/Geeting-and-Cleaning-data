# week 3


# set work directory
setwd("/Users/avant/mailDisk/Coursera/Geeting\ and\ Cleaning\ data/Week3")

# 
# get subsetting

# create data frame with simple data

X <- data.frame("var1" = sample(1:5), "var2"=sample(6:10), "var3" = sample(11:15))

# access data

X$var2[c(1,3)] #получим столбец var2 с 1 и 3 значением

X[sample(1:5),] #перемешаем данные по строкам

X[,sample(1:3)] #перемешаем данные по столбцам

X[$var2>3 & X$var3 <10,] # выведем только удовлетворяющие условию И строки масива данных

X[$var2>3 | X$var3 <10,] # выведем только удовлетворяющие условию ИЛИ строки масива данных


# Сортировка

 sort(X$var1) #Сортирока по столбцу var1 по возрастанию

 sort(X$var1, decreasing = TRUE) #Сортирока по столбцу var1 по убыванию

 sort(X$var2, na.last = TRUE) #Сортировка таким образом, чтобы последние элементы в столбце var2 были NA



# Упорядочивание

X[order(X$var1),] #Упорядочим массив данных по первому столбцу


 X[order(X$var1, X$var3),] #Упорядочим по нескольким переменным. Сначала по первой, потом по второй. При этом приоритет у первой

# тоже самое можно сделать с помощью библиотеки plyr

library(plyr)
arrange(X,var1) #упорядочим по одной переменной
arrange(X, var3, var2) #упорядочим по двум переменным
arrange(X,desc(var1))  #упорядочим по убыванию


#Добавление данным в массив 

X$var4 <- rnorm(5)

#аналогично, но другим способом

Y <- cbind(X, rnorm(5))

# Summarizing data

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/restoraunts.csv", method = "curl")
restData <- read.csv("./data/restoraunts.csv")

head(restData, n=3) #посмотрим первые 3 строки

tail(restData, n = 3) #посмотрим последние 3 строки

summary(restData) #посмотрим описание, покажет количество упоминаний тех или иных объектов в массиве данных
str(restData) #посмотрим структуру в массиве данных


quantile(restData$councilDistrict, na.rm=TRUE) #Посмотрим разброс данных по столбцу councilDistrict


table(restData$zipCode, useNA = "ifany") #показать таблицу индексов где убет посчитано количество индексов, если есть значения NA, то они будут просуммированы в переменной ifany

table(restData$councilDistrict,restData$zipCode) #получим таблица где в строках будет councilDistrict, а столбцы zipCode. На пересечении количество ресторанов.

sum(is.na(restData$councilDistrict)) #Просуммируем количество NA

any(is.na(restData$councilDistrict)) #Посмотрим есть или нет NA в выбранном массиве

all(any(restData$councilDistrict)>0) #Проверим, все ли значения удовлетворяют условию

colSums(is.na(restData)) #вычислим сумму по столбцам. В данном случае проверим есть ли значения NA в столбцах

all(colSums(is.na(restData))==0)  # в принципе такая же проверка как предыдущая


table(restData$zipCode %in% c("21212")) #Посчитаем сколько индексов удовлетворяет условию "Входит" заданному %in%

table(restData$zipCode %in% c("21212", "21213")) #Посчитаем сколько индексов удовлетворяет условию "Входит" заданному %in%, при этом здесь 2 вектора и условие будет ИЛИ.

restData[restData$zipCode %in% c("21212", "21213"),] #здесь мы явно выводим какие именно данные удовлетворяют нашему условию заданному в предыдущей строке
