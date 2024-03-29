---
title: "Control Flow practice"
output: html_notebook
---

```{r}
# logical expressions-1: relational operators
x = 5
x > 4
y = 10
y < 9
y == 10
```
```{r}
# logical expressions-2: logical operators
# l1 = c(TRUE, FALSE, FALSE, TRUE)
# l2 = c (TRUE, TRUE, FALSE, FALSE)
#Logical AND (Short form): checks if the elements in l1 & 2 corresponds
# l1 & l2
#Logical OR (short form): checks if atleast 1 elements in l1 & 2 corresponds with true
# l1 | l2
#Logical NOT:
# !(l1)
#Logical AND (long form, used in if statements): checks if the elements in l1 & 2 corresponds (1St el only)
l1 && l2
l1||l2
```

```{r}
# Logical expression -3: Value matching
names = c('Arjith', 'priya', 'Akash' )
"Arjith" %in% names
"Musa" %in% names
!("Arjith" %in% names)
```
```{r}
#special functions all(), any(, isTRUE(), isFALSE()
# all(l1)
# any(l1)
# a = c(1, 2, NA)
# a > 0
# any(a > 0)
# all(a > 0)
# isTRUE(all(a > 0))
# isFALSE(all(a > 0))
b = 1:10
c = (b^(1/3))^3
print(b)
print(c)
b == c
all.equal(b, c)
```
```{r}
#If statement
# x = 10
# x %% 3 #%% gives remainder after divition.
if (x %% 3 == 1) {
  print('Odd')
} else{
    print('even')
  }
```
```{r}
# x = 100
# if (x %% 2 > 0) {
#   print('positive')
# } else if (x %% 2 < 0) {
#     print('negative')
# } else{ print('zero')
#     
# }
y = 28
if (y > 0) {
  print('positive')
} else if (y < 0) {
    print('negative')
} else{ print('zero')
    
  }
```
```{r}
# Vectirized if statement
m = c(1:10)
print(m)
ifelse(m %% 2 == 0, 'even', 'odd')
```
```{r}
# for statement
a = c(1:10)
for (val in a) {
  b = a^2
  print(b)
}
```
```{r}
# a = c(1:10)
# for (i in 1:length(a)) {
#   b[i] = a[i]^2
#   print(b[i])
# }
# participants = c('Arjith', 'Priya', 'Akash')
# for (names in participants){
#   print(names)
# }
x = c(1:10)
for (val in x) {
  print(val)
}
```
```{r}
# while statement: runif generates uniform random variable
x = 1
while (x > 0.3) {
  x = runif(1)
  print(x)
} 
```