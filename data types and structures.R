DATA TYPES AND STRUCTURES


#EVERYTHING IN R IS AN OBJECT

#Creating an object

my_obj =48
print(my_obj);

my_age = 28
print(my_age);

     
[1] 48
[1] 28

#Create Objects of simple data types

my_char = "m"
print(my_char)

my_int = 1000L
print(my_int)

my_num = 100
print(my_num);

my_logic = TRUE
print(my_logic)
     
[1] "m"
[1] 1000
[1] 100
[1] TRUE

# Data Structures (Vector, list, matrix, data frame, factor)
#creating a vector
#my_vec1 = c(1L, 7L, 20L)
#my_vec2 = 1:10
#my_vec3 = seq(from = 1, to = 20, by = 4)
#print(my_vec1)
#print(my_vec2)
#print(my_vec3)

##functions on objects
#length(my_vec2)
#class(my_vec3)
#typeof(my_vec1)
#str(my_vec2)

#my_vec2[7]
#my_vec2[1] = 0

my_vec4 = c(1, 2, NA, NA, 5)
is.na(my_vec4)
anyNA(my_vec4)
print(my_vec4)
#special numbers
1/0 
0/0
     
FALSE
FALSE
TRUE
TRUE
FALSE
TRUE
[1]  1  2 NA NA  5
Inf
NaN

#Creating list
#my_list = list(100)
#print(my_list)
my_list1 = list(1, NULL, 'Name', c('a', 'b', 'c'), 'Age', 'Address')
#names(my_list1) = c('first', 'second', 'third', 'fourth', 'fifth', 'sixth')
#print(my_list1)
#class(my_list1)
#str(my_list1)
#typeof(my_list1)
#length(my_list1)
#my_list1[1] =100
#my_list1[1]
#print(my_list1)
     

#matrix-> an atomic vector with one or two dimention
#moh = matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, ncol = 2)
#print(moh)
#moh1 = matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3, byrow = TRUE)
#print(moh1)
#str(moh)
#typeof(moh1)
#class(moh1)
#length(moh1)
moh1[1, 3] = 100
moh1[1, 3]
#rownames(moh) = c('one', 'two', 'three')
#colnames(moh) = c('daya', 'biyu')
print(moh1)
     
100
     [,1] [,2] [,3]
[1,]    1    2  100
[2,]    4    5    6

ID = c('A', 'B', 'C')
AGE = c(21, 25, 28)
HEIGHT = c(170, 180, 185)
INCOME =c(1000, 2000, 1500)
sData = data.frame(ID, AGE, HEIGHT, INCOME)
rownames(sData) = c('Muhammad', 'Musa', 'Naruto')
#class(sData)
#print(sData)
#tail(sData, 1)
#head(sData, 2)
#dim(sData)
#nrow(sData)
#ncol(sData)
#sData[['AGE']]
#sData['AGE']
#Data$AGE
#sDatac('Muhammad', ]
sData[c(3,1), ]
sData['AGE']
sData[c('AGE', 'INCOME')]
     
A data.frame: 2 × 4
ID	AGE	HEIGHT	INCOME
<chr>	<dbl>	<dbl>	<dbl>
Naruto	C	28	185	1500
Muhammad	A	21	170	1000
A data.frame: 3 × 1
AGE
<dbl>
Muhammad	21
Musa	25
Naruto	28
A data.frame: 3 × 2
AGE	INCOME
<dbl>	<dbl>
Muhammad	21	1000
Musa	25	2000
Naruto	28	1500
A factor is a vector that can contain only predefined values, and is used to store categorical data.


#gender = factor(c('male', 'female', 'transgender'))


#levels(gender)
gender[3] = 'male'
print(gender)
typeof(gender)
str(gender)
class(gender)
length(gender)

     
[1] male   female male  
Levels: female male transgender
'integer'
 Factor w/ 3 levels "female","male",..: 2 1 2
'factor'
3