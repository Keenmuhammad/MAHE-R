---
title: "The dplyr Library for Data Manipulation"
output: html_notebook
---



```{r}
library(tidyverse)
```

```{r}
carData = read.csv('mtcars.csv')
head(carData, 5)
str(carData)
```
```{r}
colnames(carData)
nrow(carData)
```
```{r}
categorical_cols = c('vs', 'am')
carData[categorical_cols] = lapply(carData[categorical_cols], as.factor)
str(carData)
```
```{r}
select(carData, wt)
```
```{r}
select(carData, -wt)
```
```{r}
select(carData, c(cyl, wt))
select(carData, cyl, wt)
```
```{r}
select(carData, -c(cyl, wt))
select(carData, -cyl, -wt)
```
```{r}
filter(carData, vs == 0)
```

```{r}
filter(carData, vs == 0 & am == 1)
```
```{r}
filter(carData, vs == 0 & am == 1 & (hp < 100 | hp > 150))
```
```{r}
carData %>% filter(vs == 0) %>% select(cyl, wt)
```
```{r}
mutate(carData, wtton = 0.5 * wt)
```
```{r}
carData %>% filter(!is.na(wt)) %>% mutate (wtton = 0.5 * wt)
```
```{r}
carData %>% mutate(cyltype = ifelse(cyl > 4, 'High', 'Low'))
```
```{r}
carData.new = carData %>% mutate(cyltype = ifelse(cyl > 4, 'High', 'Low'), wtton = 0.45 * wt)
print(carData.new)
```
```{r}
carData.new %>% summarise(mean(wtton))
```

```{r}
carData.new %>% summarise(mean(wtton), mean(disp), min(wtton), max(disp))
```
```{r}
carData.new %>% summarise(mean(wtton), mean(disp))
```

```{r}
carData.new %>% group_by(cyltype) %>% summarise(mean(wtton), mean(disp))
```

```{r}
carData.new %>% group_by(cyltype) %>% summarise(mean(wtton), min(disp))
```

```{r}
carData.new %>% group_by(cyltype) %>% summarise(mwt = mean(wtton), mdisp = mean(disp)) %>% arrange(mwt)
```
```{r}
carData.new %>% group_by(cyltype) %>% summarise(mwt = mean(wtton), mdisp = mean(disp)) %>% 
  arrange(desc(mwt))
```

```{r}
carData.new %>% group_by(cyltype) %>% count()
```

```{r}
carData.new %>% count(cyltype, vs)
```
```{r}
carData.new %>% count(cyltype) %>% arrange(n)
```