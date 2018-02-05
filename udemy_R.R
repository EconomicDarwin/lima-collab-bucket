# Intro -------------------------------------------------------------------

a=1
b=2
c=3


# Code -> Indent could be useful

# Ctrl + Shift + C - comments out lines

# Session -> Restart R

# Tools -> Global Tools




# CHAP1 - Math -------------------------------------------------------------

1 + 1
1 + 2 /3*4
sqrt(25)
log(100) # natural log
log10(100)# have to specify different base
3 ^3
3^9
pi
pi * 3
round(pi * 3)
# ceiling - round to closest, higher integer
ceiling(pi * 3)
floor(pi * 3) # nearest lower integer

# How to find Quotient and Remainder
25 / 6
# Quotient
25 %/% 6
# Remainder
125 / 6
125 %% 6


# Challenge
# Square Root of 729
# Remainder of 109/25

sqrt(729)
109 %% 25


# CHAP1 - Datatypes --------------------------------------------------------

# numeric
# integer
# character
# factor
# logical

# 1 AND 2.  NUMBER AND INTEGER

# the difference between numeric and integer datatypes
# numeric (default) will contain numbers with fractions or decimal points
a <- 1
# use class() to identify data type
class(a)
# to specify a different data type...
# example , as an integer

b <- as.integer(a)
class(b)

# example 2
a <- 1.6
as.integer(a) -> b
b
class(b)

# 3.  CHARACTER

# anything enclosed in quotes will be stored as a character
"abc" -> d
d
class(d)
# single quotes also work, no difference
'12345' -> d
class(d)

# of note in character datatypes
# capitalization matters:
# lowercase 'a' and uppercase 'A' are different

# ls() - to see all variables
ls()
ls() -> e
class(e)
#^character
a
b

# 4. FACTORS

#  What are factors?
# qualitative variables like good vs bad...
# how to create

f <- c("male", "female","male", "female","male", "female")
f_factor <- factor(f)
levels(f_factor)
str(f_factor)
# other way of doing it
f_factor2 <- factor(f, levels = c("male", "female"))
str(f_factor2)
# change names
factor(f,
       levels = c("male", "female"),
       labels = c("dudes", "chicks"))
# nominal vs. ordinal
# example
tshirt <- c("M", "L", "S", "S", "L", "M", "L","M")
tshirt_factor <- factor(tshirt, ordered = TRUE,
                        levels = c("S", "M", "L"))
tshirt_factor[1] < tshirt_factor[2]


# 5. LOGICAL

g <- TRUE
class(g)

h <- "TRUE"
class(h)

#######CHALLENGE#######

f1 <- factor(c("good", "bad", "ugly", "good", "bad", "ugly"))
# or
challenge <- c("GOOD", "BAD", "UGLY", "GOOD", "BAD", "UGLY")
challenge_factor <- factor(challenge, ordered = TRUE,
                           levels = c("GOOD", "BAD", "UGLY"))
challenge_factor[1]<challenge_factor[2]



# CHAP2 - VECTORS ------------------------------------------------------
# C() - accepts multiple arguments and combines them to form a vector

a1 <- c(10, 20, 25, 10 ,25)
length(a1)
# to grab specific values from your vector
a1[3] # grab the third element
a1[4:5] # grab the fourth and fifth element respectively
a1[3:5] # grab the third THROUGH the fifth
# if you want only the third and the fifth you have to enlose in c
a1[c(3, 5)]
# because a1 is a (one-dimensional) vector
# it is like passing 2 arguments in a vector when it can only accept 1

# Character Vectors

a2 <- c("a", "b", "c", "d", "e")
a2[1:4]
class(a2)

# A vector with both numbers and characters
a3 <- c(1, 2, "a")
# Cannot convert "a" into a number but can convert '1' into a character
a3

#######CHALLENGE#######

ab[c(1, 18)]



# CHAP2 - DIRECTORY AND MISC ----------------------------------------------


# Working Directory

a <- 12
b <- 10
c <- a + b
d <- a + c
e <- c + d

basicDir <- "/Users/micha/OneDrive/Rdir"

setwd(basicDir)

getwd()

dir("/Users/micha/OneDrive")

list.files("/Users/micha/OneDrive")

# Create file, best way to specify path first

