# Week 01 - Roll The Dice

This is your first lab. This is a multi-part lab. 

- Part 1: Prologue. You should answer these questions on Canvas.
- Part 2: Roll The Dice, Spreadsheet Edition
- Part 3: Roll The Die, R Edition
- Part 4: Review

This is also an oportunity to roll some dice and create some random samples 
which we will (hopefully) use later in the course to demonstrate p-hacking.

This lab has two goals. I want you to get a better idea of how R and
Excel are broadly equivalent. Some things are easier in R. Some things are
easier in Excel. Excel is more visual, but combines data storage, management,
and analysis. As you will see, R separates data storage, management, and 
analysis.

## Resources

To complete the `Spreadsheet Edition` of this lab, you will need to know how to
enter data into a spreadsheet (Excel), and to apply formulas to small data sets.
If you are not familiar with spreadsheet formulas, the following resources will
be useful.

- [Overview of Formulas in Excel](https://support.office.com/en-us/article/Overview-of-formulas-in-Excel-ecfdc708-9162-49e8-b993-c311f47ca173)
- [Calculate Average In Excel (YouTube)](https://www.youtube.com/watch?v=lDjdTQt93Pc)
- Relevant spreadsheet functions/commands:
    - Mean (Average) = `avg`
    - Sum = `sum`
- Relevant R functions/commands:
    - Mean = `mean`
    - Sum = `sum`
    - To get help on a function in R, you can prepend the function name with a
      question mark. For example `?sum` will get you the documentation for the
      `sum` function.

As with all things programming, Google is your friend. And,
[XKCD](https://www.xkcd.com/) provides us with additional, relevant, guidance.

<center>
![XKCD Tech Support](https://imgs.xkcd.com/comics/tech_support_cheat_sheet.png){width=60%}
</center>

## Lab

You are welcome to use your personal laptop or the VMWare virtual desktop for
the Intro To Data course. Which-ever you use, be consistent. I also recommend
creating folder for this course with a structure for `Week 01`, `Week 02`, etc.
to manage the scripts from class, lab, etc. Don't just run everything from your
`Downloads` folder. Doing this is the path to the [dark
side](https://starwars.fandom.com/wiki/Dark_side_of_the_Force).

If you have any questions, please ask for help in the Canvas discussion for
labs.

### Part 1: Prologue. You should answer these questions on Canvas.

Please answer the following questions on Canvas.

1. Thought experiment: If you roll the dice I gave you an infinite number of
times, what percentage of these rolls would be a "1"? (You may assume the dice I
purchased are perfect, you have a perfect roll, etc.)

2. Let's say I rolled the dice 100 ties, and I rolled a "1" thirty percent of the time. Are you surprised? Why/Why not?

### Part 2: Roll The Dice, Spreadsheet Edition

Data and code in a spreadsheet (Excel, LibreOffice, Google Sheets, etc.) is
stored in a workbook. Within a workbook, there can be multiple worksheets, which
is similar to having multiple tabs in a browser.

<center><br/>
![Multiple Worksheets in LibreOffice](https://github.com/intro-to-data/Labs/raw/master/Week%2001/ss00.png)
</center><br/>

1. Download the lab workbook, [here](./Roll\ The\ Dice\ (Excel).xlsx). Save this
file in your `Week 01` folder.
   - On the `Read Me` worksheet, there are some additional in-line instructions.
2. On the `Data` worksheet, fill-in the missing values for `Initials` and `Favorite Color`.
   - **Initials:** Since my name is Andy Choens, I would enter AC.
   - **Favorite Primary Color:** Should be either `Red`, `Green`, or `Blue`.
     Spelling and capitalization matter.
   - All 15 rows should have the same entries for the first two columns.

<center><br />    
![Example Data Entries in LibreOffice](https://github.com/intro-to-data/Labs/raw/master/Week%2001/ss02.png)
</center><br />

3. Use the two dice provided in class to roll 15 pairs of results. As for which
die is `Die 1` and which is `Die 2`, that is up to you. 
   - Note: The only valid entries for columns `D` and `E` are integers between 1
   and 6.
4. **Row Sum:** Calculate the sum of the two dice, for each roll R01 - R15. You
can do this with a formula using either the `+` operator or `sum` function.
   - Note: The only possible valid entries for column `F` are between 2 and 12.
5. **Row Mean:** Calculate the average of each roll R01 - R15. The average of
each roll is $(Die 1 + Die 2) / 2$
   - Note: The only valid entries for column `G` are between 1 and 6.
6. On the `Read Me` worksheet calculate the average and sum for all rolls for
`Die 1` and `Die 2`. 
   - For example, if I rolled $1,2,3,4,5,1,2,3,4,5,1,2,3,4,5$, which is absurdly
   unlikely, for `Die 1`, the `Die 1 Average` would be 3 and `Die 1 Sum` would
   be 45. If you can figure it out, you can round your answers to the second
   decimal place with the `round` function.

Please note that becase of the headers, the fifteenth row of data is on the
sixteenth row of the worksheet.

Congrats. You have completed Part Two of this lab. Please submit the Excel file
via Canvas.

### Part 3: Roll The Die, R Edition

We will now perform some similar calculations in R. I am generally opposed to
typing the same thing twice. But, in this case, I'm going to make an exception.
We need to put enter our dice rolls into R and perform the same calculations.
Download the [Week 01 Lab - Roll The Dice (R).R](./Week 01 Lab - Roll The Dice
(R).R) file. Place this script file in your `Week 01` folder, and open the .R file
in RStudio.

1. The .R script is contains instructions as comments. Once you have completed
the tasks in the script, please submit the completed script via Canvas.

Congrats, you have completed Part 3 of the lab. Please submit your .R script via
Canvas.

### Part 4: Review

Please answer the following questions on Canvas.

1. What questions/concerns do you have about this course right now?
2. What questions/concerns do you have about Excel right now?
3. What questions/concerns do you have about R/RStudio right now?

## Credits:

This lab was brought to you by Rush. RIP Neil.