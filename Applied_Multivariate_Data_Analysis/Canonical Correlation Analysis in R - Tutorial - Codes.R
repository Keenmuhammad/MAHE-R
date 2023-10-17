#A researcher has collected data on three psychological variables,four academic variables
#(Standardized test score) And gender for 600 college freshman.
#She is interested in how the set of psychological variable relates to 
#the academic variable and gender.
#In particular, the researcher is interested in how many dimensions 
#(canonical variables) are necessary to understand the association between
#the two sets of variables.

#install.packages("ggplot2")
#install.packages("GGally")
#install.packages("CCA")
#install.packages("CCP")
library(ggplot2)
library(GGally)
library(CCA)
library(CCP)
mm <- read.csv("https://stats.idre.ucla.edu/stat/data/mmreg.csv")
colnames(mm) = c("Control", "Concept", "Motivation", "Read", "Write", "Math", "Science", "Sex")
summary(mm)

# Data summary
xtabs(~Sex, data = mm)

psych = mm[,1:3]
acad = mm[,4:8]
ggpairs(psych)
ggpairs(acad)

# correlations within and between the two sets of variables

matcor(psych, acad)


# canonical Correlation
cc1 = cc(psych,acad)


# display the canonical correlations
cc1$cor

plot(cc1$cor, type = "b")



# compute canonical loadings
cc2 <- comput(psych, acad, cc1)

# display canonical loadings
cc2[3:6]


# tests of canonical dimensions
#canonical correlation coefficients.
rho <- cc1$cor
## Define number of observations, number of variables in first set, and number of variables in the second set.
n <- dim(psych)[1]
p <- length(psych)
q <- length(acad)

## Calculate p-values using the F-approximations of different test statistics:
# functions for dimensionality

p.asym(rho, n,p,q, tstat = "Wilks")

p.asym(rho, n,p,q, tstat = "Hotelling")
p.asym(rho, n,p,q, tstat = "Pillai")

p.asym(rho, n,p,q, tstat = "Roy")


