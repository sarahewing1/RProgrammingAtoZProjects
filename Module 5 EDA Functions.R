



# Set WD and read file from there
getwd()
rm(stats)
setwd("/Users/Sarah/Desktop/Super Data Science/R")
getwd()
stats <- read.csv("DemographicData.csv", stringsAsFactors = TRUE)

str(stats)
summary(stats)


# Using the $ sign
head(stats)
stats[3,3]
stats[3, "Birth.rate"]
stats$Internet.users
stats[,"Internet.users"]
stats$Internet.users[2]
levels(stats$Income.Group)


#Basic Operations with a Data Frame
stats[1:10,]
stats[c(4,100),]
stats[1,]
is.data.frame(stats[1,]) #no need for drop=F like when working with vectors
stats[,1]
is.data.frame(stats[,1])
is.data.frame(stats[,1,drop=F])#need for drop=F when extracting just a column to preserve as data frame
#multiply columns
head(stats)
stats$Birth.rate*stats$Internet.users
stats$Birth.rate+stats$Internet.users
#add column
stats$MyCalc<-stats$Birth.rate*stats$Internet.users
head(stats)
#testofknowledge
stats$xyz <- 1:5
head(stats)
head(stats,n=12) #vector will be recycled in the new column
#remove a column
stats$MyCalc <- NULL
stats$xyz <- NULL
head(stats)


#----------Filtering Data Frames
head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate>40,]
stats[stats$Birth.rate>40 & stats$Internet.users<2,]
stats[stats$Income.Group == "High income",]
stats[stats$Country.Name == "Malta",]

#--------Introduction to qplot
library(ggplot2)
?qplot
qplot(data=stats,x=Internet.users)
qplot(data=stats,x=Income.Group,y=Birth.rate)
qplot(data=stats,x=Income.Group,y=Birth.rate, size=I(3), color=I("blue")) #type I() around size number and color to be treated as numbers
qplot(data=stats,x=Income.Group,y=Birth.rate)

#----------Visualizing
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate, 
      size=I(4))
qplot(data=stats, x=Internet.users, y=Birth.rate, 
      size=I(4), color=I("red"))
qplot(data=stats, x=Internet.users, y=Birth.rate, 
      size=I(5), color=Income.Group)



#----------Creating dataframes
#mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
#(mydf)
colnames(mydf) <- c("Country", "Code", "Region")
rm(mydf)
#--- time saving method to rename columns, no need for quotation marks. this also works in cbind and rbind
mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, Region=Regions_2012_Dataset, stringsAsFactors = TRUE)
head(mydf)
tail(mydf)
summary(mydf)


#--------merging data frames
head(stats)
head(mydf)


merged <- merge(stats, mydf, by.x= "Country.Code", by.y = "Code")
head(merged)

merged$Country <- NULL
head(merged)
tail(merged)


#-------------Visualizing with new split
qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region)

#1.Shapes
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(5), shape=I(23))

#2.Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(5), shape=I(19), alpha=I(0.6))

#3. Title
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(5), shape=I(19), alpha=I(0.6), main="Birth Rate vs. Internet Users")