fpath <- file.path("/Users/micha/OneDrive", "myfile.txt")
file.create(fpath)

# Save and load working environment

save.image("myImage.RData")
getwd()

# Clear your workspace
rm(list=ls())
ls()

load("myImage.RData")

# To save a specific item
# for example, the value of the variable "c"

save('c', file="c.RData")

#######CHALLENGE#######

dir.create("/Users/micha/OneDrive/challenge")
fpath1 <- file.path("/Users/micha/OneDrive/challenge", "myfile.txt")
file.create(fpath1)
z <- (a1 * 5)

save('z', file="z.RData")

save.image("myImage.RData")

rm(list=ls())
ls()

load("myImage.RData")



# CHAP2 - VECTOR SEQUENCING -----------------------------------------------

1:10 -> a

10:1 -> a1

# just odd

seq(1, 20, by=2)
# ^ notice that it leaves out 20
# for even
seq(0, 20, by=2)

seq(1, length=50, by=0.5) -> a3

# the the c() function to combine vectors
a4 <- c(a1, a3)

# How to create Repititions?

rep(1, 5)
rep(1:2, 10)
rep(c(1, 3, 2), each=3)
rep(1:3, each=4, times=2)
#next one important to understand
rep(1:4, 1:4)
# ans: 1 once, 2 twice...etc
rep(c("a", "b", "c"), 1:3)
# makes sense...

#######CHALLENGE#######
# Recreate the vector using what we learned

# 1, 1, 1, 2, 2, 3, 4, 4, 4, 4

rep(1:4, times=c(3, 2, 1, 4))




# CHAP 2 - PRACTICE EXERCISE ----------------------------------------------

rep(seq(1, 10, by=2), each=3, times=2) -> fasterTHANhim
# CRUSHED IT



# CHAP 2 - CREATING RANDOM NUMBERS ----------------------------------------

# in what situation are random numbers used?

# we need to pick 10 of 100 balls randomly...
# we need to generate the indexes of these 10 balls to be a random numer

# syntax is runif(n, min, max)
# Creates 'n' random numbers between the range 'min' nad 'max'.
# The default value of 'min' and 'max' is 0 and 1 respectively

runif(10)
runif(10, min=1, max=100)
runif(10, 1, 100) # same as top

# How to reproduce the same set of random numbers
# use set.seed(n) to reproduce the same set of random numbers

set.seed(100)

# try
runif(10)
runif(10)
# two different sets of numbers

# now go
set.seed(100) #then
runif(10)
# original numbers

# How to control the digits after the decimal

options(digits=2)
runif(10)

# To explore options function type "options()
options()
# note that $digits = 2 because we have changed it
# by default, $digits = 7


#######CHALLENGE#######


set.seed(100)
round(runif(10, 1, 26)) -> i
letters[i]



# CHAP 2 - MISSING VALUES AND ATTRIBUTES ----------------------------------

a <- c(1,2,3,4,5,1,2,3,4,5)

NA
class(NA)

a[10] <- NA

# is.na() - used to filter out missing values from a vector
is.na(a)

# why useful?
a[is.na(a)] # removes NAs from a

# also useful, the negation of is.na() by including !
!is.na(a) # ! - all FALSES become TRUE and TRUES become FALSES
# then
a[is.na(a)] # commom method for pulling non-missing values from a vector
# you can also use na.omit(a) - removes all NAs from 'vec'
na.omit(a)

# what are attributes?
# 

c(1,2,3,4,5,1,2,3,4,5) -> a

a[10] <- NA

# Filter out all of the missing values from a

is.na(a) #takes a vector as an argument

# with each position in a it throws out a logical value whether that value in a is missing or not

a[is.na(a)] # returns all the true values of that vector

# the negation of is.na...

!is.na(a)   # ...returns all of TRUES as FALSES and FALSES as TRUES

# then if you pass that argument inside of brackets...

a[!is.na(a)]

# only returns the non-missing values

na.omit(a)
#....gives us the same results, just with a few attributes.  We don't need the attributes but they won't do any hard.


#  WHAT ARE ATTRIBUTES

#  For any variable in R, in addition to the actual value of the variable, we can store some additional information in that variable object itself.

b <- na.omit(a)

a == 1 #returns a true and false whenever that specific value of a is equal to 1

