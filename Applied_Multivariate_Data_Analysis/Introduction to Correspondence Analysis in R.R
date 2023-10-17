#install.packages("ca")
library(ca)
data(smoke)
View(smoke)
mosaicplot(smoke, col= c(2,3,4,5))
`# entire data can be converted into two dimensions plot
plot(ca(smoke))
#########
# we can also chage these points based on mass
#Mass for rows and coloumn represented by the size of the ponts symbol
# adding one more argument
plot(ca(smoke), mass = c(TRUE, TRUE))

##chi-square test of independence

#H0: the rows and column of contingency tables are independent
#H1: the rows and column of contingency tables are not independent

chisq.test(smoke)
fit1 = ca(smoke)
fit1
summary(fit1)

# p value > 0.05 we fail to reject the null hypothesis
#install.packages("FactoMineR")
#install.packages("factoextra")
library(FactoMineR)
library(factoextra)

eig = get_eig(fit1)
eig


# trace statistics
trace = sum(eig$eigenvalue)
trace
# correlation coefficient is the square root of trace statistics
cor.coef = sqrt(trace)
cor.coef

fviz_screeplot(fit1)
fviz_screeplot(fit1) + geom_hline(yintercept = 33.33, linetype = 2,
                               color = "red")

row = get_ca_row(fit1)
row

library(corrplot)
corrplot(row$contrib, is.corr = FALSE)
fviz_contrib(fit1, choice = "row", axes =  1)
fviz_contrib(fit1, choice = "row", axes =  2)
fviz_contrib(fit1, choice = "row", axes =  3)

plot(fit1, map = "rowprincipal")
plot(fit1, map = "colprincipal")
plot(fit1, mass = TRUE, contrib = "absolute", map = "rowgreen", arrows= c(FALSE, TRUE))

# The length of this arrow talks about eigen value
# the category which has the largest eigen value contributing maximum in explaining the variances
