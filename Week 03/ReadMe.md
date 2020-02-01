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
5. Download the helper R script I wrote. Save this file in the project
   folder. There's no reason to, but renaming this file will not break
   anyhing.
6. Import the data. To do this, run the first 21 lines of the Airbnb.R
   script. Once you have done this, please continue to the EDA section
   and complete the lab questions.

## EDA

These questions should be answered in Canvas. In the Canvas version,
there may be additional information, links, suggestions, etc. You
should have created a data frame/tibble called Airbnb (remember,
capitalization matters).

1. How many rows of data do you have (Airbnb)?
2. How many columns of data do you have (Airbnb)?
3. What is the grain of this Airbnb data? For more information about
   the data, please read the [Kaggle
   documentation](https://www.kaggle.com/dgomonov/new-york-city-airbnb-open-data/data#). If
   you aren't familiar with Airbnb, look at [their
   website](https://www.airbnb.com).

In order to answer the remaining lab questions, you will need to find the appropriate part of the `Airbnb.R` file.
