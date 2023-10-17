# Cluster Analysis
library("readxl")
mydata <- read_excel("utilities.xlsx")
View(mydata)

str(mydata)
head(mydata)
ncol(mydata)
nrow(mydata)
pairs(mydata[2:9]) # scatter matrix, the number is the index we avoid plotting the first column that contains names


# Scatter plot 
plot(mydata$Fuel_Cost~ mydata$Sales, data = mydata)
with(mydata,text(mydata$Fuel_Cost ~ mydata$Sales, labels=mydata$Company,pos=4, cex= 0.4))

# Normalize is important 
z <- mydata[,-c(1,1)] # remove the first column
means <- apply(z,2,mean) # calculate mean for each column, 2 represent mean

sds <- apply(z,2,sd)
nor <- scale(z,center=means,scale=sds) # scale is to normalize
View(nor)

# Calculate distance matrix  
distance = dist(nor)
print(distance, digits = 3)


mydata[c(10,13),]


# Hierarchical agglomerative clustering  
mydata.hclust = hclust(distance)
plot(mydata.hclust)
plot(mydata.hclust,labels=mydata$Company,main='Default from hclust')
plot(mydata.hclust,hang=-1)

# Hierarchical agglomerative clustering using "average" linkage 
mydata.hclust<-hclust(distance,method="average")
plot(mydata.hclust,hang=-1)
rect.hclust(mydata.hclust, k = 3)


# Cluster membership
member = cutree(mydata.hclust,3)
member
table(member)


# Silhouette Plot
library(cluster) 
plot(silhouette(cutree(mydata.hclust,3), distance)) 
# Based on the above plot, if any bar comes as negative side then we can conclude particular data is an outlier can remove from our analysis



# Scree Plot
wss <- (nrow(nor)-1)*sum(apply(nor,2,var))
for (i in 2:20) wss[i] <- sum(kmeans(nor, centers=i)$withinss)
plot(1:20, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares") 
# Scree plot will allow us to see the variabilities in clusters, suppose if we increase the number of clusters within-group sum of squares will come down.

# So in this data ideal number of clusters should be 3, 4, or 5.


# K-means clustering
# predefined number of clusters

set.seed(123)
kc<-kmeans(nor,4)
kc
kc$cluster


