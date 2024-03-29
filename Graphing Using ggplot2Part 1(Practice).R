---
title: "Graphing Using ggplot2"
output: html_notebook
---

```{r}
library(ggplot2)
data('mpg')
mpgData = mpg
head(mpgData, 5)
ggplot(data = mpgData)
p1 = ggplot(data = mpgData)
p1 = ggplot(data = mpgData, aes(x = displ, y = hwy))
p1 = ggplot(data = mpgData, aes(x = displ, y = hwy)) + geom_point()
p1 = p1 + labs(x = 'Displacement (liters)', y = 'Mileage (MPG)',title = 'Displacements vs. Mileage')
p1
```

```{r}
p2 = ggplot(data = mpgData) + 
  geom_point( mapping = aes(x = displ, y = hwy, color = class))
p2                        
```

```{r}
p3 = ggplot(data = mpgData) + 
  geom_point( mapping = aes(x = displ, y = hwy, alpha = class))
p3    
```

```{r}
p4 = ggplot(data = mpgData) + 
  geom_point(aes(x = displ, y = hwy), color = 'blue')
p4
```

```{r}
ggplot(data = mpgData) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, nrow = 2)
```

```{r}
ggplot(data = mpgData) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)
```

```{r}
# factor(mpgData$cyl)
# 
# library(dplyr)
# 
# mpgData %>% count(cyl)
# mpgData = mpgData %>% filter (!(cyl %in% c(5)))
# 
# head(mpgData, 5)
p5 = ggplot(data = mpgData) + 
  geom_point(mapping = aes(x= displ, y = hwy, color = factor(cyl), shape = class))
p5
```