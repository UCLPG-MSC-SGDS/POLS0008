# SOLUTIONS
# read data into R after uploading file into RStudio server
# solutions to task

# clear memory and junk in R
rm(list = ls())
gc()

# load data
school_data <- read.csv("All Schools in London.csv")

# 1.
# Create a column called TotalStudents -- take NumberBoys column and plus that to NumberGirls column
school_data$TotalStudents <- school_data$NumberBoys + school_data$NumberGirls

# 2.
# Create a column called PercentGirls -- take NumberGirls column divid that by TotalStudents column multiplied by 100
school_data$PercentGirls <- school_data$NumberGirls/school_data$TotalStudents * 100

# 3.
# This asks to calculate the total number of students by given type of school - there two ways to represent this result
# -- using the tapply() function 
# -- insert the column of interest first (School_data$TotalStudents)
# -- next, insert the column to you the results to be stratified by (school_data$Type)
# -- instruct how want the values to be summed (sum), averaged (mean) etc.in the FUN argument

tapply(school_data$TotalStudents, school_data$Type, FUN = sum)

# Seminar Questions
# 1.
# Name of school with lowest value has only 40 students 
min(school_data$TotalStudents)
# sort the column for lowest to highest to reveal the school: "Denham Village Infant School"

# Name of school with highest value has up to 2,065 students 
max(school_data$TotalStudents)
# sort the column for lowest to highest to reveal the school: "JFS School"

# 2.
# step 1: to create a barplot, use the table() function to tabulate number of schools based on ofsted grades
table(school_data$OfstedGrade)
# pass the results from table() in an object called 'freq'
freq <- table(school_data$OfstedGrade)
# use barplot function to create barplot
barplot(freq, main="Frequency of schools by OFSTED performance", xlab="OFSTED grade", ylab="Number of schools")

# Description: Descriptively, most schools in London achieved an OFSTED grade of 2 (n = 1,279) meaning that their overall performance in terms
# delivery of quality teaching to students and student performance was "GOOD". 

# The number of schools that need support are 246, this corresponds to those that attained an OFSTED grade of 
# 3 (REQUIRES IMPROVEMENT) and 4 (INADEQUATE)

# 3. Frequency distribution

# create plots
# create this classes ingredient for the plots
classes <- seq(0, 2200, 200)
classes

# apply the cut() function onto the TotalStudents column to create a groups column
# dig.lab removes scientific notation in interval
school_data$Groups <- cut(school_data$TotalStudents, breaks=classes, dig.lab = 5)
school_data$Groups

#this creates partial frequency table
frequency_results <- data.frame(table(school_data$Groups))
#this renames the columns
colnames(frequency_results)[1] <- "Groups"    
colnames(frequency_results)[2] <- "Frequency" 
#this show the names of the columns
names(frequency_results)

# prints partial frequency table
frequency_results

# calculating the relative freq., cumulative freq., and cumulative relative frequency
frequency_results$RelativeFreq <- frequency_results$Frequency/sum(frequency_results$Frequency)
frequency_results$CumulativeFreq <- cumsum(frequency_results$Frequency)
frequency_results$CumulativeRelFreq <- cumsum(frequency_results$RelativeFreq)

# prints full frequency table (1 output)
frequency_results

# creates the histogram (1 output) 
hist(school_data$TotalStudents, breaks = classes, 
	ylab="Frequency for schools", 
	xlab="Total students", 
	main= "Frequency Distribution (schools vs. student capacities)")

# create the cumulative frequency plot (1 output)
# extract the cumulative frequency from output frequency table
cumulative.freq0 <- c(0, frequency_results$CumulativeFreq)
cumulative.freq0
# create the plot with student values on x-axis vs cumulative frequency values (school number) on y-axis
plot(classes, cumulative.freq0, main="Cumulative Frequency for Schools in London " , xlab="Total Students", ylab="Cumulative Frequency: Schools")
#connect the dots and BOOM
lines(classes, cumulative.freq0)

# create the relative cumulative frequency plot (1 output)
# extract the relative cumulative frequency from output frequency table
rel.cumulative.freq0 <- c(0, frequency_results$CumulativeRelFreq)
rel.cumulative.freq0
# create the plot with student values on x-axis vs cumulative frequency values (school number) on y-axis
plot(classes, rel.cumulative.freq0, main="Relative Cumulative Frequency distribution for Schools in London " , xlab="Total Students", ylab="Relative Cumulative Frequency [%] for Schools")
#connect the dots and BOOM
lines(classes, rel.cumulative.freq0)