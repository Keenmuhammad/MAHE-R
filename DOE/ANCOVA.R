
# Researchers investigated the effect of exercise in reducing the level anxiety
# Therefore the conducted an experiment where they measured the anxiety score of 
# three group of individuals practicing physical exercises at different levels
# (grp1:low, grp2: moderate, grp3: high).
# The anxiety score was measured pre and 6 month post exercise program.
# Its is expected any reduction in anxiety by exercises program will also depend on 
# participant's basal level of anxiety score.
# I this analysis we use the pretest anxiety score as the covariate and we are interested in
# possible differences between groups with respect to post test anxiety scores

library(broom)
library(datarium)

# load and prepare the data
data("anxiety", package = "datarium")
data <- anxiety %>%
  select(id, group, t1, t3) %>%
  rename(pretest = t1, posttest = t3)
data[14, "posttest"] <- 19

# inspect the data by showing 1 random row by groups
set.seed(123)
data %>% sample_n_by(group, size = 1)
  
str(data)

# Checking linearity between the covariate and the outcome variable at each
# level of the group variable

ggscatter(
  data, x ="pretest", y = "posttest",
  color = "group", add = "reg.line"
)+
  stat_regline_equation(
    aes(label = paste(after_stat(eq.label), after_stat(rr.label), sep = "~~~"), 
        color = group)
  )

# There is linear relationship between pre-test and post-test anxiety score
# for each training group, as assessed by the visual inspection of a scatter plot

# Checking Homogeneity of regression slopes
# Slopes of the regression line formed by the covariate and the outcome variable
#should be same for this group

data %>% anova_test(posttest ~ group*pretest)
# there is homogeneity of regression slope as the interaction term was not 
# statistically significant, F(2, 39) = 0.13, p = 0.88

# the outcome variable should be approximately normally distributed.
# This can be checked using the Shapiro-Wilk test of normality on the model residuals

# fit the model, the covariate goes first
model <- lm(posttest ~ pretest + group, data = data) 

# Inspect the model diagnostic metrics
model.metrics <- augment(model)
head(model.metrics, 3)

# Normality of residuals using Shapiro-Wilk test
shapiro.test(model.metrics$.resid)
# The Shapiro-Wilk test was not significant (p > 0.05), hence we assume normality

#Homogeneity of variance
#ANCOVA assumes that the variance of the residuals is equal for all groups.
# This can be checked with the Levene's test
model.metrics %>% levene_test(.resid ~ group)

# Conducting the ANOVA test
library(car)
res.aov4 <- data %>% anova_test(posttest ~ pretest + group)
get_anova_table(res.aov4)

# After adjustment for pre-test anxiety score, there is statistically significant
# difference in post-test anxiety score 
# between the groups, f(2, 11) = 218.63, p < 0.0001

# Post-hoc test
# pairwise comparisons can be performed to identify which groups are different

# Pairwise comparisons
library(emmeans)
pwc <- data %>%
  emmeans_test(
    posttest ~ group, covariate = pretest,
    p.adjust.method = "bonferroni"
  )
pwc

# Display the adjusted mean of each group
# Also called the estimated marginal mean (emmeans)
get_emmeans(pwc)

# The anxiety score was statistically and significantly greater in group 1
# compared to group 2 and 3

# Report
# After adjustment of pre-test anxiety score, there is statistically significant
# difference in post-test anxiety score between the groups
# f(2, 31) = 218.63, p < 0.0001
# Post-hoc analysis was performed with "Bonferroni" adjustment. the mean
# anxiety score was statistically significantly greater in group 1 
# (16.4+/-0.15) compared to group2 (15.8+/-0.12) and group 3(13.5+/-0.11), p < 0.001