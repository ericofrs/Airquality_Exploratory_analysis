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
pairs(airqual, panel = panel.smooth, main = "Air quality data")

# First graph
ggplot(airqual, aes(x = Ozone))+
  geom_histogram(aes(y=after_stat(density)),binwidth = 5, fill = "steelblue", color="white")+
  geom_density(alpha=0.4, fill="red")+
  labs(
    title= "Distibution of Ozone",
    x= "Ozone in parts per billion",
    y= "Count"
  ) + 
  theme_light()

# Second graph
ggplot(airqual,aes(x=Ozone,y=Solar.R))+
  geom_point(size = 2)+
  geom_smooth(method="lm", col="red")+
  labs(
    title="Scatter plot: Ozone vs Solar Radiation",
    x="Ozone in parts per billion",
    y="Solar radiation in Langleys"
  ) + 
  theme_light()

# Third graph
ggplot(airqual, aes(x=Date)) +
  geom_line( aes(y=Ozone), size=1.5, color="blue") +
  labs(
    title="Ozone levels in 1973",
    x= "",
    y="Ozone in parts per billion"
  ) + 
  theme_light()

# Fourth graph
ggplot(airqual, aes(x=Date)) +
  geom_line( aes(y=Ozone), size=1, color="blue") + 
  geom_line( aes(y=Solar.R/3), size=1, color="red") + 
  scale_y_continuous(
    # Features of the first axis
    name = "Ozone",
    # Add a second axis and specify its features
    sec.axis = sec_axis(transform = ~.,name="Solar Radiation dived by 3")
  )
