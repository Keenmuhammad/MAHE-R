#install.packages("zoo")
library(zoo)

#Assigning year data
Year<-1941:1990;Year


#Assigning sales data
Sales<-c(80,85,81,89,99,93,83,89,80,101,81,94,96,92,104, 
         + 110,98,96,90,114,83,89,105,108,110,109,99,97,96,90,111, 
         + 119,97,92,89,100,120,104,102,123,110,105,145,132,130,128, 
         + 150,142,131,196);Sales


length(Sales)

#Computing the moving averages of period 5
# using rollmean function

MovAvgO = rollmean(x=Sales, k=5) 

print(MovAvgO)

length(MovAvgO)


#Computing moving averages of period 4
MAvg_even<-rollmean(x=Sales, k=4);MAvg_even 

print(MAvg_even)

length(MAvg_even)

# Note: To compute the centered moving averages, we should use the 
#rollmean() function twice.

#Computing the centered moving averages
MovAvgE1= rollmean(x=MAvg_even, k=2)

print(MovAvgE1)

length(MovAvgE1)



# Plotting Moving Average

plot(Year,Sales, type='l',lty=1, col='black', lwd=2, 
     xlab='Year', ylab='Sale', main='Moving average method') 
lines(Year[3:48],MovAvgO,lty=2, col='blue', lwd=2) 
lines(Year[3:48],MovAvgE1,lty=3, col='red', lwd=2) 
legend('topleft', lty=1:4, col=c('black','blue','red'), 
       legend=c('Sales','m=5','m=4')) 

