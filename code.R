#Created By: Aar Riana
##
library(tidyverse) # for data exploration and manipulation
library(skimr) # for useful and beautiful summary statistics
library(GGally) # for correlation testing
library(mice) #cek missing value
library(earth) #MARS
library(caret)
##read data
data1 <- read.csv("genotipo_sim2.csv")
data2 <- read.csv("fenotipo_sim2.csv")
str(data1)
str(data2)
##merge data
dataset <- merge(x=data1, y=data2, by.x ="X", by.y = "X", all = TRUE)
#slicing dataset
data <- dataset[2:10002]
##cek missing value
md.pattern(data)
##summary statistics
skim(data[1:10])
## Modeling using MARS with earth() function
fit <- earth(x~., data)
# summarize the fit
summary(fit)
## plot variable importance
plot(evimp(fit), type.nsubsets = "b", x.legend = "topright",
     type.gcv = "b", type.rss = "b", col.gcv = "blue")
##