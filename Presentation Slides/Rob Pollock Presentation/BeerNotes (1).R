# setwd()

library(tidyverse) # contains both dplyr and ggplot2


BeerUnits <- read.csv("Beers Unit 8.csv")
Brews <- read.csv("Breweries.csv")


BeerUnits <- Beers.unit.8
Brews <- Breweries

sum(is.na(BeerUnits$IBU)) #Testing to see how many values are missing
sum(is.na(BeerUnits$ABV))

# Creating another ID variable in the first dataframe (df) so the ID
# has the same name in both and the join will work
BeerUnits <- BeerUnits %>%
  mutate(Brew_ID = Brewery_id)

BeerJoin <- left_join(BeerUnits, Brews, by = "Brew_ID")

attach(BeerJoin) # Attaching the join df for ease of typing

cor.test(IBU, ABV) # Pearson correlation test on IBU and ABV
# This will provide a numeric measure of correlation


#Scatterplot of IBU and ABV with linear regression line
ggplot(data = BeerJoin, aes(x=ABV, y=IBU))+
  geom_point()+ #Adds the points
  geom_smooth(method="lm") #Smooth line: 'method = "lm"' makes it linear
