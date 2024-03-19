# create a data frame
Manager<-c(1:5)
Date<-c('10/15/18', '01/11/18', '10/21/18', '10/28/18', '05/01/18')
Country<-c('US','US','IRL','IRL', 'IRL')
Gender<-c('M','F', 'F', 'M', 'F')
Age<-c(32,45,25,39,99)
q1<-c(5,3,3,3,2)
q2<-c(4,5,5,3,2)
q3<-c(5,2,5,4,1)
q4<-c(5,5,5,NA,2)
q5<-c(5,5,2,NA,1)
df<-data.frame(Manager, Date, Country, Gender, Age, q1, q2, q3, q4, q5)
View(df)
#change age number to NA
df$Age[df$Manager==5]<- NA
#or df$Age[df$Age==99] <-NA
View(df)

# Add agecategory column
df$AgeCategory <- c(10,22,33,44,50)

#remove column
df_1 <-subset(df,select = -Manager)
# or df_1 <-subset(df,select = -1)
View(df_1)

df<-df[, c(2:11)]
df

#print rows from 1 to 4 and th enetire columns
df[1:3, ]

#print rows(1,3,5) and columns (2,4)
df[c(1,3,5), c(2,4)]
#print 1 and 3 rows and 1 to 3 colums
df[c(1,3), c(1:3)]

#structure of the data.frame
str(df)
#drop AgeCategory
df<-subset(df,select = -AgeCategory)
df <-subset(df,select = -(10:11))
df
#logical structure

df$Age_cat[df$Age >= 45]<- 'elder'
df$Age_cat[df$Age >=26 & df$Age <=44 ]<- 'middle aged'
df$Age_cat[df$Age <= 25] <- 'young' 
df

df$Age_cat[is.na(df$Age)] <- 'elder'
df
Age1 <- factor(df$Age_cat, ordered = TRUE,
               levels = c('young','middle aged','elder'))
Age1


df$Age_cat <-Age1
df
str(df)

summary_col <- df$q1 + df$q2 + df$q3 + df$q4 + df$q5

df$summary_col <- summary_col
str(df)
#or df <- data.frame(df, summary_col)

#to calculate the mean for each row
mean_value <- rowMeans(df[5:9])

#add mean value to end of managers data frame
df<- data.frame(df, mean_value)

#show data fram contents
df

#change the name of this column to mean value
names(df)[12] <- 'Mean value'

#chnage name of summary_col to Answer total
names(df)[11] <- 'Answer total'

#show
str(df)

#show a summary for numerical values
help('colSums')
column_summary <- colSums(df[, c(4:9,11:12)], na.rm = TRUE)
column_summary
