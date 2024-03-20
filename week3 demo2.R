#load the data set
managers_data <- read.csv('managers.csv' )
View(managers)

#omit missing data
new_data <- na.omit(managers_data)
new_data

#use complete.casa to show rows where data is available
complete_data <- !complete.cases(managers_data)
complete_data

#show sum of completed rows 
total_sum <- sum(complete.cases(managers_data))
total_sum

#List rows that do  not have missing value
complete_data <- managers_data[complete.cases(managers_data),]
complete_data
nrow(complete_data)
nrow(managers_data)

#list rows with missing values
managers_data[!complete.cases(managers_data),]

#store to new dataframe 'missing data'
is.na(managers_data$Age)
sum(is.na(managers_data$Age))

#find the mean of missing values from the age attribute
mean(is.na(managers_data$Age))

#Find the mean of rows with no incomplete data
mean(!complete.cases(managers_data))

#install package mice
install.packages('mice')
library(mice)
md.pattern(managers_data)

#Install package vim to access its aggr() function
#use VIM package to show missing values
install.packages('VIM')
library(VIM)

missing_values <- aggr(managers_data, prop = FALSE, numbers = TRUE, )
missing_values

missing_values <- aggr(managers_data, prop = TRUE, numbers = TRUE, )
missing_values

summary(missing_values)

matrixplot(managers_data)

#convert to a data frame and create a correlation of missing data
missing_values <- as.data.frame(abs(is.na(managers_data)))
head(missing_values)

#to create a correlation matrix between missing values
correlation_matrix <- missing_values[(apply(missing_values, 2, sum) > 0)]
correlation_matrix

cor(correlation_matrix)

attach(managers_data)
