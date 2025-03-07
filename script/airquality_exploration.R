# Load the data airquality to the environment
data(airquality)

# Check description file of the data
?airquality
# Daily air quality measurements in New York, May to September 1973.

## I decided for this dataset because I have never worked with it and I am curious to check it further

# Print first lines of the data frame
head(airquality)

summary(airquality)

str(airquality)

# Assign new name to work with the data
airqual <- airquality


# PART 3

summary(airqual)
## We see that there are 37 NAs in Ozone and 7 NAs in Solar.R columns

is.na(airqual)

## Lets clean the data by eliminating the rows with NAs
airqual <- airqual %>% drop_na()

## It is also interesting to create another column with the dates
airqual$Date<-as.Date(with(airqual,paste(1973,Month,Day,sep="-")),"%Y-%m-%d")
head(airqual)

# PART 4
## Lets try to draw relations between Ozone, Solar.R and Temp
