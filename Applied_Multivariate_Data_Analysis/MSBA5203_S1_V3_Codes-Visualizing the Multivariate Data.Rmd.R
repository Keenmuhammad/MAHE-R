library(MVA)
set.seed(280875)
library(lattice) # for graphics
library(HSAUR2) # for producin tables
library(tools)
data(USairpollution)


str(USairpollution)
?USairpollution
nrow(USairpollution)
################ Scatter plot  ##############################
# labels to be printed on two axes
mlab <- "Manufacturing enterprises with 20 or more workers"
plab <- "Population size (1970 census) in thousands"


#the part left of the tilde defnes the variable to be associated with the ordinate, the part right
#of the tilde is the variable that goes with the abscissa

plot(popul ~ manu, data = USairpollution, xlab = mlab, ylab = plab)

# The resulting scatter plot clearly uncovers the presence of one or more cities
# that ar some way from the remainder (consider as outliers).

# Try to plot scatter plot for different set of variables
# How to labell the outliers
# The Bivariate box plot
outcity <- match(lab <- c("Chicago", "Detroit", 
                          "Cleveland", "Philadelphia"), rownames(USairpollution))
x <- USairpollution[, c("manu", "popul")]
bvbox(x, mtitle = "", xlab = mlab, ylab = plab, col = "red")
text(x$manu[outcity], x$popul[outcity], labels = lab,
     cex = 0.7, pos = c(2, 2, 4, 2, 2))
# This type of plot is useful in indicating the distributional properties of 
# data and in indicating the outliers.
# This plot is based on calculating "robust" measure of location, scale and
# correlation

# This figure shows that Chicago, Philadelphia, Detroit, and Cleveland shoud
# regarded as outliers.
######## Finding correlation ##########

with(USairpollution, cor(manu, popul))

# correlation after removing the outliers
# match identifies row corresponding to the cites##
outcity <- match(c("Chicago", "Detroit", 
                   "Cleveland", "Philadelphia"),
                 rownames(USairpollution))

# - will remove the outliers before computing the correlation 
with(USairpollution, cor(manu[-outcity], popul[-outcity]))


############# convex hull of the data ############

#the part left of the tilde defnes the variable to be associated with the ordinate, the part right
#of the tilde is the variable that goes with the abscissa

hull= with(USairpollution, chull(manu,popul))
hull

with(USairpollution, 
     plot(manu, popul, pch = 1, xlab = mlab, ylab = plab))
with(USairpollution, 
     polygon(manu[hull], popul[hull], density = 15, angle = 30))


########## again calculating correlation #########
with(USairpollution, cor(manu[-hull],popul[-hull]))
# Now this correllation coefficient is higher than previous one after 
# eliminating the outliers.

#########chi plot #########

with(USairpollution, plot(manu, popul, 
                          xlab = mlab, ylab = plab, 
                          cex.lab = 0.9))
 with(USairpollution, chiplot(manu, popul))
# variables are not indipendent.

 #########bubble plot ##########3
# Using bubble plot you can plot more than two variables.
ylim <- with(USairpollution, range(wind)) * c(0.95, 1)
plot(wind ~ temp, data = USairpollution, 
     xlab = "Average annual temperature (Fahrenheit)",
     ylab = "Average annual wind speed (m.p.h.)", pch = 10,
     ylim = ylim)
with(USairpollution, symbols(temp, wind, circles = SO2, 
                             inches = 0.5, add = TRUE))
# here temp and wind are used to from scatterplot  and So2 is used to 
# represented by circle.

#The plot seems to suggest that cities with moderate annual
#temperatures and moderate annual wind speeds tend to suffer the greatest air pollution, but this is unlikely to be the whole story because none of the other
#variables in the data set are used in constructing




##Scatterplot matrix of air pollution data showing linear fit of each pair of variable

#A scatterplot matrix is nothing more than a square, symmetric grid of bivariate scatterplots.
#The grid has q rows and columns, each one corresponding to a different variable.

pairs(USairpollution, pch = ".", cex = 1.5)

# in addition to plotting the x and y values, a regression line obtained via function lm() is added to each
# of the panels. Now the scatterplot matrix reveals that there is a strong linear relationship
# between SO2 and manu and between SO2 and popul, but the (3; 4) panel shows
# that manu and popul are themselves very highly related and thus predictive
# of SO2 in the same way.

pairs(USairpollution, 
      panel = function (x, y, ...) {
        points(x, y, ...)
        abline(lm(y ~ x), col = "grey")
      }, pch = ".", cex = 1.5)
        
########### Three Dimension data ##########
        #install.packages("scatterplot3d")
        library("scatterplot3d")
 with(USairpollution, scatterplot3d(temp, wind, SO2, type = "h",
                           angle = 55))
        
     
       