a[a == 1] #returns all the 1s--- NA will appear no matter what because it is neither a TRUE nor a FALSE

a[!a==1] #returns everything except the 1s

a %in% c(1,3)  #returns mulitple values from a specific vector as TRUE or FALSE

# MINI CHALLENGE
# Remove all the even numbers and the missing valuse from 'a'

b <- a[!is.na(a)]


a[a %in% c(1,3)] #returns all of the 1s and 3s in vector a

#advantage of using %in% is it takes care of all of the NAs




# Section 3 Lecture 12 --------------- Getting Specific Items Using Which ---------------


a<- c(1:10)

min(a)
max(a)
mean(a)
median(a)
a[-c(5,6)]
 
a <- c(100:110)

a[which(a > 105)]

which(a> 107 | a < 104)
which (a > 105)
a

# Challenge: From 'a' get:
# 1 All even numbers
# 2 All multiples of 5

a[which(a%%2 == 0 | a%%5 == 0)]

a[which(a%%2 == 0 & a%%5 == 0)]


# Section 3 Lecture 13 ------------------------ Convert Variable Types ---------------

vec1 <- 1:10
vec2 <- letters[1:10]
vec3 <- factor(1:10)
class(vec1)
class(vec2)
class(vec3)

# integer to numeric
vec4 <- as.numeric(vec1)
class(vec4)
vec5 <- as.character((vec1))
class(vec5)
vec5

# mix multiple data types into same vector
vec6 <- c(2, "d")
vec6
class(vec6)
vec7 <- c(2, TRUE)
vec7
class(vec7)
vec7 <- c(2, FALSE)

# IMPORTANT TO KNOW
# CHARACTER > NUMERIC > LOGICAL

# Issue when you true to convert factor to numeric


# MINI CHALLENGE

v1 <- factor(round(runif(10,0, 100)))
v2 <- as.numeric(as.character(v1))
v1 == v2

# Section 4 Lecture 14 -------------------------- Lists ---------------------

# Limitation of vectors is that it can only store one data type
# Lists are the solution to that

rm(list=ls(all=TRUE))

# Intro to lists

vec1 <- 1:3
vec2 <- letters[1:3]
vec3 <- factor(1:3)

list(vec1, vec2, vec3) -> l1

l1[1]
l1[[1]]

l1[[2]][3]
names(l1) <- c("one", "two", "three")
l1
l1[[1]]
l1$one
l1$two
l1$three
unlist(l1)


#  MINI CHALLENGE

vec1 <- c(1:3)
vec2 <- c("a", "b", "c")
vec2
l2 <- list(vec1, vec2)
names(l2) <- c("one", "two")
l2[[2]][3]
l2$two[3]

# Section 4 Lecture 15 --------------- Set of Operations ---------------------

rm(list=ls(all=TRUE))

# Suppose we have 2 vectors that overlap

a<- c(1:6)
b<- c(5:10)

1 %in% a
10 %in% a
# these do the same thing
a %in% b
is.element(a, b)
union(a, b)
intersect(a, b)
setdiff(a, b)
unique(c(a, b))
setdiff(b, a)
# MINI CHALLENGE
# Get the non-repeating elements between a and b

a <- c(11:15)
b<- c(13:17)

union(a, b) -> u #create a vector of a and b together
intersect(a, b) -> i #create a vector of what overlaps between a and b
setdiff(u, i) #remove the overlapping vector from the united vector


# Section 4 Lecture 16 -------------- Random Sampling, Sorting, Help Page ---------------------

a <- c(1:60)
sample(a)
sample((a))
set.seed(100)
# sample with replacement
sample(a, replace=T) # some elements will repeat

# a has 50 elements, i just want to sample 10, with replacement
sample(a, 10, replace=)

# IMPORTANT - if you want to know the specific arguments of a function
args(sample)

sample(c(1:2), 20, replace=T, prob=c(0.2, 0.8))
?sample

b <- sample(a, 10, replace = T)
b
sort(b)
args(sort)
c <- sort(b, decreasing = T)
c1 <- rev(sort(b))
?rev
c1
c
c == c1

# another interesting way to do sorting
order(b)
b[order(b)]
b
# what does order do?
order(b) # gives un the indicis of the lowest to highest values
b[order(b)] # output in ascending order
b[order(-b)] # output in descending order


