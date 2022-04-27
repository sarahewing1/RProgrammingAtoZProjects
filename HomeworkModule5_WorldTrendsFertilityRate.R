combineddata<- read.csv("P2-Section5-Homework-Data.csv", stringsAsFactors = TRUE)
head(combineddata)
tail(combineddata)
str(combineddata)
data1960 <- combineddata[combineddata$Year == 1960,]
data2013 <- combineddata[combineddata$Year == 2013,]
head(data1960)
tail(data2013)
str(data1960)
summary(data2013)

#check number rows
nrow(data1960)
nrow(data2013)
#convert Year from int to factor
data1960$Year
temp1960 <-factor(data1960$Year)
levels(temp1960)
#create data frame with extra vector data
df1960 <- data.frame(Code=Country_Code, Life.Expectancy=Life_Expectancy_At_Birth_1960, stringsAsFactors=TRUE)
summary(df1960)
df2013 <- data.frame(Code=Country_Code, Life.Expectancy=Life_Expectancy_At_Birth_2013, stringsAsFactors = TRUE)
summary(df2013)
#created merged data to add extra column
merged1960 <- merge(data1960, df1960, by.x= "Country.Code", by.y = "Code")
head(merged1960)
str(merged1960)
summary(merged1960)

 merged2013 <- merge(data2013, df2013, by.x = "Country.Code", by.y = "Code")
head(merged2013)


qplot(data=merged1960, x= Fertility.Rate, y= Life.Expectancy, color=Region, size=I(5), shape=I(19), alpha=I(0.6), main="1960 Life Expectancy vs. Fertility Rate")
qplot(data=merged2013, x= Fertility.Rate, y= Life.Expectancy, color=Region, size=I(5), shape=I(19), alpha=I(0.6), main="2013 Life Expectancy vs. Fertility Rate")
