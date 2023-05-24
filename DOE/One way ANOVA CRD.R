


library(tidyverse)
library(ggplot2)
library(ggpubr)
library(rstatix)
library(datasets)

# if file is txt use
# data <- read.delim(file.chose())

# if file is txt use
# data <- read.csv(file.chose())

# here we use the built-in R data set "plantGrowth"
# it contains the weight of plants obtained under a control
# and two different treatment condition

pdata <- PlantGrowth

# we want to see if the average weights of the plants in three experimental circumstances
# vary significantly

library(dplyr)

summary(data)
# show a random sample

set.seed(123)
dplyr::sample_n(pdata, 10) 

# data structure
str(pdata)

# show levels
levels(pdata$group)

# if levels are not in order they can be ordered as follows
data$group <- ordered(data$group, levels = c ("ctr1", "trt1", "trt2"))

# summary statistics by groups

group_by(pdata, group) %>%
  summarise(
    count = n(),
    mean = mean(weight, na.rm = TRUE),
    sd = sd(weight, na.rm = TRUE)
  )

# Visualizing data using ggpubr

ggboxplot(data = pdata, x = "group", y = "weight",
          color = "group", palette = c("steelblue2", "tomato4", "forestgreen"),
          order = c("ctrl", "trt1", "trt2"),
          ylab = "Weights", xlab = "Treatment")


# add error bars: mean se

ggline(pdata, x = "group", y = "weight",
       add = c("mean_se", "jitter"),
       order = c("ctrl", "trt1", "trt2"),
       ylab = "Weights", xlab = "Treatment")

# we want to see if the average wights of plants in the three
# experimental circumstances vary significantly.

# setup null hypothesis and alternate hypothesis
# Ho: mu0 = mu1 = mu2 (there is no difference between the average weights
# of the plants in the three experimental groups)
# H1: not all means are equal

# perform an analysis of variance

res.aov <- aov(weight ~ group, data = pdata)

#summary of the analysis
summary(res.aov)

# multiple comparison test(because aov result shows significant 
# variation in groups)
# in one way ANOVA test, a significant p-value indicates that some of the 
# group means are different, but we don't know which pairs of group are different
# It is possible to compare multiple pairwise comparison to determine if the mean 
# difference between specific pairs of group are statistically significant

# Tukey multiple pairwise comparison

# TukeyHSD(res.aov)
# the function TukeyHSD takes the fitted ANOVA as a function

# diagnostic plots
# check for anova assumptions

# 1. Homogeneity of variance

plot(res.aov, 1)

# from the plot there are no clear correlation between residuals and the fitted
# values (the mean of each group). This is good, thus we assume variances are
# homogeneous

# even though outliers which can significantly affect the result are seen in
# point 4, 17, 15, homogeneity is still maintained in this case.

# statistical Test
# Levene's test is recommended since its is less sensitive to deviations from
# norrmal distribution.

install.packages("car")
library(car)

leveneTest(weight ~ group, data = pdata)

# p value indicates that variances across groups are not statistically 
# significant. (it is homogeneous)
# when homogeneity of variance assumption is violated we can go for the
# welch one way test

# 2. Normality

plot(res.aov, 2)
# we can infer normality as all the points lie roughly along the reference line
# Shapiro-wilk normality test

aov_residuals <- residuals(object = res.aov)
shapiro.test(x = aov_residuals)

# no violation of normality assumption as p value is insignificant
# the kruskal-wallis rank-sum test is a non-parametric alternative
# to one way ANOVA that cam b employed  when the ANOVA assumptions are not met.

kruskal.test(weight ~ group, data = pdata)
