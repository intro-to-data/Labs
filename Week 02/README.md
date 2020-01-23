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
is the `diamonds` dataset. It contains the price and attributes of nearl 54,000
round cut diamonds. Variables include:

- price: price in US dollars (\$326–\$18,823)
- carat: weight of the diamond (0.2–5.01)
- cut: quality of the cut (Fair, Good, Very Good, Premium, Ideal)
- color: diamond colour, from D (best) to J (worst)
- clarity: a measurement of how clear the diamond is (I1 (worst), SI2, SI1, VS2,
VS1, VVS2, VVS1, IF (best))
- x: length in mm (0–10.74)
- y: width in mm (0–58.9)
- z: depth in mm (0–31.8)
- depth: total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43–79)
- table: width of top of diamond relative to widest point (43–95)
 
You do not need to be knowledgeable about diamonds or their cut/value to succeed
on this lab. A ll you need is the data and a touch of common sense.

![Scientific Paper Graph Quality](https://imgs.xkcd.com/comics/scientific_paper_graph_quality.png)

# Stories from Data

One of the most important skills you can learn is how to effectively understand
data visually. To do so, you must first understand when to use different kinds
of graphis.

This is a link to the excellent graph resource we discussed in class.

[https://www.data-to-viz.com/](https://www.data-to-viz.com/)

# Spreadsheet

You can complete this lab using any mainstream spreadsheet program. However,
given the ubiquity of Excel, the support links provided below are for users of
Microsoft Excel.

[Create a Chart from Start to Fisnish](https://support.office.com/en-us/article/create-a-chart-from-start-to-finish-0baf399e-dd61-4e18-8a73-b3fd5d5680c2?ui=en-US&rs=en-US&ad=US)

[Available Chart Types in Office](https://support.office.com/en-us/article/Available-chart-types-in-Office-a6187218-807e-4103-9e0a-27cdb19afb90)

## Tasks

1. Import the diamonds.csv data into Excel. The easiest way to do this is to
click on the diamonds.csv file and let Excel recommend how to import it. I often
recommend looking at the data first in a simple text editor such as Notepad to
confirm the structure of the CSV file.
   - The data will be shown on the first worksheet, which will probably be
   called `sheet1` or `diamonds` depending on what spreadsheet you use and how
   you import the data.
   - Create a second worksheet to hold your plots. Putting everything into one
   worksheet can be confusing and hard to read.
2. Create a scatter plot which shows the relationship between carats and price.
3. Create a scatter plot which shows the relationship between clarity and price.
4. Create a bar plot to determine me which diamond cut is most frequent in this
dataset.

When complete, please submit your diamonds.xlsx file via Canvas.

# R

We can import the diamonds data, easily into R using the readr package. To make sure this package is installed on your computer:

