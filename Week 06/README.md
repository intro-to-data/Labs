Preamble (Andy’s long ramble)
=============================

The goal of this lab is help prepare you for the mid-term. To that end,
it will focus on the types of tasks you will be asked to perform in
order to ace the mid-term. This lab may take longer than others we have
done, but I hope you will find it useful.

![](https://imgs.xkcd.com/comics/scantron.png)

Before we begin, I do want to apologize for canceling this week’s class.
It was, unfortunately, the best decision I could make. As of Friday
afternoon, I am still fighting an intermittent fever. This year’s flu is
a nasty beast. Please take care of yourselves.

Topics which will be tested directly and links to relevant portions of
our text:

-   Data Import: [Data Import -
    R4DS](https://r4ds.had.co.nz/data-import.html)
    -   CSV: `read_csv()`
    -   Excel: `read_excel()`
-   Data Graphing (ggplot): [Data Visualisation -
    R4DS](https://r4ds.had.co.nz/data-visualisation.html)
    -   Scatter plots: `geom_point()`
    -   Box plot: `geom_boxplot()`
    -   Bar plot: `geom_bar()`
    -   Column: `geom_col()`
    -   Using color and facets to compare groups.
-   Exploratory Data Analysis:
    [EDA](https://r4ds.had.co.nz/exploratory-data-analysis.html)
-   Single Table data manipulation:
    [Transform](https://r4ds.had.co.nz/transform.html)
    -   Filtering data: `filter()`
    -   Ordering data: `arrange()`
    -   Select columns: `select()`
    -   Creating new columns: `mutate()`
    -   Summary/Aggregate calculations: `summarize()`
    -   Grouping: `group_by()`

Other topics, such as creating a project, writing a script, etc. will be
implicitly part of the mid-term.

This year’s mid-term will not include relational data. We will discuss
relational data further during our next class, but I do not feel it is
fair to include this topic on the mid-term this year. But it will be
part of the final exam.

Before we get to the lab, I want to take some time and try to clear up
some ideas which I think are causing confusion.

Tidyverse
---------

What the heck is the Tidyverse? Well, it is a R meta-package! And a
meta-package is a collection of packages. All very clear now, *yes*?

![](https://imgs.xkcd.com/comics/inside_joke.png)

So what is a package? Well, that is harder to answer. A formal answer
can be taken from Hadley Wickham, who wrote most of the tidyverse
packages:

> In R, the fundamental unit of shareable code is the package. A package
> bundles together code, data, documentation, and tests, and is easy to
> share with others. As of January 2015, there were over 6,000 packages
> available on the Comprehensive R Archive Network, or CRAN, the public
> clearing house for R packages. This huge variety of packages is one of
> the reasons that R is so successful: the chances are that someone has
> already solved a problem that you’re working on, and you can benefit
> from their work by downloading their package.

– Hadley Wickham, in [R packages](http://r-pkgs.had.co.nz/intro.html)

The best analogy I have ever come up with, is to compare R packages to
the Apple App Store or Google Play store for your cell phone. From the
moment you first turned it on, your phone, came with many useful tools:

-   browser,
-   text app,
-   email,
-   phone app (do people still use these?),
-   calendar,
-   etc.

These are core applications (functions) a cell-phone needs in order to
be minimally useful. Can you imagine paying money for a phone that
didn’t include a browser or or having to pay extra to text your Mom?

[Base R](https://rstudio.com/wp-content/uploads/2016/05/base-r.pdf)
provides many functions which are useful for statistical programming.
For example, Base R includes a set of data types, common statistical
functions for calculating aggregate statistics (`mean()`, `sd()`), and
includes functions for linear and logistic regression modeling. These
Base R functions are the programming equivalent of having a browser and
email installed on your phone by default.

Let’s return to our phone analogy. Although the base apps are important,
I assume you have installed one or more apps on your phone beyond those
it came with. You may have installed a video game, or chat application.
Perhaps you are an Instagrammer, or maybe you just use Canvas on your
phone. When your phone needs additional functionality, you install an
application to make it easier for your phone to do something.

You *could* Instagram tonight’s Ramen noodles using Safari, but it is
easier to install the Instagram app. Or, at least, that’s what the
Millenials tell me. :-)

Packages serve a similar role, for R. The tidyverse is a set of
functions which make programming in R easier. We *could* use Base R for
this course. None of you would like it very much and I would have to
teach you even more complex programming techniques, but we *could* do
it. Just like you *can* Instagram with Safari. But it is easier to
install the tidyverse and program in a more modern style of R. The
tidyverse is, itself, composed of a number of smaller packages such as:

-   [ggplot](https://ggplot2.tidyverse.org/reference/)
-   [dplyr](https://dplyr.tidyverse.org/reference/)
-   etc.

Hint: Those last two links are really useful. Did I mention the mid-term
is open-book?

If this topic interests you, here are two links worth perusing:

-   [Available CRAN Packages By
    Name](https://cran.r-project.org/web/packages/available_packages_by_name.html):
    These are all free and can be installed via `install.packages()`.
-   [Welcome to the
    Tidyverse](https://tidyverse.tidyverse.org/articles/paper.html):
    Hadley’s rationale for why he wrote the Tidyverse.

Functional Composition
----------------------

Now, for a word (or two) on functional composition. A computer program
is nothing more than a list of instructions. These instructions, called
functions, allow us to embed complex logic into the program. Some
programming languages, such as SAS and SPSS have a relatively small
number of core functions, which have a large number of parameters,
sub-commands, and features. For example, the SAS `DATA step`. Other
programming languages such as R and Python have many more commands,
which each do one little thing. Either approach allows the programmer to
create very complex programs, but *how* they do so differs.

In a programming language such as R, we must string together a series of
related commands to accomplish complex tasks such as plotting, data
transformation, etc. The art of assembling many small commands together
to act as a cohesive unit is called functional composition. We have
encountered three forms of functional composition in our class.

1.  ggplot: `ggplot() + geom_point()`
2.  dplyr: `foo %>% filter() %>% summarize()`
3.  Nested functions: `foo(baz(0))`

It is important for you to understand each approach is fundamentally
doing the same thing, which is passing the results from one function to
another function. This way, you the user, can create code blocks of
arbitrary complexity, depending on your needs and programming skills,
which should grow over time. Which you should use depends on what you
are doing.

First, we will examine the ggplot approach. Each plot made with ggplot
is actually a composition of several functions. For example, a scatter
plot showing the relationship between sepal width and length in the
[iris](https://en.wikipedia.org/wiki/Iris_(plant)) dataset looks like
this:

``` r
library(tidyverse)
```

    ## ── Attaching packages ────────────────────────────────── tidyverse 1.3.0 ──

    ## ✔ ggplot2 3.2.1     ✔ purrr   0.3.3
    ## ✔ tibble  2.1.3     ✔ dplyr   0.8.4
    ## ✔ tidyr   1.0.2     ✔ stringr 1.4.0
    ## ✔ readr   1.3.1     ✔ forcats 0.4.0

    ## ── Conflicts ───────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
## Load the data
data(iris)
iris <- as_tibble(iris)

## ggplot composition
ggplot(data = iris, mapping = aes(x = Sepal.Width, y = Sepal.Length, color = Species)) +
    geom_point() +
    facet_wrap(~Species)
```

<img src="README_files/figure-markdown_github/unnamed-chunk-1-1.png" style="display: block; margin: auto;" />

Today, I want to re-visit what all of this code is ACTUALLY doing. We
will focus onthe ggplot composition. To produce that single plot, we
used three functions:

<table>
<colgroup>
<col style="width: 27%" />
<col style="width: 25%" />
<col style="width: 47%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Command</th>
<th style="text-align: left;">Description</th>
<th style="text-align: center;">Operator</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><code>ggplot()</code></td>
<td style="text-align: left;">Creates the plotting object (our canvas), identifies the data source, assigns values to the X and Y axes, and tells plotting how to assign colors.</td>
<td style="text-align: center;"><code>+</code></td>
</tr>
<tr class="even">
<td style="text-align: left;"><code>geom_point()</code></td>
<td style="text-align: left;">Tells plotting to create a scatter plot.</td>
<td style="text-align: center;"><code>+</code></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><code>facet_wrap()</code></td>
<td style="text-align: left;">Stratifies the plot into three plots, one for each species.</td>
<td style="text-align: center;"></td>
</tr>
</tbody>
</table>

Alone, these functions are practically useless. For example, the
following “plot” is valid R syntax, but not very useful. Note that the
last command, `facet_wrap()` is not followed by a `+` sign, because it
terminates the functional composition.

``` r
ggplot(data = iris, mapping = aes(x = Sepal.Width, y = Sepal.Length, color = Species))
```

<img src="README_files/figure-markdown_github/unnamed-chunk-2-1.png" style="display: block; margin: auto;" />

And, if you run `geom_point()` by itself, the results is not interesting
at all:

``` r
geom_point()
```

    ## geom_point: na.rm = FALSE
    ## stat_identity: na.rm = FALSE
    ## position_identity

Yet, each command in the plotting composition plays a vital role in
defining our final plot. Think of each function as adding a layer to our
plot, much like a master painter adds layers of paint to their
masterpiece. No single layer is worth hanging on your wall, but
combined, they are a composition worth considering.

Now, let’s compare this to a dplyr composition. What is the average
petal length by iris species? We can answer this question this with the
following composition:

``` r
iris %>%
    group_by(Species) %>%
    summarize(AvgPetalLength = mean(Petal.Length))
```

    ## # A tibble: 3 x 2
    ##   Species    AvgPetalLength
    ##   <fct>               <dbl>
    ## 1 setosa               1.46
    ## 2 versicolor           4.26
    ## 3 virginica            5.55

We can see Virginica has the longest average petal length. Now, let’s
break this down like we did for ggplot:

Command \| Description \| Operator \|  
`iris` \| Identifies the data set we want to act on. This is broadly
similar to `ggplot(data = iris)`, but because we aren’t drawing anything
we don’t need a new object, we just need to identify which object we
want to act on. \| `%>%` \|  
`group_by()` \| Identifies which column(s) to group by. In this case,
`Species`. \| `%>%` \|  
`summarize()` \| Returns the descriptive statistic. In this case, the
mean petal length. \| \|

Individually, these commands are not very interesting. For example, if
we just want to see our data, this works great.

``` r
iris
```

    ## # A tibble: 150 x 5
    ##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ##           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
    ##  1          5.1         3.5          1.4         0.2 setosa 
    ##  2          4.9         3            1.4         0.2 setosa 
    ##  3          4.7         3.2          1.3         0.2 setosa 
    ##  4          4.6         3.1          1.5         0.2 setosa 
    ##  5          5           3.6          1.4         0.2 setosa 
    ##  6          5.4         3.9          1.7         0.4 setosa 
    ##  7          4.6         3.4          1.4         0.3 setosa 
    ##  8          5           3.4          1.5         0.2 setosa 
    ##  9          4.4         2.9          1.4         0.2 setosa 
    ## 10          4.9         3.1          1.5         0.1 setosa 
    ## # … with 140 more rows

But it does not provide us with our summary statistics. And we can add
the `group_by()`, but it doesn’t actually *do* anything interesting,
until we add a `summarize()`.

``` r
iris %>%
    group_by(Species)
```

    ## # A tibble: 150 x 5
    ## # Groups:   Species [3]
    ##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ##           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
    ##  1          5.1         3.5          1.4         0.2 setosa 
    ##  2          4.9         3            1.4         0.2 setosa 
    ##  3          4.7         3.2          1.3         0.2 setosa 
    ##  4          4.6         3.1          1.5         0.2 setosa 
    ##  5          5           3.6          1.4         0.2 setosa 
    ##  6          5.4         3.9          1.7         0.4 setosa 
    ##  7          4.6         3.4          1.4         0.3 setosa 
    ##  8          5           3.4          1.5         0.2 setosa 
    ##  9          4.4         2.9          1.4         0.2 setosa 
    ## 10          4.9         3.1          1.5         0.1 setosa 
    ## # … with 140 more rows

Now, the returns show something (mildly) they did not previously:

``` r
# A tibble: 150 x 5
# Groups:   Species [3]
```

**IMPORTANT:** You only use the `+` operator to do functional
composition when programmig a plot. Think of it as “adding” a layer to
your plot. Do not use `+` to do functional composition for data
transformations. In a dplyr composition, it is easier to think of each
function as a member of a relay race. Each function needs to take the
baton/data, and do something (run around the track). Then, when it is
done, it hands the baton/data off to the next function. When doing data
transformations, use `%>%` for the compositional operator.

<center>

![](https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Relay_race_baton_pass.jpg/270px-Relay_race_baton_pass.jpg)

</center>

Finally, we have nested functions. These are functions wrapped around
functions. This is actually the most traditional form of functional
composition, although we use it less frequently when programming in the
tidyverse. Let’s say we want to know the average petal length, like
before, but we want to round off the average petal length to the nearest
centimeter. Our code will be ALMOST exactly like was before, with one
additional function, `round()`.

``` r
iris %>%
    group_by(Species) %>%
    summarize(AvgPetalLength = round(mean(Petal.Length),0))
```

    ## # A tibble: 3 x 2
    ##   Species    AvgPetalLength
    ##   <fct>               <dbl>
    ## 1 setosa                  1
    ## 2 versicolor              4
    ## 3 virginica               6

Our results are now rounded to the nearest centimeter. Let’s break this
down. In your mind, think of this working as follows:

Command \| Description \|  
`m <- mean(Petal.Length)` \| Calculates the mean petal length, and
assigns the value to the variable `m`. \|  
`round(m, 0)` \| Round the value of m to the nearest centimeter, by the
normal rules of rounding you learned in the second grade. \|

But, with functional composition, we avoid the need to create the
variable `m` explicitly. Instead of creating a variable `m`, which we
don’t actually want, we simply take the results of our first function
`mean()` and pass them directly to our second function, `round()`.

Another way to think about wrapped functions is that they are similar to
this:

``` r
iris %>%
    group_by(Species) %>%
    summarize(AvgPetalLength = mean(Petal.Length)) %>%
    mutate(AvgPetalLength = round(AvgPetalLength, 0))
```

    ## # A tibble: 3 x 2
    ##   Species    AvgPetalLength
    ##   <fct>               <dbl>
    ## 1 setosa                  1
    ## 2 versicolor              4
    ## 3 virginica               6

This gets us the EXACT same answer as our first composition, but it
takes an additional dplyr step. This second way of doing this is
“correct”, but it may be slower for very large/complex analyses.

Another perspective on nested functions. The following code is hard to
read, but you can see the results match, but the methodology

``` r
summarize(group_by(iris, Species),
          AvgPetalLength = round(mean(Petal.Length),0))
```

    ## # A tibble: 3 x 2
    ##   Species    AvgPetalLength
    ##   <fct>               <dbl>
    ## 1 setosa                  1
    ## 2 versicolor              4
    ## 3 virginica               6

I prefer to read the dplyr approach, although the code above is
functionally identical. If you think back to some of our earlier
classes, I used this language. But, at the time this as all so new and
confusing that it probably went in one ear and out the other. If you are
coming from a language like SAS or SPSS, this may seem overwhelming.
Functional composition is, however, an idea that is found in all
C-derived languages written in the last umpteen years. Depending on the
language, it may have very different syntax, but the concept is exactly
the same.

Lab 06
======

And now, after all that, let’s do our lab!

Setup
-----

1.  Use RStudio to create a new project called “Mid-term Review”.
    ([RStudio
    Projects](https://r4ds.had.co.nz/workflow-projects.html#rstudio-projects))
2.  We will use two data sets for this week’s lab:
    -   [births.csv](https://github.com/intro-to-data/Data/blob/master/births.csv)
        (which you have seen before)
    -   [MedicaidNewbornLowBirthWeightByCounty.csv](https://github.com/intro-to-data/Data/blob/master/MedicaidNewbornLowBirthWeightByCounty.csv)
        (which you have not seen before)
3.  To keep things relatively simple, we will open the data directly
    through R. Create a file called `Lab 06.R` and copy/paste the
    following:

``` r
## INIT ========================================================================
library(tidyverse)



## VARS ========================================================================
births_url <- "https://github.com/intro-to-data/Data/raw/master/births.csv"
lbw_url <- "https://github.com/intro-to-data/Data/raw/master/MedicaidNewbornLowBirthWeightByCounty.csv"



## DATA ========================================================================
CountyLBW <- read_csv(lbw_url)
```

    ## Parsed with column specification:
    ## cols(
    ##   Year = col_double(),
    ##   County = col_character(),
    ##   Burrough = col_character(),
    ##   Region = col_character(),
    ##   Upstate = col_logical(),
    ##   LowBirthWeightNewborns = col_double(),
    ##   NewbornPopulation = col_double()
    ## )

``` r
CountyLBW$Year <- factor(CountyLBW$Year)

## How can we import the births data into a tibble called AlbanyBirths?
## Your Code Here!
```

1.  The code provided in Step 03 is incomplete. It creates a tibble
    called LBW, which contains our Low Birth Weight data. It does not
    create a tibble called AlbanyBirths, which you will later need. Your
    task is to create Albany Births.

    You will aso need to take advantage of he following code to clean up
    the column names to make it easier to work with.

``` r
## The column names for AlbanyBirths stink. This code will fix that.
## Copy/paste this code into your .R script and make sure you have run
## everything.
names(AlbanyBirths) <- c("X1", "Facility", "Insurance", "Gender", "LengthOfStay", "Admitted", "Discharged", "BirthWeight", "TotalCharges")
```

Low Birth Weight
----------------

Low Birth Weight (LBW) ([Low Birth Weight -
Wikipedia](https://en.wikipedia.org/wiki/Low_birth_weight)) is defined
by World Health Organization as a birth weight of 2,499 grams (5.51 lbs)
or less, regardless of gestational age. Simplistically, LBW is caused by
one of two factors (or a combination of the two).

1.  Preterm birth: birth prior to 37 weeks of gestational age
2.  Small for gestational age: below average prenatal growth

Of course, the causes for these two problems are many. As we will see
later in this lab, LBW babies tend to cost more than other babies.

The `CountyLBW` dataset you have opened is a modified version of the
Health Data New York [Medicaid Newborn Low Birth Weight Rates by
County](https://health.data.ny.gov/Health/Medicaid-Inpatient-Prevention-Quality-Indicator-PQ/aapx-etcg).
It contains data for CY 2012 and 2013. Unfortunately, more recent data
is not available. It contains the following columns:

-   `Year`: The year of the hospital discharge for the newborn. (either
    2012 or 2013)
-   `County`: The newborn’s county of residence at time of discharge.
    Hospital discharges that did not have an accurate New York State
    county were excluded.
-   `Burrough`: The newborn’s burough or residence. Only relevant for
    children born in New York City. For all other newborns, this columns
    is `NA`.
-   `Region`: The newborn’s region of residence. [Regions of New York
    (state) -
    Wikipedia](https://en.wikipedia.org/wiki/Category:Regions_of_New_York_(state))
-   `Upstate`: The newborn was born in Upstate New York (TRUE) or not
    (FALSE)
-   `LowBirthWeightNewborns`: Total number of Medicaid low birth weight
    newborn discharges in a county population that meet the criteria for
    low birth weight.
-   `NewbornPopulation`: Total number of newborn Medicaid enrollees in a
    county population.

It is very important you remember that the grain of the CountyLBW data
set is Medicaid Births *per county*. However, the data contains enough
information for us to create new data sets at higher aggregated grains.
For example, we will examine births per region, but we cannot examine
births per zip code.

### Analysis

As always, put your code into your .R file and upload it at the end of
the lab. For each task I have given you a code stub to start from. It is
your job to finish it. Very few, if any, of the code stubs actually work
as shown below.

1.  Create a scatter plot showing the number of Medicaid births per year
    for each county. From 2012 to 2013, did the number of births go up
    or down? To help you, try adding `group = County` to your aesthetic
    mapping (`aes()`) and after your `geom_point()`, add a
    `geom_line()`. If your code has two vertical lines, look at your
    aesthetic mapping.

``` r
## Task 01: Scatter plot of the number of Medicaid newborns

ggplot() +
    geom_point() +
    geom_line()
```

1.  Create a statewide summary of Medicaid births in New York for 2012
    and 2013. This will be similar to the `iris` example above, but you
    have to decide which column to group by. The summary function you
    want to use here is `sum()` rather than `mean()` since we want the
    total number of births statewide, not the average. (Average births
    per county statewide doesn’t even mean anything.)

``` r
## Task 02: Statewide summary of Medicaid births

CountyLBW %>%
    group_by() %>%
    summarize()
```

How would you describe change in the number of Medicaid births
statewide?

-   Increasing births.
-   Decreasing births.
-   Some counties increasing, some decreasing.
-   Really hard to say.

Please support your answer. Enter your answer into canvas. There isn’t
one single best answer.

1.  The filter function allows us to perform Boolean tests to reduce the
    number of rows used in the analysis. This is very useful.
    <a href="https://dplyr.tidyverse.org/reference/filter.html" class="uri">https://dplyr.tidyverse.org/reference/filter.html</a>

    Use the filter command to calculate the total number of Medicaid
    births in 2012 and 2013 *in the Finger Lakes region* of New York
    State. Remember, Boolean tests in R use `==` not `=`.

``` r
## Task 03: Total number of Medicaid births in 2012-2013 in the Finger Lakes

CountyLBW %>%
    filter()
```

Enter this count into Canvas.

1.  Using your previous code as a starting point, calculate the total
    number of Medicaid births *in 2012 (only)* in the Finger Lakes
    region. You almost certainly know how to do this with a
    `group_by()`, but in this case, I want you to only use `filter()`.
    You can use a `,` or the `&` symbol to “and” filters.

``` r
## Task 04: Total number of Medicaid births in 2012 in the Finger Lakes

CountyLBW %>%
    filter()
```

Enter this count into canvas.

1.  Which region had the most Medicaid births in 2013? To calculate
    this, you should first filter down to 2013 returns only, and then
    group by region. You know how to find the totals. PLEASE note that
    this changes the grain of the data. The grain of the data becomes
    Medicaid births per region, which is an aggregated set of counties.

    As an analyst, you always want the finest grain of data possibe.
    With enough effort, you can always aggregate data into a higher
    grain. But you cannot disaggregate below what you were
    given/collected. You cannot use this data to tell me anything about
    Medicaid birth in the city of Albany, because the city is a subset
    of the Albany county data. And you cannot know which births happened
    in the city of Albany and which happened in the county.

``` r
## Task 05: Which region had the most Medicaid births in 2013?

CountyLBW %>%
    foo()
```

Please select the region with the most Medicaid births in Canvas. Also,
this answer should **not** surprise you. If you think the right answer
is the North Country region, you are wrong.

1.  Calculating a rate is a very important skill. Our data set includes
    data about LBW Medicaid births. What is the Statewide rate of LBW
    births per 1,000 Medicaid births?

    I know, I know, the head boggles. But if you break this down, you
    know how to do this. This rate will include both 2012 AND 2013 data,
    so no filtering is required. Instead, you must first calculate the
    total newborn population and low birth weight newborns for these two
    years.

    Your answer should pipe (`%>%`) the results of `summarize()` to
    `mutate()`. The `mutate()` function will create a column `Rate`
    which is the rate of low birth weight births per 1,000 Medicaid
    births.

    Hint: To convert a rate to a percent, you multiple it by 100. This
    converts the rate into `N` per 100. But this task wants a `N` per
    1,000.

``` r
## Task 06: What is the Statewide rate of LBW births per 1,000 Medicaid births?
## Yes, this is possible.
CountyLBW %>%
    summarize() %>%
    mutate()
```

1.  Which region had the highest LBW rate per 1,000 Medicaid births?

    This is a minor tweak on the code you wrote for task 06. You will
    use `goup_by()` to complete this task. There are 10 regions in the
    State. R will, by default, order the regions in alphabetical order.
    I suggest you force R to order the results by the `Rate` column
    using `arrange()`. Otherwise, you might not see the true answer.

``` r
## Task 07: Which region has the highest rate of LBW births per 1,000 Medicaid births?
CountyLBW %>%
    arrange()
```

Take a moment to look at your per-region `Rate` calculations. Look at
the spread of those numbers.

-   Highest: 86 LBW births per 1,000 Medicaid births
-   Lowest: 55 LBW births per 1,000 Medicaid births

Take a moment to think about the geographic, demographic, and economic
differences across these regions. Some of the causes of LBW in Manhattan
differ from those in the North Country. Some are the same. A successful
intervention in The Bronx will look nothing like a successful
intervention in Western New York.

Data is powerful, but it often creates as many questions as it answers.

Albany Births
-------------

We used this data previously when we were first starting to graph.
Before going any further, remember that the LBW birth rate per 1,000
Medicaid births for the Capital District was 67.2. Let’s see how that
compares to this data set.

1.  Which births meet the criteria for Low Birth Weight?

    Create a new column called LBW. This should be a TRUE/FALSE column.
    For each birth in AlbanyBirths, determine if the birth qualifies as
    a LBW. In other words, is the birth `weight <= 2499`? This is
    another problem for `mutate()`. However, this time we want to save
    our results back to AlbanyBirths so we can use the column in future
    calculations.

``` r
## Task 08: Which births meet the criteria for Low Birth Weight? 

## SEE HOW THIS CREATES A NEW AlbanyBirths dataset.
AlbanyBirths <- AlbanyBirths %>%
    mutate()
```

1.  Which insurance company has the highest total number of LBW births?

    Create a barplot of the total number of low birth weight births,
    stratified by Insurance.

    Hint: You will need to filter the data going into ggplot because you
    only want to count those rows where `LBW == TRUE`. To do this, you
    have two choice. You can create a new data set (like we did above),
    or apply a filter in the data parameter in
    `ggplot(data = AlbanyBirths %>% filter(), aes())`. You can achieve
    the same results either way.

``` r
## Task 09: Which insurance company has the highest total number of LBW births?
ggplot() +
    geom_col()
```

1.  Is the average birth cost of LBW births higher than non-LBW births?

    This is your last data transformation task. Break this task down. If
    you made it this far, you can do this. Think about the individual
    data transformations you will need to make to complete this task

``` r
## Task 10: Is the average birth cost of LBW births higher than non-LBW births?
```

In Canvase, answer two questions: - Is the average birth cost of LBW
births higher than non-LBW births? (No, Yes) - What is the average cost
of a LBW birth in the Capital District?

1.  Which plot is better?

    This is your last task. Let’s look at some linear regressions of
    birth weight and cost. Create a scatter plot. On the X Axis, put
    `BirthWeight`. On the Y Axis, put `TotalCharges`.

    Then, create a second copy of the plot (copy/paste your code). In
    the aesthetic add, `group = "LBW", color = "LBW"`.

    Create a thid plot, copy/paste the code for your first plot. Do not
    use the code for your second plot. Add a `facet_wrap()` to the end
    of plot composition. Wrap by `LBW`.

    [`geom_smooth()`
    documentation](https://ggplot2.tidyverse.org/reference/geom_smooth.html)
    We are using `method = lm`, to get a linear regression, rather than
    the default loess model. I don’t really like the loess model. IF you
    ’d like to see the difference, delete the `method = lm` part of the
    code. Perhaps you will think this improves the model. I dunno. You
    tell me.

``` r
## Task 11: Which plot is better?

## First Plot
ggplot() +
    geom_point() +
    geom_smooth(method = lm)

## Second Plot
ggplot() +
    geom_point() +
    geom_smooth(method = lm)

## Third Plot
ggplot() +
    geom_point() +
    geom_smooth(method = lm)

## Which plot is better?
```

Go to Canvas and upload your favorite plot and then tell me why you
prefer it. For help exporting the plot from RStudio:
<a href="http://www.sthda.com/english/wiki/creating-and-saving-graphs-r-base-graphs" class="uri">http://www.sthda.com/english/wiki/creating-and-saving-graphs-r-base-graphs</a>
