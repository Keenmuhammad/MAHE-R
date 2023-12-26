#Example 1: US air passenger
data("AirPassengers")
AP = AirPassengers
AP
class(AP)
start(AP)
end(AP)
frequency(AP)
summary(AP)
#plot the data
plot(AP,ylab = "Passengers(1000's)")
layout(1:2)
plot(aggregate(AP))
boxplot(AP~cycle(AP))
#example 2: unemployment: Maine
Maine
class(Maine)
Maine.months.ts = ts(Maine,start = c(1996,1),frequency = 12)
Maine.months.ts
class(Maine.months.ts)
Maine.annual.ts = aggregate(Maine.months.ts)/12
layout(1:2)
plot(Maine.months.ts, ylab= "unemployed(%)")
plot(Maine.annual.ts, ylab="unemployed(%)")
#extract the time series
Maine.Feb = window(Maine.months.ts,start = c(1996,2),freq = TRUE)
Maine.Aug = window(Maine.months.ts, start = c(1996,8),freq = TRUE)
Feb.ratio = mean(Maine.Feb)/mean(Maine.months.ts)
Aug.ratio = mean(Maine.Aug)/mean(Maine.months.ts)
Feb.ratio
Aug.ratio
# Example 3: Electricity, beer and chocolate data
View(cbe)
cbe[1:4,]
class(cbe)
#create a time series object
Elec.ts = ts(cbe[,3],start = 1958,frequency = 12)
Beer.ts = ts(cbe[,2], start =1958, frequency = 12)
Choc.ts = ts(cbe[,1], start = 1958, frequency = 12)
#plot with cbind to plot several series in one figure
plot(cbind(Elec.ts,Beer.ts,Choc.ts))
# intersection between air passenger and electricity data
Ap.elec = ts.intersect(AP,Elec.ts)
start(Ap.elec)
end(Ap.elec)
Ap.elec[1:3,]
NewAP = Ap.elec[,1]
Elec = Ap.elec[,2]
layout(1:2)
plot(NewAP, ylab = "air passengers/1000's")
plot(Elec, ylab = "electricity/Kwh")

plot(as.vector(NewAP),as.vector(Elec),xlab = "air passengers in 1000's",
     ylab = "electricity production/kwh")
abline(reg = lm(Elec~NewAP))

cor(NewAP,Elec)
