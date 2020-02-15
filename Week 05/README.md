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

### Task 01: Create a project called NYCFlights13

- In RStudio, create a new project called NYCFlights13 and switch to
  this project.

### Task 02: Create a new script called Lab05.R

- In RStudio, create a new R Script called Lab05.R. This is the file
  you will submit on canvas when you complete the lab.
- To do this, go to your `File` menu, select `New File` and then `R
  Script`. Or, use the shortcut, `Ctrl + Shift + N`.
- In this file, you will need to copy/paste the following code chunk:

``` R
## Lab 05: NYC Flights 13
## Author: Your Name



## Task 02: Create a new script called Lab05.R
library(tidyverse)
library(nycflights13)

airlines <- airlines
airports <- airports
planes   <- planes
weather  <- weather
```

### Task 03: Primary Keys (Planes)

- A primary key is the column (sometimes columns) which are guaranteed
  to be unique in that table. For example, in the `planes` table, the
  column `tailnum` is the primary key.
- Copy/paste the following code chunks into your R Script.

```
## Task 03: Primary Keys (Planes)

## How many rows of data are in planes?
rows_planes <- planes %>% nrow()

## How many unique entries do we have for tailnum?
unique_tailnum <- planes %>% select(tailnum) %>% distinct() %>% nrow()

## This tests for equality. If you did everything right, it should return TRUE.
rows_planes == unique_tailnum
```

The planes data set has 3,322 rows, shown as `obs` in RStudio. There
are 3,322 unique (distinct) tailnums in the `tailnum` column. Let's do
the same thing to model to prove the point.

```
## How many rows of data are in planes?
rows_planes <- planes %>% nrow()

## How many unique entries do we have for tailnum?
unique_model <- planes %>% select(model) %>% distinct() %>% nrow()

## This tests for equality. If you did everything right, it should return TRUE.
rows_planes == unique_model
```

This should return FALSE, because while there are STILL 3,322 rows of
data in `planes`, there are only 127 unique entries in model. This
means at least some of the models have more than one entry. Another
way to explain the idea of a primary key is that this column (or
columns) can be used to return a single row of data. For example, run
the following code chunk.

```
## Using tailnum, we can identify a single, unique plane in planes.
## Once you know the primary key, you should also know more about the
## grain of the table.
planes %>% filter(tailnum == "N137DL")

## N137DL was built by BOEING. It was built in 1991, so it is probably safe to
## ride on. It isn't a 737 MAX. But to prove that manufacturer is not the 
## primary key, try this:
planes %>% filter(manufacturer == "BOEING")
```

The gain of the planes table should be obvious. It is a set of planes!
Each row in the planes table is a unique plane (tailnum), not a unique
plane manufacturer. Afterall, BOEING has a long history of making
planes. Of course, we could design a table where the grain of the data
was manufacturer.



### Task 03: Primary Keys (Airports)

- Your task is to figure out which column in the `airports` table is
  the primary key. Feel free to use some of the code from Task 02 to help you.
- If you want more information about the `airports` table, you can use
  R's built-in help tool. Data sets that come with an R package, like
  `airports` are required to come with documentation. To see it enter
  `?airports` in the console. This works the same way all
  documentation works in R. For example, to read the documentation for
  the `nrow` function, you can use this: `?nrow`.
- Reading the documentation (sometimes called metadata) about a table
  is always a good idea, when it is available.
- Copy/paste the following code chunk into your R script.

```
## Task 03: Primary Keys (Airports)

## Your code here!
```

- Once you have figured out the primary key, please answer Question 01
  in canvas. What is the primary key of the `airports` table?
- Your options are: 
    - alt
    - dst
    - faa
    - lat
    - lon
    - name
    - tz
    - tzone


