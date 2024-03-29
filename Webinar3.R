---
title: "Webinar-3"
output:
  html_document:
    df_print: paged
editor_options:
  chunk_output_type: console
---

#### Execute the following cell to load the tidyverse library:
```{r}
library(tidyverse)
```

#### Execute the following cell to load the data. Refer to this website http://openmv.net/info/food-texture for data description:
```{r}
file = 'http://openmv.net/file/food-texture.csv'
foodData = read.csv(file, header = TRUE, row.names = 1)
```

#### Print structure of dataframe
```{r}
str(foodData)
```

#### Print first 5 samples of data frame
```{r}
head(foodData, n = 5)
```

#### Modify the data frame
```{r}
# Rename Oil column to OilPercentage
foodData = foodData %>% rename(OilPercentage = Oil)
```

```{r}
# Modify crispy column to reflect high (0) and low (1) crispness
foodData = foodData %>% mutate(Crispy = ifelse(Crispy > 11, 'high', 'low'))
```

```{r}
# Change Crispy column to factor type
foodData['Crispy'] = lapply(foodData['Crispy'], factor)
```

#### Print structure of modified data frame
```{r}
str(foodData)
```

#### Make a scatter plot between Density (x-axis) and OilPercentage (y-axis). What do you observe from this plot?
```{r}
p1 = ggplot(data = foodData, aes(x = Density, y = OilPercentage)) +
  geom_point(size = 1)  
p1
```

####  Make a scatter plot between Density (x-axis) and OilPercentage (y-axis) color coded using Crispy. What do you observe from this plot?
```{r}
p2 = ggplot(data = foodData, aes(x = Density, y = OilPercentage, color = Crispy)) +
  geom_point(size = 1) 
p2
```

#### Calculate Pearson's correlation between Density and OilPercentage.
```{r}
cor(foodData$Density, foodData$OilPercentage, method = 'pearson')
```


#### Print structure of dataframe
```{r}
str(foodData)
```

#### Standardizing data-1
```{r}
p3 = ggplot(data = foodData, aes(y = OilPercentage)) +
  geom_boxplot() 
p3
```

#### Standardizing data-2
```{r}
p3 = ggplot(data = foodData, aes(y = OilPercentage)) +
  geom_histogram(fill = 'blue', color = 'black', binwidth = 1.0) +
  coord_flip()
p3
```

#### Standardizing data-2
```{r}

```

#### Scale continuous columns of dataframe.
```{r}
ind = sapply(foodData, is.numeric)
foodData[ind] = lapply(foodData[ind], scale)
head(foodData)
```

#### Calculate the principal components for the the continuous features
```{r}
pca = prcomp(foodData[ind], scale = FALSE)
```

```{r}
# The PC1-score of the 1st sample

```

#### Calculate PC-1 and PC-2 scores of all samples
```{r}

```

#### Calculate variance along the PC-1 and PC-2 direction
```{r}
```

```{r}
```

#### Looking at the PCA matrix, answer the following questions:

1. Which principal component assigns the greatest weight (in magnitude) to Density?
2. Which principal component assigns the greatest weight (in magnitude) to OilPercentage?
3. True/false: the 2nd principal component score for a sample assigns a maximum weight to its Hardness.
```{r}

```

#### Create a new dataframe containing the PC scores```{r}
```{r}
foodDataPC = as.data.frame(cbind(as.matrix(foodData[ind]) %*% pca$rotation, foodData$Crispy))
colnames(foodDataPC) = c('PC1', 'PC2', 'PC3', 'PC4', 'Crispy')
head(foodDataPC)
```

#### Plot PC-1 vs. PC-2 scores color coded by Crispy
```{r}
p4 = foodDataPC %>% ggplot(aes(x = PC1, y = PC2, color = factor(Crispy))) +
  geom_point(size = 1)
p4
```

#### Plot a histogram of Hardness values
```{r}
p5 = ggplot(data = foodData) +

```


##### Boxplot to visualize Hardness according to Crispy
```{r}
p6 = ggplot(data = foodData)
```

```{r}

```


![](Images/CourtProblem.png)

#### Court Problem
```{r}
# Sampling space
s = c(1, 0)

# Corresponding probabilities for judge-1
p = 

judgeResult = function(){
  
  }

}

nsimulations = 1e6 # 10^6

simulatedData = 


# Function to check if the majority decision is incorrect
# which is the same as the court making an incorrect decision
checkEvent = function(data){
  return(3)
}

# Probability that the court makes an incorrect decision

```

