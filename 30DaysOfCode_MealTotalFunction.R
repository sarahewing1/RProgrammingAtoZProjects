total_meal_cost <- function(mealcost,tip,tax) {
  tip_total <- (mealcost*tip)/100
  tax_total <- (mealcost*tax)/100
  total_cost <- round(mealcost + tip_total +tax_total)
  return(total_cost)
}
total_meal_cost(100,15,8)
total_meal_cost(12,20,8)
  