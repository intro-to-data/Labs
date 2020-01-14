# Week 01 Lab: Roll The die

# A vector is a data object which is roughly analagous to a column in an Excel
# file. We will first create the SAME columns (vectors) we created in the
# workbook. The code may be a little different, but this will give you some
# experience to some different code. Run each command interactively to make sure
# you are getting the results we want. Since this is your first R-based lab,
# grading of this lab will be "soft".

# The goal of this first exercise is for you to gain some practical experince
# assigning values to a variable and creating some vectors.

# Remember, you can add vectors together with the "+" operator. And you can use
# the mean() function and sum() function to find the average and sum of vectors.

# Initials - Enter your initials below.
initials <- c(rep("Your Initials",15))
initials

# Favorite Color - Enter your favorite color as Red, Green, or Blue
favorite_color <- c(rep("Favorite Color", 15))
favorite_color

# Roll - This one I'll do for you.
roll <- c("R 01","R 02","R 03","R 04","R 05","R 06","R 07","R 08",
          "R 09","R 10","R 11","R 12","R 13","R 14","R 15")
roll

# Die 1 - Enter the same numbers from the Die 1 column in the workbook.
#         Or you can roll new numbers. I don't really care. I want 15 numbers
#         between 1 and 6 which  come from you rolling the dice.
die_1 <- c(1,2,3,4)
die_1

# Die 2 - Enter the same numbers from the Die 2 column in the workbook.
#         Or you can roll new numbers. I don't really care. I want 15 numbers
#         between 1 and 6 which  come from you rolling the dice.
die_2 <- c(6,7,8,9)
die_2

# Row Sums - This is the equivalent of the F column from the Data worksheet.
#            Create a new vector called row_sum which is the sum of the die_1
#            and die_2.


# Die 1 Average - This is the average value of rolled numbers for die_1.
#                 Create a variable called avg_1.


# Die 2 Average - This is the average value of rolled numbers for die_2.
#                 Create a variable called avg_2.


# Die 1 Sum - This is the sum of the values of rolled numbers for die_1.
#             Create a variable called sum_1.


# Die 2 Sum - This is the sum of the values of rolled numbers for die_2.
#             Create a variable called sum_2.


# Row Sum - This is the sum of die_1 and die_2.
#           Create a variable called row_sum.

# Row Mean - This is the average of each die_1 and die_2 roll. This one is
#            hard, and we haven't done loops yet. Here some code for you.
#            We will create a variable called row_mean.
row_mean <- numeric(0)
for(i in seq_along(die_1)) {
    row_mean[i] <- mean(c(die_1[i],die_2[i]))
}
row_mean

# Congrats. You are done! Save this file, with your changes (you did make
# changes, right?) and submit this on Canvas.