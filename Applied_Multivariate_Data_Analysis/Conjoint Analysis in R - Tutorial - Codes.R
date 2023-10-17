#data("swiss")
#data("eurodist")
#print(eurodist)
install.packages("xlsx")
library(xlsx)
# Import the data

myconjdata = read.csv("conjoint-r.csv", header=T)
myconjprofilematrix = read.csv("conjoint-r-profiles-matrix.csv", header = T)
myconjlevel = read.csv("conjoint-r-level-names.csv", header = T)

# Install the packages
#install.packages("conjoint")

library(conjoint)

# model some of our data
caUtilities( y=myconjdata[1,], x=myconjprofilematrix, z=myconjlevel)

# model all of our data
caUtilities( y=myconjdata, x=myconjprofilematrix, z=myconjlevel)
