rm(list = ls())
gc()
dev.off()

setwd("~")

# load the super cleaned data for Louise and Jente and Shunya
midyear <- read_csv('midyear2020_v2.csv')

library(tidyverse)
library(ggplot2)
library("gridExtra")

# Solutions to seminar tasks

# 1.
# There are several was to filter out the Birmingham records
# Option 1: The base R way
midyr_birmingham_baser <- midyear[midyear$lad20_name=="Birmingham",]
# Option 2: The tidyverse way
midyr_birmingham_tidyv <- filter(midyear,lad20_name=="Birmingham")

# 2.
# There are several was to filter out the Manchester records
# Option 1: The base R way
midyr_manchester_baser <- midyear[midyear$lad20_name=="Manchester",]
# Option 2: The tidyverse way
midyr_manchester_tidyv <- filter(midyear,lad20_name=="Machester")

# Alternatively, you can have both filtered to the data frame; here's an example using the base R way
filter_bir_manc_baser <- midyear[midyear$lad20_name=="Birmingham" | midyear$lad20_name=="Manchester",]

# 3.
# Computing the mean, median and standard deviation
# In base R code - you can compute these summary estimates separately with each function
#::: alteratively you can compute them of the fly using summary()
#::: however you will need to use the sd() for the standard deviation

# Option 1:
# using any of the data frames
# here's long winded way for both areas in base-r

mean(midyr_birmingham_baser$pop20)
median(midyr_birmingham_baser$pop20)
sd(midyr_birmingham_baser$pop20)

mean(midyr_manchester_baser$pop20)
median(midyr_manchester_baser$pop20)
sd(midyr_manchester_baser$pop20)

# Option 2:
# quickest way in base-r
summary(midyr_birmingham_baser$pop20)
sd(midyr_birmingham_baser$pop20)

summary(midyr_manchester_baser$pop20)
sd(midyr_manchester_baser$pop20)

# Option 3:
# Alternatively, and this is the yidyverse way which can be done all in one line of code
#::: this way is a lot cleaner and it gives you the option to compile the result into a table (see bonus content)
#::: here how to compute every from the fly in tidy verse

birmingham_result <- midyr_birmingham_baser %>% summarize(mean = mean(pop20), sd = sd(pop20), median = median(pop20))
# view result
View(birmingham_result)

manchester_result <- midyr_manchester_baser %>% summarize(mean = mean(pop20), sd = sd(pop20), median = median(pop20))
# view result
View(manchester_result)

# 4.
# Boxplot
# For dual boxplots it best to have Birmingham and Manchester in one data frame
#::: you can use rbind() to append the two data frame accordindly into one data frame object
#::: or perform the filter one the two categories -- see solution on `filter_bir_manc_baser` object
#::: lets use the `filter_bir_manc_baser` to make the dual boxplots

# boxplot for camden only
p.boxplot.all <- ggplot(filter_bir_manc_baser, aes(x=lad20_name, y=pop20)) + 
	geom_boxplot() +
	ggtitle("Birmingham & Manchester") +
	xlab("Area Name") +
	ylab("Population") +
	theme_classic()

# 5. 
# Histogram
# selected binwidth = 500
hist1 <- ggplot(midyr_birmingham_baser, aes(x=pop20)) + 
	geom_histogram(binwidth = 500, fill="white", colour="black") +
	ggtitle("Birmingham [binwidth = 500]") +
	xlab("Population") +
	ylab("Frequency") +
	theme_classic()

hist2 <- ggplot(midyr_manchester_baser, aes(x=pop20)) + 
	geom_histogram(binwidth = 500, fill="white", colour="black") +
	ggtitle("Manchester [binwidth = 500]") +
	xlab("Population") +
	ylab("Frequency") +
	theme_classic()

# Put images into one panel
plot.hist_1_2 <- grid.arrange(hist1, hist2, ncol=2, nrow=1)
	
