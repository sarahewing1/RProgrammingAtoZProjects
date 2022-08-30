
x <- c("a","b","c","d","e")
x
x[c(1,5)]
x[1]
x[c(1,5)]
x[1]
x[1,5]


Games
Games[1:3,6:10]
Games[c(1,10),]
Games[,c("2008","2009")]
Games[1,]
is.matrix(Games[1,])
is.vector(Games[1,])
Games[1,5,drop=F]
Games[1,,drop=F]
is.matrix(Games[1,5,drop=F])


myplot <- function(data, rows=1:10){Data <- data[rows,,drop=F]
matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
}

myplot(Salary/Games)
myplot(Salary/FieldGoals)

myplot(MinutesPlayed)
myplot(Points)

myplot(FieldGoals/Games)
myplot(FieldGoals/FieldGoalAttempts)
myplot(FieldGoalAttempts/Games)
myplot(Points/Games)

myplot(MinutesPlayed/Games)
myplot(Games)

myplot(FieldGoals/MinutesPlayed)

myplot(Points/FieldGoals)