# MINI CHALLENGE
# CREATE A 20% SAMPLE WITH RELACEMENT OF a

rm(list=ls(all=TRUE))

a <- c(1:round(runif(1, min=100, max=150)))
a
length(a)

b <- sample(a, 0.2*length(a), replace=T)
b[order(-b)]

# Section 4 Lecture 17 ------------- Special Ways to Check Conditions ---------------------

# Conditional Issue, we have a person that we want to check if they can vote
# if they are 18+, they can, if they are under 18, they cannot

robs_age <- 31

if(robs_age >= 18){
  print("Allow to vote")
} else {
  print("Don't Vote")
}

# Rob was one person, that was easy
# Check the condition(s) for a group

group1 <- round(runif(30, 10, 40))
group1

# we have a group, now for the condition
# if any one member within the group is less than 13 than don't allow anyone in the group to vote
# any() vs all()
any(group1 > 10)
all(group1 >=10)

if(all(group1 <=13)){
print("Allow to vote")
} else {
  print("Don't Vote")
}

# ifelse() - test, iftrue, iffalse
args(ifelse)

output <- ifelse(group1 > 15, "Allow to Vote", "Don't Vote")

rm(list=ls(all=TRUE))

# big difference between if, else and ifelse
# if, else - you can add more than 2 "elses"

heights <- round(runif(20, 1, 6))
heights

output <- ifelse(heights > 3, "Free", "Paid")
output

# Section 4 Lecture 18 ----------------- For-Loops and Related Functions ---------------------

rm(list=ls())

# How are loops used in general

loopvec <- c(1:15)
total <- 1
for(i in loopvec){
  total <- total - i[-1]
}

total

# to turn off scientific notation
options(scipen=999)

total

# what if we just want the even numbers
total -> 1
for(i in loopvec){
  if(i %% 2 == 0){
    print(i)
    
  }
}

# another way to do this using seq()

for(i in seq(2,15,by=2)){
  print(i)
}
  
# break statement
# how to break out of the loop

total <- 1
for(i in loopvec){
  if(i %% 2 == 0)
    print(i)
  if(i == 8){
    break
  }
}

# what if I just wanted to skip 8 and move on to10 as the next iteration

total <- 1
for(i in loopvec){
  if(i %% 2 == 0)
    if(i == 8){
      next
    }
  print(i)
}

# MINI CHALLENGE
# CREATE A FOR LOOP THAT PRINTS ALPHABETS FROM A TO Z

letters
for(i in letters){
  print(i)
}


# Section 5 Lecture 19 -------------- Dataframes 1.1 Introduction ---------------------

rm(list = ls())

a <- c(1,2,3,4,NA)
b <- c(6,7,8,NA,10)
c <- c(11,12,NA,14,15)
d <- c(16,NA,18,19,20)
e <- c(21,22,23,24,25)

# Combine these vectors into a dataframe

df <- data.frame(a,b,c,d,e)
class(df)

# Helper Functions for DataFrames

nrow(df)
ncol(df)
df1 <- stack(df)
rdf <- rbind(df, df, df)
rdf

cdf <- cbind(df, df, df)
cdf

# Just the first 6 rows
head(rdf)
# Just the first 3 rows
head(rdf, 3)

# Similar to head we have a function called tail
tail(rdf)
tail(rdf, 4)
class(rdf)

# To find the class for individual elements inside of a dataframe
str(rdf)

# Main difference between a matrix and a dataframe is that
# In a Matrix, you can have different data types anywhere
# In a dataframe, data in columns have to be the same type, but columns do not



# Section 5 Lecture 20 ----------- Dataframes 1.2 summary(), str(), subsetting(), transpose -----------

summary(rdf)
names(rdf)
colnames(rdf)
rownames(rdf)
colnames(rdf) <- c("a1", "b1", "c1", "d1", "e1")

View(rdf)
fix(rdf)
rdf

# t - transpose
trdf <- t(rdf)
# when you transpose, the dataframe becomes a matrix
trdf2 <- as.data.frame(trdf)

# remove rows with nas
rdf_n <- na.omit(rdf)
rdf_n

rdf

rdf[,4]
rdf[4,]
rdf[4,1]

# rows 4 and 5 and all the columns in those rows
rdf[c(4, 5),]

