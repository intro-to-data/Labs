## New York City Airbnb
## Author: Your Name Here



## INIT ========================================================================
library(tidyverse)


## VARS ========================================================================
data_file <- "./new-york-city-airbnb-open-data.zip"


## DATA ========================================================================
if (file.exists(data_file)){
    Airbnb <- read_csv(data_file)
} else {
    stop("The data file is not in your current working directory.")
}

## The str() command is a convenient way to look at your data. This command
## scales to wide data sets better than the head() command does. In addition to
## showing you example data for each column, it tells you the number of column
## and rows in your data.
str(Airbnb)


## EDA =========================================================================

## The following three questions should be answered in Canvas:
## Question 01. How many rows of data do you have (Airbnb)?
## Question 02. How many columns of data do you have (Airbnb)?
## Question 03. What is the grain of this Airbnb data?

## The remaining lab questions are below:


## Question 04: Draw a bar graph showing the number of Airbnb hosts per
## neighbourhood_group. Which neighbourhood has the most hosts?

ggplot(data = Airbnb, mapping = aes(x = neighbourhood_group)) +
    geom_bar(fill="darkblue")


## Question 05: How many hosts are in Queens?

Airbnb %>%
    group_by(neighbourhood_group) %>%
    count()


## Question 06: Which room_type is the most prevalent in the Bronx?
## Which of these two code groups was most useful to you?

ggplot(data = Airbnb, mapping = aes(x = neighbourhood_group, y = room_type)) +
    geom_count(fill="darkblue")

Airbnb %>%
    group_by(neighbourhood_group, room_type) %>%
    count()


## Question 07: What is the average price of a room in Belmont?

Airbnb %>%
    filter(neighbourhood == "Belmont") %>%
    summarize(AvgPrice = mean(price))

## Question 08/09
## Do you think the number_of_reviews is a good predictor of price?
## Create a scatter plot showing the relationship between the two
## variables. You will want to use geom_point. Please discuss and upload your graph.
## Place your code below.



## Question 10: Draw a density plot of host price. How would you
## describe it? Is it normally distributed? Does it have a long tail?
## Is it skewed? You will need to use geom_density or geom_histogram
## to answer this question.
## Place your code below.


## Question 11/12:
## The price of Airbnb hosts is obviously all over the place (that is a
## technical term). Which room_type has the most outlier prices?
## "Entire home/apt" or "Shared room" You will need to use a
## geom_boxplot() to answer this. Please upload the resulting plot to
## Canvas.



## Question 13: What is the average price of of a "Shared room"?



## Question 14/15:
## How many "Shared room" entries are in the data?
## Is this a large enough sample to be useful?



## Question 16:
## Soon we will start thinking about building a linear model to
## predict Airbnb host price in NYC. Use your transformation/plotting
## skills to look at the data. Which features (columns) do you think
## would be most useful for predicting price? Write in some code
## below. You can describe what you find in Canvas. Then, save your
## Airbnb.R file and upload it via Canvas.




