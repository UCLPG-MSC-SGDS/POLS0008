
# Solutions to seminar task in week 3

# Lets begin
library("ggplot2")
library("gridExtra")

# use setwd() and load dataset with read.csv()

#setwd("/Volumes/Anwar-HHD/POLS0008/Week 2/Dataset for Week 2")
data <- read.csv("Ambulance and Assault Incidents data.csv")

# filter out 00AJ (Ealing)
borCodeOOAJ <- data[data$BorCode=="00AJ",]

# code for task 1
image.plot1 <- ggplot(borCodeOOAJ, aes(x=Assault_09_11)) + 
	geom_histogram(binwidth = 75) + 
	ggtitle("Histogram for 00AJ: Assaults in 09/11 [binwidth = 75]") +
	xlab("Assaults") +
	ylab("Frequency")

# view histogram
image.plot1

# saving an image
ggsave("histogram plot 1.png", image.plot1, width=9, height=9, units="cm", dpi=300)

# code for task 2 full code
image.plot2 <- ggplot(borCodeOOAJ, aes(x=Assault_09_11)) + 
	geom_histogram(binwidth = 100, fill="white", colour="black") + 
	ggtitle("Histogram for 00AJ: Assaults in 09/11 [binwidth = 100]") +
	xlab("Assaults") +
	ylab("Frequency") +
	theme_classic() +
	theme(plot.title = element_text(size=8, face = "bold"), 
		axis.text=element_text(size=8, face = "bold"), 
		axis.title=element_text(size=8,face="bold"))

# view histogram
image.plot2

# saving an image
ggsave("histogram plot 2.png", image.plot2, width=9, height=9, units="cm", dpi=300)


# code for task 3

image.plot3 <- ggplot(borCodeOOAJ, aes(x="", y=Assault_09_11)) + 
	geom_boxplot() +
	theme_classic() +
	ggtitle("Boxplot for 00AJ: Assaults in 09/11 [binwidth = 100]") +
	xlab("Ealing") +
	ylab("Assaults") +
	theme(plot.title = element_text(size=8, face = "bold"), 
		axis.text=element_text(size=8, face = "bold"), 
		axis.title=element_text(size=8,face="bold"))

# view histogram
image.plot3

# saving an image
ggsave("histogram plot 3.png", image.plot3, width=9, height=9, units="cm", dpi=300)

# Solutions to seminar question

install.packages("gridExtra")

library("ggplot2")
library("gridExtra")

data <- read.csv("Ambulance and Assault Incidents data.csv")
# filter out 00AH (Croydon)
borCodeOOAH <- data[data$BorCode=="00AH",]

# code for task 2 full code
plot.hist_75 <- ggplot(borCodeOOAH, aes(x=Assault_09_11)) + 
	geom_histogram(binwidth = 50, fill="white", colour="black") + 
	ggtitle("Croydon: Assaults [binwidth = 75]") +
	xlab("Assaults") +
	ylab("Frequency") +
	theme_classic() +
	theme(plot.title = element_text(size=6, face = "bold"), 
		axis.text=element_text(size=6, face = "bold"), 
		axis.title=element_text(size=6,face="bold"))

# code for task 2 full code
plot.hist_100 <- ggplot(borCodeOOAH, aes(x=Assault_09_11)) + 
	geom_histogram(binwidth = 200, fill="white", colour="black") + 
	ggtitle("Croydon: Assaults [binwidth = 100]") +
	xlab("Assaults") +
	ylab("Frequency") +
	theme_classic() +
	theme(plot.title = element_text(size=6, face = "bold"), 
		axis.text=element_text(size=6, face = "bold"), 
		axis.title=element_text(size=6,face="bold"))

plot.hist_75_100 <- grid.arrange(plot.hist_75, plot.hist_100, ncol=2, nrow=1)

ggsave("histogram plot 4.png", plot.hist_75_100, width=15, height=9, units="cm", dpi=300)