# rows 4 and 5 and the 2nd 3rd and 5th column
rdf[c(4, 5), c(2,3,5)]

rdf$a1


# Section 5 Lecture 21 ----------- Dataframes 1.3 which() order() rev() attach() matrix() -----------

rdf

# all values greater than 22 in e1

which(rdf$e1 > 22)
rdf[which(rdf$e1 > 22), ]
rdf[1:5, which(names(rdf) %in% c("c1", "d1"))]
which(rdf[,5] > 22)  == which(rdf$e1 > 22)

# sorting dataframes

rdf

rdf[order(rdf$e1),]
rdf[order(-rdf$e1),] # same as using rev command
rdf[rev(order(rdf$e1)),]
rdf[rev(order(rdf$e1)),] == rdf[order(-rdf$e1),]

# attach statement

attach(rdf)
a1 #ahhhh nice
# if you already have a variable a1, this will overwrite it - WATCH OUT

# matrices

m1 <- matrix(1:100, nrow=10)
m1
m2 <- as.matrix(rdf)
m2
m3 <- cbind(a, b, c, d, e)
m3
class(m3)
m4 <- rbind(a,b,c,d,e)
m4
class(m4)

# matrices use less memory than dataframes

object.size(m3)
object.size(df)


# Section 5 Lecture 22 --------------- Exercise - 2 (with solutions) -----------

# 6 different practice exercies on dataframes

# 1
# Create a datafram with 5 columns and 100 rows.
# Each of the columns should contain random numbers between 1 and 10

#   First Approach
a <- round(runif(100, 1, 10))
b <- round(runif(100, 1, 10))
c <- round(runif(100, 1, 10))
d <- round(runif(100, 1, 10))
e <- round(runif(100, 1, 10))

df1 <- data.frame(a,b,c,d,e)
class(df)
head(df)
nrow(df)


#   Second Approach

mat1 <- matrix(round(runif(500, 1, 10)), nrow=100)
df2 <- as.data.frame(mat1)
class(df2)
head(df2)
nrow(df2)


# 2 
# Insert 5 missing values in each of the 5 columns at random locations

#   First Approach
df1[sample(1:100, 5), 1] <- NA
df1[sample(1:100, 5), 2] <- NA
df1[sample(1:100, 5), 3] <- NA
df1[sample(1:100, 5), 4] <- NA
df1[sample(1:100, 5), 5] <- NA
#  tedious


#   Second Approach, loop it

for(colnum in c(1:ncol(df1))){ # ncol(df1) = the last column of the dataframe, could be useful
  df1[sample(1:100, 5), colnum] <- NA
}

summary(df1)


# 3
# Get the row numbers that contain missing values in the first column

df1
which(is.na(df1$a))


# 4
# Get the row numbers that contain missing values in any of the columns
rowindices <- which(is.na(df1$a) | is.na(df1$b) | is.na(df1$c) | is.na(df1$d) | is.na(df1$e))
df1[rowindices, ]


# 5
# Get the elements of the 3rd and 5th column in the last 10 rows of 'df1'

tail(df1, 10)[, c(3,5)]


# 6
# Sort 'df1' such that the first column is sorted in ascending order,
# and the second column is sorted in descending order.

df1[order(df1$a, -df1$b), ]


# Section 5 Lecture 23 --------------- Exercise - 3 (with solutions) -----------

library(datasets)
library(help="datasets")
USArrests
?USArrests

# 1 
# Extract the 25% of states (in rownames) with least arrests due to 'Murder'

sortedDf <- USArrests[order(USArrests$Murder), ]
USArrests
sortedDf

numrows <- (nrow(sortedDf)*0.25)
sortedDf[c(1:round(numrows)), ]


#2
#  Extract the states whose 'Assault' is > 200 OR 'Rape' > 20

states <- which(USArrests$Assault > 200 | USArrests$Rape > 20)
USArrests[states, ]


# Section 5 Lecture 24 --------------------------- Binning Data -----------

# Process of conversion of a continuous variable into a categorical variable

rm(list = ls())

cont <- runif(15, 20, 100)
cont_round <- round(cont)
sumarry(cont)
summary(cont)

