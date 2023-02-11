---
title: "ggplot2 part III"
output: html_notebook
---


```{r}
library(ggplot2)
```

```{r}
data('mpg')
```

```{r}
mpg = mpgData
head(mpgData, 5)
```
```{r}
ggplot(data = mpgData) +
  geom_point(mapping = aes(x = displ, y = hwy), color = 'forestgreen')
```
```{r}
ggplot(data = mpgData) +
  geom_bar( mapping = aes(x = cyl), color = 'black', fill = 'blue4')
```

```{r}
ggplot(data = mpgData) +
  stat_count( mapping = aes(x = cyl), color = 'black', fill = 'cyan4')
```

```{r}
table(mpgData$cyl)
mpgData$cyl
tempData = data.frame(table(mpgData$cyl))
colnames(tempData) = c('cyl', 'frequency')
tempData
```

```{r}
ggplot(data = tempData) +
  geom_bar(mapping = aes(x = cyl, y = frequency), stat = 'identity')
```

```{r}
# ggplot(data = mpgData) +
#   stat_count( mapping = aes(x = cyl, y = ..prop..), color = 'black', fill = 'antiquewhite')
ggplot(data = mpgData) +
  stat_count( mapping = aes(x = cyl, y = after_stat(prop), fill = 'antiquewhite'))
```
```{r}
#mpgData$displ
ggplot(data = mpgData) +
  geom_histogram(mapping = aes(x = displ, y = ..count..), binwidth = 0.5, color ='black', fill = 'navyblue', alpha = 0.4) +
  labs(x = 'Displacement (liters)', y = 'Frequency')
```
```{r}
ggplot(data = mpgData) +
  geom_histogram(mapping = aes(x = displ, y = ..count../sum(..count..)), binwidth = 0.5, color ='black', fill = 'royalblue', alpha = 0.4) +
  labs(x = 'Displacement (liters)', y = 'Frequency')
```

```{r}
ggplot(data = mpgData) +
  geom_histogram(mapping = aes(x = displ, y = ..density..), binwidth = 0.5, color ='black', fill = 'magenta4', alpha = 0.4) +
  labs(x = 'Displacement (liters)', y = 'Frequency')
```

```{r}
ggplot(data = mpgData) +
  geom_histogram(mapping = aes(x = cyl, fill = class), binwidth = 1.0)
```
```{r}
ggplot(data = mpgData) +
  geom_histogram(mapping = aes(x = cyl, fill = class), binwidth = 1.0, position = 'identity', alpha = 1/5)
```

```{r}
ggplot(data = mpgData) +
  geom_histogram(mapping = aes(x = cyl, fill = class), binwidth = 0.5,  position = 'fill')
```