# New York City Airbnb

This lab is based on the New York City Airbnb Open Data from
Kaggle. To complete this lab, you will need to get a Kaggle account
(which is free) or bum the data from someone in the class who _did_
get a Kaggle account.

## Goals:

<div style="float:left; width:49%">

- Practice more with ggplot [Data Visualisation](https://r4ds.had.co.nz/data-visualisation.html)
- First steps with data transformations [Transformations](https://r4ds.had.co.nz/transform.html)
- Guided EDA [EDA](https://r4ds.had.co.nz/exploratory-data-analysis.html)

This lab is R-based only. If you manage to crash Excel while
completing this lab, you are doing it wrong. I am going to try a few
new/different ideas here. I am, as always, open and interested in your
feedback.

</div>

<div style="float:right; width:49%">

[Criteria](https://imgs.xkcd.com/comics/realistic_criteria.png)

</div>


## Lab Setup

1. Obtain a (free) [Kaggle](https://www.kaggle.com/) Account. Use your
   school email address, or whatever else you would like. We will use a
   few other Kaggle data-sets, so you might as well do this now.
2. Create a new project in RStudio. If you need help, [read
   this](https://r4ds.had.co.nz/workflow-projects.html). Call the
   projcet Airbnb. Please place the data file, etc. into this
   folder. You can place the project file anywhere you want on your
   computer. When RStudio starts, it will default to opening the last
   project you worked on. So, if you work on another R project, make
   sure you switch back before opening any R scripts, et.
3. Read about the [New York City Airbnb](https://www.kaggle.com/dgomonov/new-york-city-airbnb-open-data/data#) data.
4. Download the data. It is only 7MB, so it should not take long. It
   will be saved in your Downloads folder. Move this file to your new
   Airbnb project folder (see Step 2). The file is called
   `new-york-city-airbnb-open-data.zip`. Do not change the name of
   this file or unzip it. Or, if you do, altering the provided R
   script is your responsibility.
   
   ![Download](https://raw.githubusercontent.com/intro-to-data/Labs/master/Week%2003/00.png)
   
5. Download the <a
   href="https://raw.githubusercontent.com/intro-to-data/Labs/master/Week%2003/Airbnb.R"
   download>Airbnb.R</a> script I wrote to help you complete this
   lab. Save this file in the project folder. This file is also
   attached to the lab introduction in Canvas. Once you have
   completed steps four and five, your folder should look something
   like this.
   
   ![Your Project](https://raw.githubusercontent.com/intro-to-data/Labs/master/Week%2003/01.png)
   
6. Import the data. To do this, run the first 21 lines of the <a
   href="https://raw.githubusercontent.com/intro-to-data/Labs/master/Week%2003/Airbnb.R"
   download>Airbnb.R</a> script. You should have created a data
   frame/tibble called Airbnb (remember, capitalization matters).

   ![Airbnb](https://raw.githubusercontent.com/intro-to-data/Labs/master/Week%2003/02.png)

   Once you have done this, please continue to the EDA section
   and complete the lab questions.


## EDA

The following three questions should be answered in Canvas:

01. How many rows of data do you have (Airbnb)?
02. How many columns of data do you have (Airbnb)?
03. What is the grain of this Airbnb data? For more information about
   the data, please read the [Kaggle
   documentation](https://www.kaggle.com/dgomonov/new-york-city-airbnb-open-data/data#). If
   you aren't familiar with Airbnb, look at [their
   website](https://www.airbnb.com).

In order to answer the remaining lab questions, you will need to find
the appropriate part of the <a
href="https://raw.githubusercontent.com/intro-to-data/Labs/master/Week%2003/Airbnb.R"
download>Airbnb.R</a> file. Please run or complete the relevant
portion of the code.

04. Draw a bar graph showing the number of Airbnb hosts per
    neighbourhood_group. Which neighbourhood has the most hosts?
05. How many hosts are in Queens?
06. Which room_type is the most prevalent in the Bronx?
07. What is the average price of a room in Belmont?

08. Do you think the number_of_reviews is a good predictor of price?
09. Please discuss and upload your graph
10. Draw a density plot of host price. How would you describe it? Is
    it normally distributed? Does it have a long tail? Is it skewed?
11. The price of Airbnb hosts is obviously all over the place (that is a
    technical term). Which `room_type` has the most outlier prices?
    "Entire home/apt" or "Shared room"
12. Please upload the resulting plot to Canvas.
13. What is the average price of of a "Shared room"?
14. How many "Shared room" entries are in the data?
15. Is this a large enough sample to be useful?
16. Soon we will start thinking about building a linear model to
    predict Airbnb host price in NYC. Use your transformation/plotting
    skills to look at the data. Which features (columns) do you think
    would be most useful for predicting price? Write in some code
    below. You can describe what you find in Canvas. 
17. Save your Airbnb.R file and upload it via Canvas.
