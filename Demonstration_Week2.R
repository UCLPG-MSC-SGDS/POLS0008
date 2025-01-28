
setwd("/Users/anwarmusah/Downloads/datasets")

gaming_hrs_data <- read.csv("Gaming hours.csv")

View(gaming_hrs_data)

# min()
# max()
# sum()
# mean()
# sd()
# median()
# summary()
# boxplot()

min(gaming_hrs_data$Hours)
max(gaming_hrs_data$Hours)
sum(gaming_hrs_data$Hours)

# mean and SD
mean(gaming_hrs_data$Hours)
sd(gaming_hrs_data$Hours)

# median
median(gaming_hrs_data$Hours)

# 25th percentile
quantile(gaming_hrs_data$Hours, 0.25)
# 75th percentile
quantile(gaming_hrs_data$Hours, 0.75)
# IQR
iqr <- quantile(gaming_hrs_data$Hours, 0.75) - quantile(gaming_hrs_data$Hours, 0.25)
iqr

# report all central tendency measures and range values
# summary()
summary(gaming_hrs_data$Hours)
sd(gaming_hrs_data$Hours)

# full image
boxplot(gaming_hrs_data$Hours)
# outlier removed
boxplot(gaming_hrs_data$Hours, outline = FALSE, ylab = "Time spent on games [PS4/5 & Switch]")

# mean amount of hours spent on 7 AAA games is 264 hours (SD± 117.54 hours) [Median: 237 (IQR = 195-286)]. It should be
# noted that lowest observation was 150 hours, and the maximum value was 499 hours.

# What about a breakdown by categories?
data_PS <- gaming_hrs_data[gaming_hrs_data$Console == "PS4-5",]
data_switch <- gaming_hrs_data[gaming_hrs_data$Console == "Switch",]

# PS4/5
summary(data_PS$Hours)
sd(data_PS$Hours)

# Switch
summary(data_switch$Hours)
sd(data_switch$Hours)

# Boxplot breakdown by categorical variable
boxplot(gaming_hrs_data$Hours ~ gaming_hrs_data$Console, 
	ylab = "Time spent on games [PS4/5 & Switch]", xlab = "Console Type")

# condensed code for pulling this off
summary <- aggregate(gaming_hrs_data$Hours ~ gaming_hrs_data$Console, 
	data = gaming_hrs_data, FUN = function(x) c(mean = mean(x), sd(x), min(x), max(x))
)
