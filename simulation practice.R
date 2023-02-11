---
title: "Simulation Using R in-built Functions Practice"
output: html_notebook
---

 

```{r}
library(dplyr)
library(ggplot2)
```

```{r}
# A fun exercise to simulate the rolling of a fair die
# Sampling space for rolling a pair of a fair dice
#s = c(1:6)
#Corresponding probabilities
#p = (1/6)*replicate(6, 1)
#print(p)
# The sampling process
#sample(s, 1, replace = TRUE, prob = p) # samples the die
#My explanation
# nsimulations = 10 # replicate() repeats the sampling process several times
# simulateData=replicate(nsimulations, sample(s, 2, replace = TRUE, prob = p))
str(simulateData [, 1]) # Accesses first column
print(simulateData)
```
```{r}
nsimulations = 1e5
simulateData=replicate(nsimulations, sample(s, 2, replace = TRUE, prob = p))
# Function to check if the sum of the rolls is at least 7
checkEvent = function(data){
  if (sum(data) >= 7){
    return(1)
  } else {
    return(0)
  }
}
# Probability that the sum of the rolls is at least 7
#print(simulateData)
#apply(simulateData, 2, checkEvent)
mean(apply(simulateData, 2, checkEvent))
#probability that first raw is even
checkEvent1 = function(data){
  if (data[1]%%2 == 0){
    return(1)
  } else {
    return(0)
  }
}
mean(apply(simulateData, 2, checkEvent1))
```
```{r}
# Simulating discrete random variable (n = 10, p = 0.6 )
n = 10
p = 0.6
nsimulations = 1e05
simulateData = rbinom(nsimulations, n, p)
# table(simulateData)
# as.data.frame(table(simulateData))
df = as.data.frame(table(simulateData))
colnames(df) = c('Variables', 'Frequency')
# print(df)
p = ggplot(data = df) +
  geom_col(aes(x = Variables, y = Frequency ), width = 0.7, fill = 'darkblue') +
  ggtitle('Simulating a Binomial Randon Variable') +
  labs(x = 'Var', y = 'Freq') +
  theme_minimal()
p
```
```{r}
#Poisson discrete random variable
rpois(100, lambda = 10)
```
```{r}
#Simulating a continuous random variable
mu = 170 #average student height
sigma = 8 #standard deviation
nsimulations = 1e05
x = rnorm(nsimulations, mean = mu, sd = sigma)
df = as.data.frame(x)
colnames(df) = 'height'
head(df)
```
```{r}
ggplot(data = df)+
  geom_histogram(mapping = aes(x = height, y = ..count..), color = 'black', fill = 'steelblue', alpha = 0.4)
```
```{r}
mu = 170
sigma = 8
delta = 2
seq(mu-4*sigma, mu+4*sigma, by = delta)
```
```{r}
mu = 170 #average student height
sigma = 8 #standard deviation
nsimulations = 1e5
x = rnorm(nsimulations, mean = mu, sd = sigma)
df = as.data.frame(x)
colnames(df) = 'height'
#head(df)
#mean((df['height'] >= 170) & (df['height'] <= 171))
delta = 2
p1 = ggplot(data = df)+
  geom_histogram(aes(x = height, y = ..count..), breaks = seq(mu-4*sigma, mu+4*sigma, by = delta), color = 'black', fill = 'darkgreen', alpha = 0.4) + labs(x = 'Height', y = 'Frequency')
p1
```
```{r}
p1 = ggplot(data = df)+
  geom_histogram(aes(x = height, y = ..density..), breaks = seq(mu-4*sigma, mu+4*sigma, by = delta), color = 'black', fill = 'brown', alpha = 0.4) + labs(x = 'Height', y = 'Density')
p1
```
```{r}
p1 = ggplot(data = df)+
  geom_histogram(aes(x = height, y = ..count../sum(..count..)), breaks = seq(mu-4*sigma, mu+4*sigma, by = delta), color = 'black', fill = 'pink', alpha = 0.4) + labs(x = 'Height', y = 'Relative Frequency')
p1
```
```{r}
```