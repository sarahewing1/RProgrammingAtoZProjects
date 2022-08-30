


Games
rownames(Games)
colnames(Games)
Games["LeBronJames","2012"]


FieldGoals

FieldGoals / Games
round(FieldGoals / Games,1)
round(MinutesPlayed / Games)

FieldGoalAttempts/Games
round(FieldGoalAttempts/Games,1)

round(FieldGoals/FieldGoalAttempts,0)
round((FieldGoals/FieldGoalAttempts)*100,2)


matplot
t(FieldGoals)
matplot(t(FieldGoals/FieldGoalAttempts), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)


matplot(t(Salary/Points), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)