l1 <- min(cont)
l2 <- max(cont)
# Since we are getting 4 bins, divide the diff of max and min by 4
bin_width <- round((l2-l1)/4) 
bins <- seq((l1-bin_width), (l2+bin_width), bin_width)
bins

cate <- cut(cont, bins)
cate
levels(cate)

pretty(cont, 4)
cut(cont, pretty(cont, 4))

con2 <- round(runif(20, 30, 100))
cate1 <- cut(con2, pretty(con2, 4))
class(cate1)
nlevels(cate1)

# Section 5 Lecture 25 ----------------------- Creating Frequency Tables -----------

head(USArrests)
table(USArrests$UrbanPop)

binnedUrbanpop <- cut(USArrests$UrbanPop, pretty(USArrests$UrbanPop))

table(binnedUrbanpop)

table(binnedUrbanpop, USArrests$Murder)

binnedMurder <- cut(USArrests$Murder, pretty(USArrests$Murder))

tbl <- table(binnedUrbanpop, binnedMurder)
class(tbl)
tbl_df <- as.data.frame(tbl)
tbl_mat <- as.matrix(tbl)
tbd_df_mat <- as.data.frame.matrix(tbl)
tbd_df_mat
class(tbd_df_mat)
colSums(tbd_df_mat)

# CHALLENGE
# BINNED URBAN POP IN ROWS AGAINST BINNED RAPE IN COLUMNS

binnedRape <- cut(USArrests$Rape, pretty(USArrests$Rape))

tbl2 <- table(binnedUrbanpop, binnedRape)
tbl2_df_matrix <- as.data.frame.matrix(tbl2)
tbl2_df_matrix



# Section 5 Lecture 26 ---------------------Import and Export Data-----------------

# ***CSV ----
# Important to note, the default setting on read.csv is that strings are read as factors

# 2 ways to handle this
#  First, as an option when it's read in

testcsv <- read.csv("C:/Users/MichaelLima/Documents/Rtutorial/test.csv", stringsAsFactors = FALSE)
 
#  Second, change global options

### options(stringsAsFactors = FALSE)


# ***TXT

# Important Options/Arguments

# read.table("path", fill=T) <-- use fill to force a .txt read
# use cat() on something that was not imported correctly to see original
# cat is like print


# ***IMPORT FROM CLIPBOARD, very cool


dataset <- read.table("clipboard", sep="\t")
dataset


# IMPORT DATA FROM URL

# still use read.table but might need to specify the separator
# for example  sep = ","  for csv
# header = T



challenge <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data", fill = T, sep = ",")
challenge


# ***EXPORT DATA

getwd()
write.csv(USArrests, "exported.csv")


# Section 5 Lecture 27 ---------------------Challenge-----------------

cars

# Split the 'cars' dataset into 80% training and 20% test samples

numrows <- round(.8 * 50)
trainingIndex <- sample(1:nrow(cars), numrows)
trainingData <- cars[trainingIndex, ]
trainingData

# the '-' in front of trainingIndex will omit all of the trainingIndex rows and put the rest into testData
testData <- cars[-trainingIndex, ]

testData



# Section 5 Lecture 28 ---------------------Challenge-----------------

# Merge
set.seed(100)
df1 = data.frame(StudentId = c(1:10),
                 Subject = sample(c("Math", "Science", "Arts"), 10, replace = T))

df2 = data.frame(StudentNum = c(2, 4, 6, 12),
                 Sport = sample(c("Football", "Tennis", "Chess"), 4, replace = T))
df1
df2

#  the first column in both of these data frames represent the same thing but have different names
#  we want to combine these dataframes based on the first column.

# ****Inner Join - like an intersect

merge(df1, df2, by.x="StudentId", by.y="StudentNum") # if columns had same name then ..., by="thatName"
# merges ONLY observations with identical values in the specified column


# ****Outer Join - like a union
# if we want ALL columns 
merge(df1, df2, by.x="StudentId", by.y="StudentNum", all=T)



# ****Left Join
# all elements from df1
merge(df1, df2, by.x="StudentId", by.y="StudentNum", all.x=T)



# ****Right Join
# all elements from df2
merge(df1, df2, by.x="StudentId", by.y="StudentNum", all.y=T)



