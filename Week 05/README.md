# Relational Data (NYC Flights)

## SETUP

This week's lab is based on the NYC Flights data set introduced in
class. We will try again with the Chinook data next week. In order to
complete this lab, you should first read the [Relational
Data](https://r4ds.had.co.nz/relational-data.html#nycflights13-relational)
portion of the text. I know some of you were working on the VM, and
some of you were working on your personal computers. I want to be sure
you can access the data either way. So, before we start the lab, open
RStudio (the project doesn't matter), and enter the following command
into the console:

``` R
library(nycflights13)
```

If this runs without error, great. If it fails to load, you need to
install the `nycflights13` data before starting the lab using the
following code.

``` R
install.packages("nycflights13")
```

If RStudio asks if you would like to restart R, that is OK. After
installing the package, try rerunning `library(nycflights13)` to
confirm a successful installation. If it works, you can move on to the
lab.

## LAB

### Task 01: CREATE A PROJECT CALLED NYCFlights13

- In RStudio, create a new project called NYCFlights13 and switch to
  this project.
- You do not need to enter anything into Canvas for this task.



### Task 02: CREATE A NEW SCRIPT CALLED Lab05.R

- In RStudio, create a new R Script called Lab05.R. This is the file
  you will submit on canvas when you complete the lab.
- To do this, go to your `File` menu, select `New File` and then `R
  Script`. Or, use the shortcut, `Ctrl + Shift + N`.
- In this file, you will need to copy/paste the following code chunk:

``` R
## Lab 05: NYC Flights 13
## Author: Your Name



## Task 02: CREATE A NEW SCRIPT CALLED Lab05.R
library(tidyverse)
library(nycflights13)

airlines <- airlines
airports <- airports
planes   <- planes
weather  <- weather
```

You do not need to enter anything into Canvas for this task, but I do
want to see the code in your R script so I know you ran it.



### Task 03: PRIMARY KEYS (Planes)

- A primary key is the column (sometimes columns) which uniquely
  identify an observation in that table. For example, in the `planes`
  table, the column `tailnum` is the primary key.
- The follow code is designed to prove this fact.
- Copy/paste the following code chunks into your R Script.

``` R
## Task 03: PRIMARY KEYS (Planes)

## How many rows of data are in planes?
rows_planes <- planes %>% nrow()

## How many unique entries do we have for tailnum?
unique_tailnum <- planes %>% select(tailnum) %>% distinct() %>% nrow()

## This tests for equality. If you did everything right, it should return TRUE.
rows_planes == unique_tailnum
```

The planes data set has 3,322 rows, shown as `obs` in RStudio. There
are 3,322 unique (distinct) tailnums in the `tailnum` column. Because
these two counts are the same, tailnum can be used as a primary
key. Let's do the same thing with the `model` column to prove the
point.

``` R
## How many rows of data are in planes?
rows_planes <- planes %>% nrow()

## How many unique entries do we have for tailnum?
unique_model <- planes %>% select(model) %>% distinct() %>% nrow()

## This tests for equality. If you did everything right, it should return TRUE.
rows_planes == unique_model
```

This should return FALSE, because while there are STILL 3,322 rows of
data in `planes`, there are only 127 unique models of plane. This
means at least some of the models have more than one entry. Another
way to explain the idea of a primary key is that this column (or
columns) can be used to return a single row of data. For example, run
the following code chunk.

``` R
## Using tailnum, we can identify a single, unique plane in planes.
## Once you know the primary key, you should also know more about the
## grain of the table.
planes %>% filter(tailnum == "N137DL")

## N137DL was built by BOEING. It was built in 1991, so it is probably safe to
## ride on. It isn't a 737 MAX. But to prove that manufacturer is not the 
## primary key, try this:
planes %>% filter(model == "767-322")
```

The grain of the planes table should (now) be obvious. The planes
table is a set of unique planes!  Each row in the planes table is a
unique plane (tailnum), not a unique plane model. Of course, we could
design a table where the grain of the data was `model`, but that isn't
this table.

You do not need to enter anything into Canvas for this task, but I do
want to see the code in your R script so I know you ran it.



### Task 04: PRIMARY KEYS (Airports)

- Figure out which column in the `airports` table is the primary
  key. Feel free to re-use the code from Task 02 to help you.
- If you want more information about the `airports` table, you can use
  R's built-in help tool. Data sets that come with an R package, like
  `airports` are required to come with documentation. To see it enter
  `?airports` in the console. This works the same way all
  documentation works in R. For example, to read the documentation for
  the `nrow` function, you can use this: `?nrow`.
- Reading the documentation (sometimes called metadata) about a table
  is always a good idea, when it is available.
- The primary key should always be the _simplest_ unique combination
  possible.
    - If given the choice between a code column and a full name
      column, the code col is preferable. Codes tend to be assigned by
      a third-party authority. Names are usually the Wild Wild West.
    - If given the choice between a mutli-column primary key and a
      single-column primary key, the latter is ALWAYS preferrable, if
      it is truly unique.
    - I know programming seems complicated, but we prefer simplicity
      where possible.
- Copy/paste the following code chunk into your R script.

``` R
## Task 04: PRIMARY KEYS (Airports)

## Your code here!
```

- Once you have chosen a primary key, please answer Question 01
  in canvas. What is the best primary key for the `airports` table?
- Your options are: 
    - `alt`
    - `dst`
    - `faa`
    - `lat`
    - `lon`
    - `name`
    - `tz`
    - `tzone`



### Task 05: FOREIGN KEYS

- A foreign key is a column in a table that "maps" to a primary key in
  another table. While a primary key _must_ be unique, a foreign key
  can have duplicates.
- For example, the `tailnum` column in `flights` maps to the `tailnum`
  column in `planes`. 
- In planes, `tailnum` _N807AW_ has exactly one entry.

``` R
## Task 05: FOREGIN KEYS
planes %>% filter(tailnum == "N807AW")
```

- How many entries does tailnum _N807AW_ have in flights? One you know the
  answer, answer Question 02 on Canvas.
  
### Task 06: ERDs

- A good way to visually show the relationships between a set of
  tables is called an Entity Relationship Diagram (ERD).
- In real life, these are about as common as unicorns, when available
  they are AWESOME.
- When I am not given one, I will spend the time to draw one for myself.
- For example, for our Flights NYC 13 data:

![](https://d33wubrfki0l68.cloudfront.net/245292d1ea724f6c3fd8a92063dcd7bfb9758d02/5751b/diagrams/relational-nycflights.png)

This diagram is a little overwhelming, but it’s simple compared to
some you’ll see in the wild! The key to understanding diagrams like
this is to remember each relation always concerns a pair of
tables. You don’t need to understand the whole thing; you just need to
understand the chain of relations between the tables that you are
interested in.

For nycflights13:

- flights connects to planes via a single variable, tailnum.
- flights connects to airports in two ways: via the origin and dest variables.
- flights connects to weather via origin (the location), and year,
  month, day and hour (the time).

- Based on what you can see in the ERD above, what column(s) are used
  to connect `flights` to `airlines`? In other words, what is the
  foreign key in `flights`? You do not need to write any R code to
  complete this task.

 - air_time
 - arr_delay
 - arr_time
 - carrier
 - day
 - dep_delay
 - dep_time
 - dest
 - distance
 - flight
 - hour
 - minute
 - month
 - origin
 - sched_arr_time
 - sched_dep_time
 - tailnum
 - time_hour
 - year
 
 
 
### Task 07: INNER JOIN
 
 - Based on your answer above, write an inner join between `flights` and airlines.
- Copy/paste the following code chunk to your R script.
 
 ``` R
 ## Task 07: INNER JOIN
 
 ## Finish the code below. 
 ## You need to complete by = "".
 ## As shown, this won't work.
 
flights %>% inner_join(airlines, by = "")
 ```

Once you have completed the code in your R script, you are done with
this task. There aren't any Canvas questions based on this task.


### Task 08: MOST COMMON CARRIER

- Based on your code from Task 07, what is the most common carrier in our data?
- In Task 07, you merged the two tables using a mutating join.
- Now you need to do a single-table transformation of that result-set
  to determine the most common carrier. This is similar to some things
  we did in class.
- Copy/paste the following code chunk to your R script.

``` R
## Task 08: MOST COMMON CARRIER

## Your code here!
```

What is the most common carrier in our data? Our choices are:

- AirTran Airways Corporation
- Alaska Airlines Inc.
- American Airlines Inc.
- Delta Air Lines Inc.
- Endeavor Air Inc.
- Envoy Air
- ExpressJet Airlines Inc.
- Frontier Airlines Inc.
- Hawaiian Airlines Inc.
- JetBlue Airways
- Mesa Airlines Inc.
- SkyWest Airlines Inc.
- Southwest Airlines Co.
- United Air Lines Inc.
- US Airways Inc.
- Virgin America

### Task 09: MOST COMMON CARRRIER IN JUNE

- June is the sixth month of the year.
- Alter your code from Task 08, to filter down flights that happened
  in June.
- How many flights did Enjvoy Air have in June?
- Hint 1: Insert a `filter` function BEFORE your `inner_join`
  function.
- Hint 2: Use _TWO_ equal signs for a boolean test, not a single equal
  sign.
- Copy/paste the following code chunk to your R script.

``` R
## Task 09: MOST COMMON CARRIER IN JUNE

## Your code here!
```

Once you have completed the code, go to Canvas to answer the question:
_How many flights did Envoy Air have in June?_

### Task 10: MOST COMMON DESTINATION

- In `flights`, there is a column called `dest`. There is also a
  column called `origin`. Both are foreign keys for the `airports`
  table. The primary key in `airports` is faa.
- Look at `flights$dest` to see that the entries look like what you
  see in `airports$faa`.
- This is a type of inner join you haven't done before. Although the
  columns we are using to join the tables have different names, the
  logic is the same.
- What is the most common destination in our data?
- Copy/paste the following code chunk to your R script.

``` R
## Task 10: MOST COMMON DESTINATION

## Complete this code.
## As provided, this does not complete the task.

flights %>%
    inner_join(airports, by = c("dest" = "faa"))
```

Once you have completed the code, go to Canvas and answer the
question: _What is the most common destination?_



### Task 11: MOST COMMON DESTINATION (EASTERN TIME ZONE)

- Use the code you developed for Task 10 to complete this task.
- What is the most common destination in the eastern time zone?
    - `tzone == "America/New_York"`
- Add a filter AFTER the inner join to complete this task.
- Copy/paste the following code chunk to your R script.

``` R
## Task 11: MOST COMMON DESTINATION (EASTERN TIME ZONE)

## Your code here!
```

Once you have finished your code, go to Canvas and answer the
question: _What is the most common destination in the eastern time
zone?_

For further consideration - Does this work if you apply the filter
BEFORE the `inner_join`? Do you understand why?



### THANKS

That completes this week's lab. I hope this was helpful.
