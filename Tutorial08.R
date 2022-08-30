

x <- rnorm(5)
x
 #R specific programming loop
for(i in x){
  print(i)
}

print(x[1])

#Conventional programming loop
for (j in 1:5){
print(x[j])
}

#--------------2nd part

N <- 100
a <- rnorm(N)
b <- rnorm(N)


#vectorized approach
c <- a * b

#devectorized approach
d <- rep(NA,N) #creates empty vector,allocated memory
for(i in 1:N){
  d[i] <- a[i] * b[i]
}