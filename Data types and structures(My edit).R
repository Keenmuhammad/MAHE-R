Everything in R is an object


# Create an R object
my_obj = 48
     
Basic data types in R:

Character
Numeric (real or decimal)
Integer
Logical
Complex

# Create objects of simple data types
my_char = 'a'
print(my_char)

my_int = 10L
print(my_int)

my_numeric = 10
print(my_numeric)

my_logic = TRUE
print(my_logic)
     
[1] "a"
[1] 10
[1] 10
[1] TRUE
Data structures in R:

Atomic vector
List
Matrix
Data frame
Factor
We will look at atomic vectors, also referred simply to as vectors, first. A vector is a collection of objects of the same data type.


# Create a vector
# my_vec1 = c(1L, 2L, 3L) # 1st way to specify vec (c here is a function)
# my_vec2 = 1:3 # 2nd way to specify vec (however, note this are not integers but numeric values)
# my_vec3 = seq(from = 1, to = 3, by = 1) # 3rd way to specify a vec (seq here is a function, sequencial)
# print(my_vec1)
# print(my_vec2)
# print(my_vec3)

# Functions on objects
# length(my_vec1) # will show length of vec
# class(my_vec1) #tells you the kind of data
# class(my_vec2)
# class(my_vec3)
# typeof(my_vec3)
# str(my_vec3) # tells you the structure of the data

# Access elements of a vector
# my_vec1[1] # will let you access the first element of the vector

# Modify element of a vector
# my_vec1[1] = 10
# print(my_vec1) #will modify the first element of the vector

# Missing data
# my_vec4 = c(1, 2, NA, 4) #lets you accomodate missing data
# print(my_vec4)
# is.na(my_vec4) # is asking if there is any missing value in the vector
# anyNA(my_vec4) # this will be true if there is at least 1 missing value in the vec

# Special values
1/0 # this will print inf which means infinity
0/0 # will print NaN which means not a number

     
[1] 1 2 3
Inf
NaN
A list is a special type of a vector which can contain objects of possibly different data types.


# Create an empty list
my_list1 = list(5) # creates list with the object 5 in it
print(my_list1)

# Create a list with values
my_list2 = list(1, 'Name', c('a', 'b', 'c')) # name here is string, which is collection of characters inclosed in single qoutes
print(my_list2)

# Assign names to slots of list
names(my_list2) = c('first', 'second', 'third') # assigns names to the slots
str(my_list2) # prints the structure

# Coerce a vector into a list
     
[[1]]
[1] 5

[[1]]
[1] 1

[[2]]
[1] "Name"

[[3]]
[1] "a" "b" "c"

List of 3
 $ first : num 1
 $ second: chr "Name"
 $ third : chr [1:3] "a" "b" "c"
Accessing and modifying elements of a list


# Access elements of a list
my_list2[1] # Accesss the first element
my_list2$first # Accesss the first element using name

# Modify elements of a list
my_list2[1] = 10 # Modifies the first element
print(my_list2)
     
$first = 1
1
$first
[1] 10

$second
[1] "Name"

$third
[1] "a" "b" "c"

A matrix is an atomic vector with one or two dimesions.


# Create a matrix
my_matrix1 = matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2) # prints a matrix of 3 rows and 2 colums of the vector
print(my_matrix1)

my_matrix2 = matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE) # forces R to arrange base on command
print(my_matrix2)

# Assign row and column names
rownames(my_matrix2) = c('row1', 'row2') # asigns row names
colnames(my_matrix2) = c('col1', 'col2', 'col3') # asigns column names
str(my_matrix2)   # prints the structure

# Access elements of a matrix
my_matrix2[1, 2] # Accesses first raw second column of the matrix
     
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
 num [1:2, 1:3] 1 4 2 5 3 6
 - attr(*, "dimnames")=List of 2
  ..$ : chr [1:2] "row1" "row2"
  ..$ : chr [1:3] "col1" "col2" "col3"
2
A data frame is a list of lists with each sublist of same length; think of it as a rectangular list. A data frame is typically used to store data that are read from text/CSV files by retaining the underlying structure such as row names, column names etc. A data frame can also be created manually.


# Create a dataframe manually (ID, Age and Height are the columns)
ID = c('A', 'B', 'C')
Age = c(21, 22, 20)
Height = c(150, 160, 170)
sData = data.frame(ID, Age, Height) # sData means student data, data.frame is the function that creates data frame, data is arrangged in columns as given

# Assign names to the rows and columns of the data frame
rownames(sData) = c('Ajith', 'John', 'Bob')
colnames(sData) = c('ID', 'Age', 'Height')
     
In-built functions on data frame


# Structure of the data frame
str(sData) 

# Print 1st five rows
head(sData, 2)

# Print last five rows
tail(sData, 2)

# Get the dimension of the data frame
dim(sData)

# Number of rows in the data frame
nrow(sData)

# Number of columns in the data frame
ncol(sData)
     
'data.frame':	3 obs. of  3 variables:
 $ ID    : chr  "A" "B" "C"
 $ Age   : num  21 22 20
 $ Height: num  150 160 170
A data.frame: 2 × 3
ID	Age	Height
<chr>	<dbl>	<dbl>
Ajith	A	21	150
John	B	22	160
A data.frame: 2 × 3
ID	Age	Height
<chr>	<dbl>	<dbl>
John	B	22	160
Bob	C	20	170
3
3
3
3
Accessing elements of a data frame


# Access a particular column
sData$Age
sData[['Age']]
sData['Age']

# Access a particular row
sData['John', ]

# Access multiple columns
sData[c('ID', 'Age')]
     
21
22
20
21
22
20
A data.frame: 3 × 1
Age
<dbl>
Ajith	21
John	22
Bob	20
A data.frame: 1 × 3
ID	Age	Height
<chr>	<dbl>	<dbl>
John	B	22	160
A data.frame: 3 × 2
ID	Age
<chr>	<dbl>
Ajith	A	21
John	B	22
Bob	C	20
A factor is a vector that can contain only predefined values, and is used to store categorical data.


# Create a factor for storing a list of genders
gender = factor(c('Male', 'Male', 'Female', 'Female'))
print(gender)

# In-built functions on factors
levels(gender)

# Modify a gender
gender[1] = 'Female'
print(gender)
     
[1] Male   Male   Female Female
Levels: Female Male
'Female'
'Male'
[1] Female Male   Female Female
Levels: Female Male