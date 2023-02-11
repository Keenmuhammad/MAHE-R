---
title: "ggplot2 part II"
output: html_notebook
---


```{r}
library(ggplot2)
```

```{r}
data('mpg')
mpgData= mpg
str(mpgData)
```

```{r}
head(mpgData, 5)
```

```{r}
p1 = ggplot(data = mpgData) +
  geom_point(mapping = aes(x = displ, y = hwy))
p1
```

```{r}
p2 = ggplot(data = mpgData) +
  geom_smooth(mapping = aes(x = displ, y = hwy), se = FALSE)
p2
```

```{r}
p3 = ggplot(data = mpgData) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), se = FALSE)
p3
```

```{r}
p3 = ggplot(data = mpgData) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = factor(cyl)), se = FALSE)
p3
```
```{r}
p4 = ggplot(data = mpgData, mapping = aes(x= displ, y = hwy)) + geom_point(mapping =
aes(color = factor(cyl))) + geom_smooth(data = filter(mpgData, class == 'subcompact'), se
= FALSE)
p4
```


```{r}
p6 = ggplot(data = mpgData) +
  geom_bar(mapping = aes(x = cyl), fill = 'hotpink4')
p6
```
```{r}
p6 = ggplot(data = mpgData) +
  geom_boxplot(mapping = aes(x = factor(cyl), y = hwy)) 
p6
```

```{r}
p6 = ggplot(data = mpgData) +
  geom_boxplot(mapping = aes(x = factor(cyl), y = hwy), outlier.color = 'red4', outlier.shape = 8, outlier.size = 4) 
p6
```
```{r}
df = data.frame(
  gender = factor(rep(c('F', 'M'), each = 200)), height = round(c(rnorm(200, mean = 60, sd = 10), rnorm(200, mean = 70, sd = 6)))
  )
print(df)
```
```{r}
str(df)
```
```{r}
p7 = ggplot(data = df) +
  geom_histogram(mapping = aes(x = height), fill = 'palegreen4')
p7
```
```{r}
p8 = ggplot(df, aes(x = height)) +
  geom_histogram(binwidth = 2, color = 'black', fill = 'forestgreen')
p8
```
```{r}
p9 = ggplot(df, aes(x = height, color = gender)) +
  geom_histogram(fill = 'white')
p9
```

```{r}
p9 = ggplot(df, aes(x = height, color = gender)) +
  geom_histogram(fill = 'white', alpha = 0.1, position = 'identity')
p9
```