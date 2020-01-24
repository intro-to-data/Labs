# Week 02 - Flowers for Algernon

> Anyone who has common sense will remember that the bewilderments of the eye
 are of two kinds, and arise from two causes, either from coming out of the light
 or from going into the light, which is true of the mind's eye, quite as much as
 of the bodily eye.

As with our last lab, this is a two part lab. The first part will be performed
using a spreadsheet program such as Excel. The second will be performed in R.
The data is provided as a Comma Separated Values (CSV) file, which is a common
format for sharing data, especially when moving across tools/environments. This
lab introduces us to importing data in both R and Excel. Our dataset this week
is the `diamonds` dataset. It contains the price and attributes of nearly 54,000
round cut diamonds. Variables include:

- **price:** price in US dollars (\$326–\$18,823)
- **carat:** weight of the diamond (0.2–5.01)
- **cut:** quality of the cut (Fair, Good, Very Good, Premium, Ideal)
- **color:** diamond color, from D (best) to J (worst)
- **clarity:** a measurement of how clear the diamond is (I1 (worst), SI2, SI1, VS2,
VS1, VVS2, VVS1, IF (best))
- **x:** length in mm (0–10.74)
- **y:** width in mm (0–58.9)
- **z:** depth in mm (0–31.8)
- **depth:** total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43–79)
- **table:** width of top of diamond relative to widest point (43–95)
 
You do not need to be knowledgeable about diamonds or their cut/value to succeed
on this lab. All you need is the data and a touch of common sense.

![Scientific Paper Graph Quality](https://imgs.xkcd.com/comics/scientific_paper_graph_quality.png)

# Stories from Data

One of the most important skills you can learn is how to effectively understand
data visually. To do so, you must first understand when to use different kinds
of graphs/plots of data.

Below are some useful links which we discussed in class:
- [Data To Viz](https://www.data-to-viz.com/)
- [GGPlot Documentation](https://ggplot2.tidyverse.org/index.html)
- [Excel - Create a Chart from Start to Finish](https://support.office.com/en-us/article/create-a-chart-from-start-to-finish-0baf399e-dd61-4e18-8a73-b3fd5d5680c2?ui=en-US&rs=en-US&ad=US)
- [Excel - Available Chart Types in Office](https://support.office.com/en-us/article/Available-chart-types-in-Office-a6187218-807e-4103-9e0a-27cdb19afb90)

# Spreadsheet

You can complete this lab using any mainstream spreadsheet program.

## Tasks

1. Download the <a href = "https://raw.githubusercontent.com/intro-to-data/Labs/master/Week%2002/diamonds.csv" download> dataset</a>.
2. Import the diamonds.csv data into Excel. 
   - The most common way to do this is to click on a local copy of the 
   diamonds.csv file and let Excel recommend how to import it.
   - *If you are having a hard time saving/opening the CSV file in Excel from
   GitHub, try using the copy I saved to Canvas in the Lab 02 description.
   Apparently, some Windows browsers turn the .csv file into a .txt file which
   makes it harder to import the data into Excel than is necessary.*
   - If you prefer to avoid the clutter of downloading the data to your local
      computer/VM, you can also use the above link to open/import the data
      directly in Excel. To do this, start Excel, and then hit the `File Open`
      button on Ctl+o shortcut (in Windows) to bring up the open file dialog and
      copy/paste the above URL into this dialog box. Excel will download the
      file from GitHub for you.
   - How you download/import the data is your choice. If you need more
   information, this
   [link](https://support.office.com/en-us/article/import-or-export-text-txt-or-csv-files-5250ac4c-663c-47ce-937b-339e391393ba)
   may be useful to you.
   - The data will be shown on the first worksheet, which will probably be
   called `sheet1` or `diamonds` depending on what spreadsheet you use and how
   you import the data.
   - Create a second worksheet to hold your plots. Putting everything into one
   worksheet can be confusing and hard to read.
3. Create a scatter plot which shows the relationship between carats and price.
4. Create a box plot which shows how price varies across diamonds of different
clarity.
5. Create a bar plot to determine me which diamond cut is most frequent in this
dataset.

When complete, please submit your diamonds.xlsx file via Canvas.

# R

We can import the diamonds data, easily into R using the `readr` package. To make
sure this package is installed on your computer:

```
## You do not need to copy/paste this code chunk into your diamonds.R script.
install.packages("readr")
```

To get help with ANY command in R, prepend the function name with a question
mark. For example, to get help with the `length` command, enter `?length` in the
R Console and RStudo will display the help documentation for that function. This
is a very useful feature.

1. In RStudio, create a file called diamonds.R. Where I am providing you with
code, copy/paste that code into diamonds.R, otherwise, write/run your own code
to complete this lab.
2. Import the diamonds.csv data into Excel. We have not done this in class yet,
so I will give you the code you need to complete this step.

```
## ALWAYS load needed packages BEFORE trying to use them.
## The tidyverse gives us our graphing tools. 
## And readr gives us a good way to import CSV files.

library(tidyverse)
library(readr)
url <- "https://raw.githubusercontent.com/intro-to-data/Labs/master/Week%2002/diamonds.csv"
diamonds <- read_csv(url, col_types = "dfffdddddd", progress=TRUE)
``` 

Please comment your code. Lines that begin with `#` are treated as comments by
the R interpreter and will not be run. So for example, to complete step 3, you
could have something that looks like:

```
# Task 2: Data Import
library(tidyverse)
library(readr)
url <- "https://raw.githubusercontent.com/intro-to-data/Labs/master/Week%2002/diamonds.csv"
diamonds <- read_csv(url, col_types = "dfffdddddd", progress=TRUE)


# Task 3: Scatter plot showing the relationship between carats and price.
ggplt(data = diamonds aes(stuff, stuff, stuff)) +
    geom_stuff()
```

Of course, it is up to you to replace `stuff` with actual R syntax. But a line
or two like that in the script telling me what you are trying to do will make
your script easier for me to understand.

3. Create a scatter plot which shows the relationship between carats and price.
   - The first step is to use the `ggplot` function.
   - See `geom_point()`
4. Create a box plot which shows how price varies across diamonds of different
clarity.
5. Create a bar plot to determine me which diamond cut is most frequent in this
dataset.
   - `geom_bar()` will be useful.
6. Create a histogram of diamond price. Do you notice anything about the
distribution of diamond prices? How would you describe the distribution of
diamond prices? (The default number of bins, 30, is fine.)
   - See `geom_histogram`
   - [Normal Distribution - Wikipedia](https://en.wikipedia.org/wiki/Normal_distribution)
   - [Long Tail - Wikipedia](https://en.wikipedia.org/wiki/Long_tail)
7. Create a second histogram of diamond price, and stratify this by diamond cut.
   - See `facet_wrap()`
   - Which cut has the least variance?
   - Which cut has the average highest/lowest price?
   - [Variance - Wikipedia](https://en.wikipedia.org/wiki/Variance)

Feel free to make the graphs pretty. Use nice colors, align your text, etc.
   
When complete, please submit the diamonds.R script to me via Canvas. You do
not need to upload your graphs. If your script is complete, I can run it and see
what you did.

Please answer the questions in Canvas, and thank your for completing another
lab!