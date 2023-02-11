#file = 'http://openmv.net/file/food-texture.csv'
file = '/content/food-texture.csv'
foodData = read.csv(file, header = TRUE, row.names = 1, stringsAsFactors = FALSE)
print(foodData)
     

#dim(foodData)
str(foodData)
typeof(foodData)
#is.na(foodData)
class(foodData)
#nrow(foodData)
#ncol(foodData)

#mean(foodData$Density)
#mean(foodData[['Density']])

#apply(foodData, 2, mean) # mean by row
apply(foodData[c('Oil','Density')], 2, mean)

     
'data.frame':	50 obs. of  5 variables:
 $ Oil     : num  16.5 17.7 16.2 16.7 16.3 19.1 18.4 17.5 15.7 16.4 ...
 $ Density : int  2955 2660 2870 2920 2975 2790 2750 2770 2955 2945 ...
 $ Crispy  : int  10 14 12 10 11 13 13 10 11 11 ...
 $ Fracture: int  23 9 17 31 26 16 17 26 23 24 ...
 $ Hardness: int  97 139 143 95 143 189 114 63 123 132 ...
'list'
'data.frame'
Oil17.202Density2857.6