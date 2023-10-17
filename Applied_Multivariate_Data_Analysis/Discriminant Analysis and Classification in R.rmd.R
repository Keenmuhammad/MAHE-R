# Data
data("iris")
str(iris)
help(iris)
iris
# scatter plot and correlation #########
library(psych)
pairs.panels(iris[1:4], gap = 0,
             bg= c("steelblue", "forestgreen", "red4")[iris$Species], pch = 21)

# If you look at petal length vs petal width
# Correlation between these two variables is linear and it is also quite high
# If you look at different colors of the specie,
# the black one is quite away and  there is some overlap between two clours red and green
# so the idea here is how to find a combination of these variables which 
# will give the best possible separation between these three species.


####### Data Preparation ###########
library(MASS)
library(klaR)
set.seed(101)

training_sample <- sample(c(TRUE, FALSE), nrow(iris), replace = T, prob = c(0.6,0.4))
train <- iris[training_sample, ]
test <- iris[!training_sample, ]
train
test

######### applying LDA

lda.iris <- lda(Species ~ ., train) # the '.' includes all other variables bar species
lda.iris 

#Based on the training dataset, 38% belongs to setosa group, 31% belongs
#to versicolor groups and 30% belongs to virginica groups.


#Plotting this data using the basicplot function illustrates how the observations are grouped together.
plot(lda.iris, col = as.integer(train$Species))

##As you can see, there are three distinct groups with some
#overlap between virginica and versicolor. Plotting again, 
#but adding the code dimen = 1 will only plot in one dimension (LD1). 
#Think of it as a projection of the data onto LD1 with a histogram of that data.
plot(lda.iris,dimen = 1, type = 'b' )

#LDA Predictions
lda.train <- predict(lda.iris)
train$lda <- lda.train$class
table(train$lda,train$Species)

# The table output is a confusion matrix with the actual species as the row labels and the predicted species at the column labels.

##########################
#Now let’s run our test set against this model to 
#determine its accuracy.

lda.test <- predict(lda.iris,test)
test$lda <- lda.test$class
table(test$lda,test$Species)

########## Applying QDA
qda.iris <- qda(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, train)
qda.iris

#QDA Predictions
qda.train <- predict(qda.iris)
train$qda <- qda.train$class
table(train$qda,train$Species)

#Next we’ll generate the same confusion matrix with the test data.
qda.test <- predict(qda.iris,test)
test$qda <- qda.test$class
table(test$qda,test$Species)

