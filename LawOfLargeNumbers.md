#This first project was to create a counter that demonstrates the Law of Large Numbers concept for N random normally distributed numbers with mean= 0, std deviation = 1. For E(x) = 68.2 %, Check that Mean(x) -> E(x) as N increases.
N <- 1000
counter <- 0
for(i in rnorm(N)){
  if(i > -1 & i < 1){
    counter <- counter + 1
  }
}
answer <- counter / N
answer
