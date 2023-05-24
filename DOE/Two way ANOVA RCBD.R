
# Two way ANOVA is used to evaluate simultaneously the effect of 
# two grouping variables (A and B) on a response variable
# the balanced design  occurs when the simple size within the cells are equal i.e.

# (each group has same number of subjects)
# Two way ANOVA can be used in this situation

# we use a built-in data TootGrowth, it includes information about the effect of
# vitamin C on tooth growth in Guinea pigs

data <- ToothGrowth
# sample of the data 

set.seed(123)
dplyr::sample_n(data, 5)

str(data)

data$dose <- factor(data$dose,
                    levels = c(0.5, 1, 2),
                    labels = c("D0.5", "D1", "D2"))
str(data)

# Question: does tooth length according to on supp and dose?
# make frequency table

table(data$supp, data$dose)

# we have 2x3 design cells each with 10 observations, we have a well balanced 
# design

ggboxplot(data, x ="dose", y = "len", color = "supp",
          palette = c("hotpink", "cyan4"))

# Two way interaction plot 
# which plots the mean (or other summary) for the response
# for two way combination of factors there by illustrating possible interaction

ggline(data, x= "dose", y = "len", color = "supp",
       add = c("mean_se", "dotplot"),
       palette = c("hotpink", "cyan4"))

# there is no difference in the means of factor A
# there is no difference in the means of factor B
# there is no interaction between factors A and B

# calculating Two way ANOVA
res.aov2 <- aov( len ~ supp + dose, data = data)
summary(res.aov2)

# From the ANOVA table both supp and dose are statistically significant
# modifying the delivery technique supp or the vitamin c dose will have a major impact 
# on the mean tooth length. The above fitted model is used when the two factor variables 
# are unrelated
# replace + symbol with * if you think the two variables will interact

res.aov3 <- aov( len ~ supp * dose, data = data)
summary(res.aov3)

# it can be seen that the two main effects (supp and dose) are statistically significant
# as well as their interaction.  This means we cant go with RCBD
# instead we go with factorial analysis

# According to ANOVA there is significant difference in the result
# Identifying the difference

TukeyHSD(res.aov3, which = "dose")

# check the homogeneity of variance assumption
# 1. Homogeneity of variance

plot(res.aov3, 1)

# Levene's test

leveneTest(len ~ supp*dose, data = data)

# p value is not significant therefore, we assume homogeneity of variance in the different
# treatment groups

# Check the Normality assumption
# 2. Normality 
plot(res.aov3, 2)

# as all points fall approximately along reference line, we assume normality

# 3 Extract the residuals
aov_residuals <- residuals(object = res.aov3)
# run Shapiri-Wilk test
shapiro.test(x = aov_residuals)
# p value shows normality assumption is not violated

)