# Aggregate
head(ChickWeight)
summary(ChickWeight)
ChickWeight
# what is the mean weight of all of the chicks 
summary(ChickWeight$Diet)
aggregate(weight ~ Diet, data=ChickWeight, FUN=mean)
# weight ~ diet   ?....using the ~ - 
# the left side of the formula "weight" is the variable we are interested in
# the right side of the formula "Diet" at what level we want to see the weights at

aggregate(weight ~ Diet, data=ChickWeight, FUN=sum)
aggregate(weight ~ Diet, data=ChickWeight, FUN=length)

table(ChickWeight$Diet)

aggregate(weight ~ Diet + Chick, data=ChickWeight, FUN=mean)


# Reshape
library(reshape2)
# dataframe, row ~ column, what function are we aggregating on, number of cells
dcast(ChickWeight, Chick ~ Diet, sum, value.var = "weight")




# Section 5 Lecture 29 ---------------------Challenge-----------------

rm(list = ls())

mtcars

set.seed(100)
mtcars$names <- rownames(mtcars)
rownames(mtcars) <- NULL
head(mtcars)

mtcars.x  <- mtcars[, c("names", "cyl")]
mtcars.y <- mtcars[sample(1:nrow(mtcars), 10), c("names", "mpg")]
mtcars.x
mtcars.y

# CHALLENGE
# 1. Inner Join  2. Outer Join  3. Left Join  4. Right Join

# 1. Inner Join
inner <- merge(mtcars.x, mtcars.y, by="names")
inner

# 2. Outer Join
outer <- merge(mtcars.x, mtcars.y, by="names", all=T)
outer

# 3. Left Join
left <- merge(mtcars.x, mtcars.y, by="names", all.x=T)
left

# 4. Right Join
right <- merge(mtcars.x, mtcars.y, by="names", all.y=T)
right



# Aggregate CHALLENGE
attenu
aggregate(dist ~ event, data=attenu, FUN=mean)


# Cross Tabulate CHALLENGE ----- IMPORTANT TO UNDERSTAND
morley
# row: Expt, col: Run, value: Speed, function: sum
dcast(morley, Expt ~ Run, FUN=sum, value.var="Speed")

# row: Day, col: Month, var: Temp, function: sum
dcast(airquality, Day ~ Month, FUN=sum, value.var = "Temp")


### UNDERSTAND THE MELT() FUNCTION BETTER!!! -- uses the plyr package



# Section 6 Lecture 30 ----------------Working with Packages---------------

#install.packages("MASS")
#install.packages("car")
#install.packages("googleVis")
#install.packages("devtools")
#install.packages("lubridate")
#install.packages("stringr")
install_github("tidyverse/ggplot2")
install_github("tidyverse/readr")
install.packages("curl")



library(MASS)
library(devtools)
library(lubridate)
library(stringr)
library(readr)
library(ggplot2)
library(devtools)



# Section 6 Lecture 31 ----------------Dates with Lubridate---------------

rm(list = ls())

a <- "04Jul2015"
b <- "06/04/2015"

class(a)
class(b)
# a: "04Jul2015"  %d - Day, %b - for a 3 character month, %Y - four digit year
a_date <- as.Date(a, format="%d%b%Y")

# b: "06/04/2015" %m - Month first / %d - Day / %Y - four digit year
# note "/", different from a
b_date <- as.Date(b, format="%m/%d/%Y")
b_date

day(a_date) # day of the month
wday(a_date) # numbered day of the week
months(a_date) # what month
year(a_date) # what year
weekdays(a_date) # what day of the week

c <- a_date - b_date
c
class(c) #difftime

names(c)
attributes(c)
attr(c, "units")
unlist(c)
c1 <- unclass(c)
c1
print(c1)
cat(c1)
c2 <- unclass(c)[1]
c2

d <- "07/31-2015"
d_date <- as.Date(d, format="%m/%d-%Y")
d_date

library(lubridate)
library(help=lubridate)

Vehicles$DateTime <- as.Date(Vehicles)

trial <- ymd_hms(Vehicles$DateTime)
View(trial)



# Section 6 Lecture 32 ----------------------------------------------------









# Section 6 Lecture 33 ----------------------------------------------------



paste("001", "123", "456", "789", sep="-", collapse = "")

library(stringr)

myStr <- " The quick brown fox"
myStr
nchar(myStr)




# Section 6 Lecture 35 - Functions and Environments -----------------------










