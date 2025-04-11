# Level 1: Basic Exploration

# Load required libraries
library(readr)
library(dplyr)
library(tidyr)

#0: Load data set
data <- read_csv("C:/Users/Aditya Yadav/Downloads/student depression.csv")
View(data)

#1: Data understanding 
# Check structure of dataset (data types of each column)
str(data)

# Get summary statistics (min, max, mean, etc.)
summary(data)

# Get data set dimensions (total rows and columns)
dim(data)

#2: Missing Values 
# Count total missing values
sum(is.na(data))

# Column-wise count of missing values
colSums(is.na(data))

#3: Clean Data
# Remove unnecessary columns
data <- data %>% select(-`Work Pressure`, -`Job Satisfaction`)  
#Remove rows with NA
data<-na.omit(data)                       

#=======================================================
# 4: Calculate the percentage of students with depression
#=======================================================
percentage_depressed <- mean(data$Depression) * 100
print(paste("Percentage of students with depression:", round(percentage_depressed, 2), "%"))
