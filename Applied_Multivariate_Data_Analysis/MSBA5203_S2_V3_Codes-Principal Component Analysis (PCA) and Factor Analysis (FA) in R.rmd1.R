#FA 
# The dataset
food <- read.csv("https://userpage.fu-berlin.de/soga/300/30100_data_sets/food-texture.csv",
                 row.names = "X")
food
nrow(food)
ncol(food)
str(food)

library(MVA) # used for multivariate analysis

# Correlation Matrix
Food_cor = cor(food)
View(Food_cor)

#####KMO & Bartlett's test #### 
#used to check for sampling adequacy and suitability of data in factor analysis
#it quantifies the proportion of variable that can be explained by the underlined factors
#install.packages("psych")
library(psych)
# KMO
KMO(food) # if overall MSA is less than 0.6 it indicates poor sampling adequacy and factor analysis can
#not be recommended. In between 0.6-0.7 factor analysis is not ideal but can still be conducted.
#greater than 7 indicates moderate sampling adequacy

# Bartlett's sphericity
cortest.bartlett(food) #a statistical test in factor analysis used to determine the 
# correlation matrix of a set of a variable is significantly different from identity matrix
# Hypothesis of the test is that correlation matrix used is an identity matrix, alternate
#hypothesis states that correlation matrix is not an identity matrix. If p value in the 
#result is significant we reject the null hypothesis. if not significant we accept the 
#null hypothesis, if this is the case, the test assumes that the variabes are normally 
#distributed and have a linear relationship

#principal component analysis
pca_food = princomp(covmat = Food_cor)
summary(pca_food, loadings = TRUE) # show linear combinations of the variables that 
#are in the data

loadings(pca_food)# here we look at the cumulative variance, in social science the 
#threshold is 60 percent so according to our result we can use com 1,2&3 and ignore 4&5
# Scree plot
plot= screeplot(pca_food, type = "line", main="Scree plot") # Work just like 
# the principal component analysis it suggest the principal components to be used.
# ignore components after the elbow point of the plot

# compute eigen values, works like pca and screeplot
e= eigen(cor(food))
print(e) # base on our result it suggest only the first two components be 
#taken as they are greater than 1

#FA (with 2 factors)
#The factanal() function in R is used to perform factor analysis on a given data set.
food.fa <- factanal(food, factors = 2)
food.fa

# row SS loadings gives the sum of squared loadings. This is sometimes used to determine the value of a particular factor.
#A factor is worth keeping if the SS loading is greater than 1.

# Conventionally, we reject H0
#if the p-value is less than 0.05
# Such a result indicates that the number of factors is too small. In contrast, we do not reject H0
# if the p-value exceeds 0.05

#####################################
# Uniqueness
#  The uniqueness, sometimes referred to as noise, corresponds to the proportion of variability, which can not be explained by a linear combination of the factors.

#A high uniqueness for a variable indicates that the factors do not account well for its variance. 
food.fa$uniquenesses

# Communalities
# By squaring the loading we compute the fraction of the variable’s total variance explained by the factor
# This proportion of the variability is denoted as communality.
apply(food.fa$loadings^2,1,sum)

#Note, total variance is distributed among communalities and the uniqueness
#the major variance is represented as communalities & the noise 
#part is represented as uniqueness

# Another way to calculate the uniqueness is to subtract the Communalities from 1.
# An appropriate factor model results in low values for uniqueness and high values for communality.

1-apply(food.fa$loadings^2,1,sum)

#


# calculation of  The residual matrix i.e. S-Sigma
Lambda <- food.fa$loadings
#uniqueness wich is also noise can be represented as psi
Psi <- diag(food.fa$uniquenesses)
S <- food.fa$correlation
Sigma <- Lambda %*% t(Lambda) + Psi
Lambda
Psi
S
Sigma
# Residual Matrix
round(S - Sigma, 6)

###The resulting matrix is called the residual matrix. Numbers close to 0
#indicate that our factor model is a good representation of the underlying concept.

# Interpretation of factors using varimax rotation
# Varimax

food.fa.varimax <- factanal(food, factors = 2, rotation = "varimax")



plot(food.fa.varimax$loadings[,1], 
     food.fa.varimax$loadings[,2],
     xlab = "Factor 1", 
     ylab = "Factor 2", 
     ylim = c(-1,1),
     xlim = c(-1,1),
     main = "Varimax rotation")

text(food.fa.varimax$loadings[,1]-0.08, 
     food.fa.varimax$loadings[,2]+0.08,
     colnames(food),
     col="blue")
abline(h = 0, v = 0)

# Now comes the tricky aspect in factor analysis: 
#Interpreting the factors themselves. 
#If two variables both have large loadings for the same factor, 
#then we know they have something in common. As a researcher we have to understand the data and its meaning in order to give a name to that common ground. 
#Taking a look on the figures above is appears that factor 1 accounts for pastry, which is dense and can be bend a lot before it breaks. Whereas factor 2 accounts for pastry that crispy and hard to break apart. 
#So if we need to names these factors we would probably call them soft pastry (factor 1) and hard pastry (factor 2)
