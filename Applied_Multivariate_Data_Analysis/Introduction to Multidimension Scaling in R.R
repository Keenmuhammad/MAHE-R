#
data(mtcars)
View(mtcars)

# euclidean distance between rows. Default distance in r is euclidean distance.
d= dist(mtcars)
d


# k is the number of dimensions (metric multidimensional scaling)

fit1 = cmdscale(d, eig = TRUE, k=2)  

fit1
# We convert the dimension 1 and 2 into points
# they are converted into x and y coordu
x = fit1$points[,1]
y = fit1$points[,2]


plot(x,y, xlabs = "Coordinate 1", 
     ylab = "Coordiante 2", main = "Metric MDS", type = "n")
text(x,y, labels = row.names(mtcars), cex = .5)

library(MASS)
d= dist(mtcars) 
fit2 = isoMDS(d, k = 2)
fit2
x = fit2$points[,1]
y = fit2$points[,2]

plot(x,y, xlabs = "Coordinate 1", 
     ylab = "Coordiante 2", main = "Nonmetric MDS", type = "n")
text(x,y, labels = row.names(mtcars), cex = .5)
