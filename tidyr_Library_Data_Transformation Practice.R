---
title: "tidyr_Library_for_Data_Transformation Practice"
output: html_notebook
---

```{r}
library(tidyverse)
```

```{r}
table1
```

```{r}
table2
```
```{r}
table3
```
```{r}
table4a
```
```{r}
table1 %>% mutate(rate = (cases / population)* 10000)
table1 %>% count(year, wt = cases)
```
```{r}
library(ggplot2)
ggplot(data = table1 %>% mutate(rate = (cases/population)*10000), aes(x = year, y = rate)) +
  geom_line(aes(group = country), color = 'black')+
  geom_point(aes(color = country))
```
```{r}
table1 %>% select(c(year, country, population))
table1 %>% select(c(year, country, population)) %>% spread(key = country, value = population)
```

```{r}
table1 %>% mutate(rate = (cases/population)*10000) %>% select(c(year, country, rate)) %>% spread(key = country, value = population)
```
```{r}
table1 %>% mutate(rate = (cases/population)*10000) %>% select(c(year, country, rate)) 
```
```{r}
table1 %>% mutate(rate = (cases/population)*10000) %>% select(c(year, country, rate)) %>% spread(key = country, value = rate)
```

```{r}
table1.wide = table1 %>% filter(!is.na(cases))
print(table1.wide)
```
```{r}
table1.wide = table1 %>% filter(!is.na(cases)) %>% mutate(rate = (cases/population)*10000) %>% select(c(year, country, rate)) %>% spread(key = country, value = rate)
head(table1.wide)
```

```{r}
head(table1.wide)
table1.wide %>% gather(key = 'country', value = 'rate', - year)
```
```{r}
#Importing data 
file = 'mtcars.csv'
carData = read.csv(file, header = TRUE, row.names = 1, stringsAsFactors = FALSE)
head(carData)
```

```{r}
#Exporting data
write_csv(table1.wide, file = 'table1wide.csv')
```
