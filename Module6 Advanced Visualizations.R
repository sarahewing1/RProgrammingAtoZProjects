getwd()
setwd("/Users/Sarah/Desktop/Super Data Science/R")
movies <- read.csv("P2-Movie-Ratings.csv", stringsAsFactors = TRUE)
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies)
summary(movies)
factor(movies$Year)
str(movies)
movies$Year <- factor(movies$Year) #reassign column as a factor
summary(movies)
str(movies)

#-------Aesthetics
library(ggplot2)
?ggplot
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#-----Add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + geom_point()

#--- Add color
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre)) + geom_point()

#-- Add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions)) + geom_point()

#This is #1, but we will improve it

#------Plotting with Layers
p <-ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions))

#point
p + geom_point()
#lines
p + geom_line()
#multiple layers

p+ geom_point() + geom_line()
p + geom_line() + geom_point()


#---------Overriding Asethetics
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions))

#add geom layer
q + geom_point()


#override asethetics
#Example 1
q + geom_point(aes(size=CriticRating)) #overrides original size based on budget

#Example2
q + geom_point(aes(color=BudgetMillions)) #overrides the color to be based on Budget

q + geom_point() #doesnt change q with overridding

#Example 3
q + geom_point(aes(x=BudgetMillions)) + xlab("Budget Millions $$$") # override axis labels

#Example 4
q + geom_line() + geom_point()
#reduce line size
q + geom_line(size=1) + geom_point()


#---Mapping vs Setting

r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#Add color
#1 Mapping (what we have done so far) for more complex
r + geom_point(aes(color=Genre))
#2 Setting simple doesnt use aesthetics
r + geom_point(color="DarkGreen")
#Example Error
#r + geom_point(aes(color="DarkGreen))



#1. Mapping
r + geom_point(aes(size=BudgetMillions))
#2. Setting, doesnt use aesthetics
r + geom_point(size=10)



#--------Historgrams and Density Charts

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth=10)

#add color
s + geom_histogram(binwidth=10, aes(fill=Genre))
#add a border
s + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")
#This is #3 but we will improve it

#density charts
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")


#--- Starting layer tips

t<- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10, fill="White", color="Blue")

#anotherway if you need more flexibility
t <- ggplot(data=movies)
t + geom_histogram(binwidth=10, aes(x=AudienceRating), fill="white", color="Blue")
#4 chart
t + geom_histogram(binwidth=10, aes(x=CriticRating), fill="white", color="Blue")

#5 #skeleton plot and specify data and aesthetics each time

t <- ggplot()


#----------geom transformations

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, color=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
#tip or hack
u + geom_boxplot(size=1.2) + geom_jitter()
#another way better way
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)
#6
#-------Using Facets
v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth=10, aes(fill=Genre), color="Black")
#facets
v + geom_histogram(binwidth=10, aes(fill=Genre), color="Black") + facet_grid(Genre~., scales="free")
#scatterplot
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
w + geom_point(size=3)
#facets
w + geom_point(size=3) + facet_grid(Genre~.)
w + geom_point(size=3) + facet_grid(.~Year)
w + geom_point(size=3) + facet_grid(Genre~Year)

w + geom_point(size=3) + facet_grid(Genre~Year) + geom_smooth()
w + geom_point(aes(size=BudgetMillions)) + facet_grid(Genre~Year) + geom_smooth()

#1 but we can still improve

#----------Coordinates
#Today
#limits
#zoom

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, size=BudgetMillions, color=Genre))
m + geom_point()
m + geom_point() + xlim(50,100) + ylim(50,100)

#wont always work well
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre), color="Black")
n + geom_histogram(binwidth=10, aes(fill=Genre), color="Black") + ylim(0,50)

#instead use zoom
n + geom_histogram(binwidth=10, aes(fill=Genre), color="Black") + coord_cartesian(ylim=c(0,50))


#improve #1
w + geom_point(aes(size=BudgetMillions)) + facet_grid(Genre~Year) + geom_smooth() + coord_cartesian(ylim=c(0,100))


#---------------Theme
o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")

h
#axes labels 

h + xlab("Money Axis") + ylab("Number of Movies")

#label formatting

h + xlab("Money Axis") + ylab("Number of Movies") + theme(axis.title.x=element_text(color="DarkGreen", size=30), axis.title.y = element_text(color="Red", size=30))

#tick mark formatting

h + xlab("Money Axis") + ylab("Number of Movies") + theme(axis.title.x=element_text(color="DarkGreen", size=30), axis.title.y = element_text(color="Red", size=30), axis.text.x = element_text(size=20), axis.text.y = element_text(size=20))

#legend formatting
h + xlab("Money Axis") + ylab("Number of Movies") + theme(axis.title.x=element_text(color="DarkGreen", size=30), axis.title.y = element_text(color="Red", size=30), axis.text.x = element_text(size=20), axis.text.y = element_text(size=20), legend.title = element_text(size=30), legend.text = element_text(size=20), legend.position = c(1,1), legend.justification = c(1,1))

#title to the plot
h + xlab("Money Axis") + ylab("Number of Movies") + ggtitle("Movie Budget Distribution") + theme(axis.title.x=element_text(color="DarkGreen", size=30), axis.title.y = element_text(color="Red", size=30), axis.text.x = element_text(size=20), axis.text.y = element_text(size=20), legend.title = element_text(size=30), legend.text = element_text(size=20), legend.position = c(1,1), legend.justification = c(1,1), plot.title= element_text(color="DarkBlue", size=40,family="Courier"))
