---
title: "Exploratory Data Analysis Practice"
output: html_notebook
---

```{r}
library(tidyverse)
```
```{r}
carData = read.csv('mtcars.csv')

head(carData)
```

```{r}
carData = carData %>% mutate(cyltype = ifelse(cyl > 4, 'High', 'Low'))
head(carData)
```

```{r}
# Load the Motor Trend Car Road Tests (mtcars) dataset
carData = read.csv('mtcars.csv')
```
```{r}
# Create a vector of categorical columns
categorical_cols = c('vs', 'am', 'cyltype')

# Convert the columns to factor type
carData[categorical_cols] = lapply(carData[categorical_cols], as.factor)

str(carData)
```

```{r}
summary(carData)
```
```{r}
ggplot(data = carData) +
  geom_bar(aes(x = cyltype), fill = 'darkblue')
```
```{r}
carData %>% count(cyltype)
```
```{r}
ggplot(carData) +
  geom_histogram(mapping = aes(mpg), binwidth = 2.5, fill = 'cyan4')
```

```{r}
carData %>% 
  count(cut_width(mpg, 2.5))
```
```{r}
ggplot(data = carData, mapping = aes(x = mpg)) +
  geom_freqpoly(binwidth = 2.5, mapping = aes( color = cyltype))
```
```{r}
ggplot(data = carData, mapping = aes(x = cyltype, y = mpg)) +
  geom_boxplot()
```
```{r}
data('mpg')

mpgData = mpg
head(mpgData)
```

```{r}
ggplot(data = mpgData, mapping = aes( x = class, y = hwy)) +
  geom_boxplot()
```
```{r}
ggplot(data = mpgData, mapping = aes( x = reorder(class, hwy, FUN = median), y = hwy)) +
  geom_boxplot()
```
```{r}
carData %>% count(cyltype, am)
ggplot(data = carData) + 
  geom_count(mapping = aes(x = cyltype, y = am), color = 'red')
```

```{r}
ggplot(data = carData, mapping = aes(x = hp, y = mpg, color = factor(cyltype))) +
  geom_point(size = 1)
```
```{r}
data(diamonds)
head(diamonds)
```
```{r}
ggplot(data = diamonds)+
  geom_point(mapping = aes(x = carat, y = price))
```
```{r}
library(hexbin)
```

```{r}
ggplot(data = diamonds)+
  geom_hex(mapping = aes(x = carat, y = price))
```

