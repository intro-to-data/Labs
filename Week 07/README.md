Preamble
========

This lab has two goals:

1.  Help you go further with your understanding of relational data.
2.  Prepare for the mid-term.

To do so, this lab takes a slightly different structure. Rather than
present a series of tasks with increasingly complex ideas, I will ask
you a series of “research questions”. I will then help you break down
the steps you will need to complete in order to answer these research
questions and provide some code stubs to get you started.

![](https://imgs.xkcd.com/comics/substitute.png)

Lab
===

Init
----

Copy/paste the following code into your lab `.R` file for this week.
This is the same code stub we used on Thursday to download the database
and load the tables.

``` r
## INIT ========================================================================
library(tidyverse)
library(DBI)



## DATA =======================================================================
download.file(url = "https://github.com/intro-to-data/Data/raw/master/chinook.db",
              destfile = "chinook.db",
              mode = "wb")
con <- dbConnect(RSQLite::SQLite(), dbname = "chinook.db")
dbListTables(con)
```

    ##  [1] "albums"          "artists"         "customers"      
    ##  [4] "employees"       "genres"          "invoice_items"  
    ##  [7] "invoices"        "media_types"     "playlist_track" 
    ## [10] "playlists"       "sqlite_sequence" "sqlite_stat1"   
    ## [13] "tracks"

``` r
Albums          <- dbReadTable(con, "albums") %>% as_tibble()
Artists         <- dbReadTable(con, "artists") %>% as_tibble()
Customers       <- dbReadTable(con, "customers") %>% as_tibble()
Employees       <- dbReadTable(con, "employees") %>% as_tibble()
Genres          <- dbReadTable(con, "genres") %>% as_tibble()
InvoiceItems    <- dbReadTable(con, "invoice_items") %>% as_tibble()
Invoices        <- dbReadTable(con, "invoices") %>% as_tibble()
MediaTypes      <- dbReadTable(con, "media_types") %>% as_tibble()
PlaylistsTracks <- dbReadTable(con, "playlist_track") %>% as_tibble()
Playlists       <- dbReadTable(con, "playlists") %>% as_tibble()
Tracks          <- dbReadTable(con, "tracks") %>% as_tibble()
dbDisconnect(con)
```

To test if you have successfully loaded the data, try to run the
following code chunk. You should get the same results I do below.

``` r
Playlists %>% arrange(Name) %>% head()
```

    ## # A tibble: 6 x 2
    ##   PlaylistId Name                     
    ##        <int> <chr>                    
    ## 1          5 90’s Music               
    ## 2          4 Audiobooks               
    ## 3          6 Audiobooks               
    ## 4         11 Brazilian Music          
    ## 5         12 Classical                
    ## 6         13 Classical 101 - Deep Cuts

You should get back the first six rows of the `Playlists` table, which
should include exciting playlist names such as:

| PlaylistId | Name                      |
|:----------:|:--------------------------|
|      5     | 90’s Music                |
|      4     | Audiobooks                |
|      6     | Audiobooks                |
|     11     | Brazillian Music          |
|     12     | Classical                 |
|     13     | Classical 101 - Deep Cuts |

I confess, I don’t understand everyone’s fascination with audiobooks.
There’s a book, which you should read. If it isn’t good enough to read,
why would you pay someone to read it to you?

It is worth pointing out there are two playlists with the same name. In
this case, “Audiobooks”. But note how they have different PlaylistId
numbers. This *is* important:

| Column Name | Column Use       |
|:------------|:-----------------|
| PlaylistId  | Primary Key      |
| Name        | Information/Data |

A primary key *MUST* be unique. It cannot have a duplicate (dupe). The
playlist names can dupe (although doing so will cause some confusion
among the humans) but for the database, `PlaylistId` “4” and “6” *are*
unique.

Task 01. Where are my Audiobook playlists?
------------------------------------------

In `Playlists`, there are two “Audiobooks” playlists. Or, are there?
Take a look at the following code chunks. The results may be surprising
(although they are correct). Your goal is to be able to explain why:

``` r
## Task 01. Where are my audiobook playlists?

Playlists %>%
    group_by(Name) %>%
    count() %>%
    ## Only return those Playlists with a duped name.
    filter(n > 1) %>%
    arrange(desc(n))
```

    ## # A tibble: 4 x 2
    ## # Groups:   Name [4]
    ##   Name           n
    ##   <chr>      <int>
    ## 1 Audiobooks     2
    ## 2 Movies         2
    ## 3 Music          2
    ## 4 TV Shows       2

According to this, there are two playlists each for “Audiobooks”,
“Movies”, and “Music”. Each of these playlist names has a duplicate, but
no name is duped more than twice. Fortunately, `PlaylistId` is never
duped.

``` r
## Task 01. Where are my audiobook playlists?

Playlists %>%
    group_by(PlaylistId) %>%
    count() %>%
    ## Only return those Playlists with a duped PlaylistId.
    filter(n > 1) %>%
    arrange(desc(n))
```

    ## # A tibble: 0 x 2
    ## # Groups:   PlaylistId [0]
    ## # … with 2 variables: PlaylistId <int>, n <int>

So, we would expect the following code to return TWO rows of data:

``` r
Playlists %>%
    inner_join(PlaylistsTracks, by="PlaylistId") %>%
    filter(Name == "Audiobooks") %>%
    group_by(Name, PlaylistId) %>%
    ## Here, I am only counting the unique values of TrackId
    ## which are not NA.
    summarize(n = length(unique(TrackId[!is.na(TrackId)])))
```

    ## # A tibble: 0 x 3
    ## # Groups:   Name [0]
    ## # … with 3 variables: Name <chr>, PlaylistId <int>, n <int>

But, the code returns *NOTHING*. What happened? To help us understand,
it might help to look at the following code chunk. The ONLY thing that
differs between the two code chunks is that I replaced `inner_join()`
with `left_join()`.

``` r
Playlists %>%
    left_join(PlaylistsTracks, by="PlaylistId") %>%
    filter(Name == "Audiobooks") %>%
    group_by(Name, PlaylistId) %>%
    ## Here, I am only counting the unique values of TrackId
    ## which are not NA.
    summarize(n = length(unique(TrackId[!is.na(TrackId)])))
```

    ## # A tibble: 2 x 3
    ## # Groups:   Name [1]
    ##   Name       PlaylistId     n
    ##   <chr>           <int> <int>
    ## 1 Audiobooks          4     0
    ## 2 Audiobooks          6     0

``` r
## If I didn't apply that little bif of complexity in the summarize
## command, the code would show a single value for each which is
## misleading. Feel free to experiment.
```

To better understand, look at the following code chunks:

``` r
Playlists %>%
    inner_join(PlaylistsTracks, by="PlaylistId") %>%
    filter(Name == "Audiobooks")
```

    ## # A tibble: 0 x 3
    ## # … with 3 variables: PlaylistId <int>, Name <chr>, TrackId <int>

``` r
Playlists %>%
    left_join(PlaylistsTracks, by="PlaylistId") %>%
    filter(Name == "Audiobooks")
```

    ## # A tibble: 2 x 3
    ##   PlaylistId Name       TrackId
    ##        <int> <chr>        <int>
    ## 1          4 Audiobooks      NA
    ## 2          6 Audiobooks      NA

Remember, you can always run just part of a code chunk. If you get
unexpected returns, you can (must) debug your code by taking the
complexity out of it step-by-step to see where things go wrong. In this
case, the answer isn’t wrong, merely unexpected and inconvenient. If you
can’t and find tracks in the Audiobook playlist, how are you going to
answer a bunch of questions about it?

This leads us to the epistemological question, can you have a playlist
with no tracks? Can you?

If you still aren’t sure what is going on, I recommend reviewing
[mutating
joins](https://r4ds.had.co.nz/relational-data.html#mutating-joins) from
our text. When you think you are ready, go to canvas and see if you can
get the right answer to the very important question waiting for you
there.

Task 02. Which playlist name has the most tracks?
-------------------------------------------------

Using the code from Task 01, which playlist has the most tracks? You can
use `inner_join()` for this task.

``` r
## Task 02: Which playlist name has the most tracks?
Playlists %>%
    inner_join()
```

Task 03: How many tracks in Music, where `PlaylistID == 8`?
-----------------------------------------------------------

Based on your code above OR a slight tweak of it, how many tracks are in
the Playlist named “Music” with `PlaylistId == 8`?

**Hint:** Depending on how you wrote your code for Task 02, getting the
right answer may seem unnecessarily hard. Remember, programming is the
art of being painfully specific. It is even more fun because human
language is frequently vague and the people who write questions for
analysts never know what they are talking about.

**Hint:** The function, `foo()` is not a function. It is a placeholder
for all the *awesome* you are about to do.

\`\`\`{r echo = FALSE, eval = FALSE} \#\# Task 03: How many tracks in
Music, where PlaylistID == 8? Playlists %&gt;% foo()

\`\`\`

`{r echo = FALSE, eval = FALSE} ## Task 03: How many tracks in Music, where PlaylistID == 8? Playlists %>%     filter(PlaylistId == 8) %>%     inner_join(PlaylistsTracks, by="PlaylistId") %>%     group_by(PlaylistId, Name) %>%     count()`

Task 04: Media Type
-------------------

The table, `MediaTypes`, is a reference table. It maps `MediaTypeId` to
a name of each media type. You can find this same column name in the
`Tracks` table. A reference table differs from a table like `Customers`
in that the values of a reference table are defined by our
internal/external business logic. It is a reference for a value. A table
like `Customers` houses actual data.

The `MediaTypes` table helps us answer two questions:

1.  Which media type has the most tracks?
2.  What is the total play length of this media type (in milliseconds)?

You can answer this with a single bit of code. First you need to join
`Tracks` and `MediaTypes`. Then `group_by()` the media type. Finally,
use `summarize()` to count the number of each media type track AND
`sum()` the length of each media type. Your previous code uses different
tables, but should help you get started.

There is one “gotcha” to this task. There is a `Name` column in both
`Tracks` and `MediaTypes`. In R, two columns ARE NOT allowed to have the
same name, which they would after the join. You could rename the `Name`
column in one table, or let R handle this for you. If you let R handle
this, the column `Name` from `Tracks` will become `Name.x` and `Name` in
`MediaTypes` will become `Name.y`. I let R rename the columns for me,
but doing so has implications for how I should write my `group_by()`
command.

Because it may make it easier, the code stub I am providing below will
create a new table called TrackMediaTypes. Complete the join and create
`TrackMediaTypes`. Then perform any grouping and filtering you need on
`TackMediaTypes`. Remember, you can use RStudio to view your data, which
may make it easier to get the column names for the `group_by()`.

Little steps make complex things easier!

``` r
## Task 04: Media Type
TrackMediaTypes <- 
    Tracks %>%
    inner_join()

TrackMediaTypes %>%
    group_by() %>%
    summarize()
```

In canvas, you will find that this task has two questions associated
with it.

Task 05: Who is the best customer?
----------------------------------

Who is our best customer? Using `FirstName` and `LastName` from
`Customers`, tell me which customer has spent the most money at the
store. To calculate total money spent, look at the `Total` column in
`Invoices`.

This is just like some of the other tasks we have done. Join the two
tables, group by `FirstName`, `LastName`, and `CustomerId` and then find
the `sum()` of the `Total` column. Make sure you include `CustomerId` in
your grouping. Wouldn’t you feel silly if two customers have the same
name and combined they have the most purchases?

I recommend first making a `CustomerInvoices` table. You will use this
new table for several tasks below.

**Hint:** Invoice value is in the `Total` column.

``` r
## Task 05: Who is the best customer?

CustomerInvoices <- 
    Customers %>%
    inner_join()
```

Task 06: Which country is the best customer?
--------------------------------------------

Rather than group by customer-specific identifiers, now you need to
`group_by()` by `Country`. Then tell me which country has made the
highest total number of purchases AND the highest average purchase. This
will be two different questions on Canvas.

1.  Which country has spent the most total money?
2.  Which country has the highest average purchase price?

**Hint:** The country with the most total purchases may not be the
country with the highest average purchase. Life == complicated.

If you followed directions in Task 05 and created a `CustomerInvoices`
table, congratulations! You can use that table to complete this task. If
you didn’t, well, you are going to have to join `Customers` and
`Invoices` together again. My condolences.

``` r
## Task 06 Which country is the best customer?
## Which country has spent the most total money?
CustomerInvoices %>%
    group_by() %>%
    summarize()

## Task 06 Which country is the best customer?
## Which country has the highest average purchase price?
CustomerInvoices %>%
    group_by() %>%
    summarize()
```

Task 07: Graphing Invoice Value by Country
------------------------------------------

Above you calculated the total value of invoices from a country AND you
calculated the average value of an invoice from a country. Now, I want
you to look at the distribution of invoice values by country. Using
ggplot, create a box & whiskers plot
([hint](https://ggplot2.tidyverse.org/reference/geom_boxplot.html)) of
invoice totals by country. To complete this task, you should use
`CustomerInvoices`, again. For each country, I would like to see the
distribution of invoice values in your plot.

**Hint 01:** The dark bar in the “middle” of the box shows us the median
value.

Questions:

-   Which country has the highest median invoice value? If you don’t
    trust yourself, feel free to adjust your transformation from the
    previous task to calculate the per country median and confirm what
    you see in the plot.
-   Which country has the largest variance of invoice value? (Think
    about what that means for the average invoice value of this
    country.)
-   Which country has the single biggest invoice?
-   Please upload your graph.

Because there are many countries, reading a ggplot graph where the text
is horizontal would be <sub>difficult</sub> impossible. To help, I am
providing some help in the code stub below. It will work best if the
`theme()` command is the last line of your `ggplot()`. You are
responsible for the rest of the code to make the plot work. And no,
there is no `geom_foo()`. You need to figure out the name of the
function. I did give you a hint.

``` r
## Task 07: Graphing Invoice Value by Country
## 
ggplot() +
    geom_foo() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .25))
```

Task 08: Graphing Importance Of Volume
--------------------------------------

-   Is there a relationship between the number of Invoices from a
    country and the total value of Invoices from that country? In other
    words, does the number of Invoices predict the total value of
    purchases?
-   Is there a relationship between the number of Invoices from a
    country and the average value of an Invoice from that country? In
    other words, does the number of Invoices predict the average value
    of a purchase?
-   Based on this data, which do you feel you would be able to predict
    more accurately? Total value of invoices per country of the average
    value of invoices per country?

To complete this task, you will need to create another new table. I
would call it `CountryTotals`. Take the data in `CustomerInvoices` and
group by the `Country` column. You will need to transform the data
(which will change the grain of the data) to give you the per country:

-   `sum()` of Total
-   `mean()` of Total
-   `median` of Total
-   `length()` Number of Invoices

Once you have these calculated values in `CountryTotals`, use this new
grain of data to anser the questions above. You will need to use ggplot
to produce two scatter plots. The number of invoices per country should
be the X-Axis. The total value of invoices and the average value price
should be the Y-Axis. I recommend graphing the regression line (linear).
Once you have done so, you should be able to answer the questions.

Again, there is a text-related issue to making these plots. I have
provided you some code in `geom_text()` which should help.

``` r
## Task 08: Graphing Importance Of Volume

## CountryTotals
CountryTotals <-
    CustomerInvoices %>%
    foo()

## Y-Axis = sum of Total
ggplot() +
    geom_foo() +
    geom_text(aes(label = Country), hjust = 1, vjust = -1)

## Y-Axis = average of Total
ggplot() +
    geom_foo() +
    geom_text(aes(label = Country), hjust = 1, vjust = -1)
```

Task 09: Please upload your .R file.
------------------------------------

Upload your .R file in Canvas and good luck on the midterm exam!
