#Taking help on austres data
help(austres)
library(datasets)
austres
#Extracting the data for fitting a linear trend
yt = ts(austres,frequency = 4,start = c(1975,1),end = c(1985,4))
yt
class(yt)
#Computing the length of yt
n = length(yt)
n
#creating xt
xt = 1:n
xt
#creating the A matrix
A = matrix(c(n,sum(xt), sum(xt),sum(xt^2)),ncol = 2)
A
#creating the matrix C
C = matrix(c(sum(yt), sum(xt*yt)),ncol = 1)
C
#computing the estimates
B = solve(A)%*%C
B
#Extracting the estimates of b0 and b1
B[1]
B[2]
#computing projected values for year 1986
B[1]+B[2]*(45:48)
#Computing fitted values
Fittyt = B[1]+B[2]*xt
Fittyt
#plotting the actual values with the fitted values
plot(xt,yt, type = 'o',pch=16,col='black', lwd=2,
     main = 'Fitting of linear trend')
lines(xt,Fittyt, type = 'o', pch=17, col='blue',lwd=2)
legend('bottomright',
       pch = c(16,17), lty=c(1,1),
       col=c('black','blue'),legend = c('Original','Fitted'))
# using the lm function
#Fitting linear trend to the data
lm(formula = yt~xt)
#Extracting the estimates
lm(yt~xt)[['coefficients']]
lm(yt~xt)[['fitted.values']]
#Problem 2:
# assigning the data
t = seq(1911,1991,10)
t
#computing n
n = length(t)
n
#shifting the origin and scale
xt = (t-1951)/10;xt
#Assigning population data
yt = c(362,361,388,428,471,549,657,660,781);yt
#Fitting quadratic trend to the data
lm(yt~xt+I(xt^2))
#Extracting the estimates
lm(yt~xt+I(xt^2))[['coefficients']]
#computing the fitted values
fittyt=lm(yt~xt+I(xt^2))[['fitted.values']]
fittyt
#changing the origin and scale 2001
pxt = (2001-1951)/10;pxt
#Projecting the population for 2001
p = 483.0866+(53.86667*pxt)+(5.15368*pxt^2)
p
#plotting the actual values with the fitted values
plot(t,yt,type='l', lty=1, col='black',xlim=c(1911,1991),
     lwd=2,main = 'Fitting of quadratic trend')
lines(t,fittyt, type = 'l',lty=2, col='red', lwd=2)
legend('bottomright', lty=c(1,2),
       col = c('black','red'),c('original','fitted'))
