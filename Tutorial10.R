



#matrix()
my.data <- 1:20
my.data
A <- matrix(my.data,4,5)
A[2,3]
B <- matrix(my.data,4,5,byrow=1)
B
B[2,5]


#rbind()
r1 <- c("I", "am", "happy")
r2 <- c("What", "a", "day")
r3 <- c(1,2,3)
C <- rbind(r1,r2,r3)
C


#cbind()
c1 <- 1:5
c2 <- -1:-5

D <- cbind(c1,c2)
D


#NamedVectors
Charlie <- 1:5
Charlie


#givenames
names(Charlie) <- c("a","b","c","d","e")
names(Charlie)
Charlie


#clear names
names(Charlie)  <-NULL
Charlie


#---------
 
#Naming Matrix Dimensions 1

temp.vec <-
  
  rep(c("a","B","zZ"),each=3)
temp.vec

Bravo <-matrix(temp.vec,3,3)
Bravo

rownames(Bravo) <- c("How", "are", "you")
colnames(Bravo) <- c("X", "Y", "Z")

Bravo[2,2] <- 0
Bravo


