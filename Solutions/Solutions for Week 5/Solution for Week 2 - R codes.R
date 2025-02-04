# Solutions for Week 2: R Code 

# set up your own directory
# setwd("")

London.Ambulance <- read.csv("Ambulance and Assault Incidents data.csv")

Subs_towns <- London.Ambulance[London.Ambulance$WardType == 'Suburbs and Small Towns',]
ProsMetro <- London.Ambulance[London.Ambulance$WardType == 'Prospering Metropolitan',]

# create a function to calculate the mode
get_mode <- function(x) {
	# get unique values of the input vector
	uniqv <- unique(x)
	# select the values with the highest number of occurrences
	uniqv[which.max(tabulate(match(x, uniqv)))]
}

# calculate the mode of the 2011 population variable
get_mode(Subs_towns$Assault_09_11)
# descriptive summaries & sd
summary(Subs_towns$Assault_09_11)
sd(Subs_towns$Assault_09_11)

# repeat for the other group

# create a function to calculate the mode
get_mode <- function(x) {
	# get unique values of the input vector
	uniqv <- unique(x)
	# select the values with the highest number of occurrences
	uniqv[which.max(tabulate(match(x, uniqv)))]
}
# calculate the mode of the 2011 population variable
get_mode(ProsMetro$Assault_09_11)
# descriptive summaries & sd
summary(ProsMetro$Assault_09_11)
sd(ProsMetro$Assault_09_11)

# To generate the dual boxplot
# use rbind()
data <- rbind(Subs_towns, ProsMetro)
# dual boxplot
#:::: use option outline=FALSE to exclude outliers
boxplot(data$Assault_09_11 ~ data$WardType, outline = FALSE, xlab = "", ylab="Levels of assault", main="Boxplot [Note: Outliers were excluded]")

