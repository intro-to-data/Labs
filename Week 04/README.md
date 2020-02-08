# Week 04 - Insurance Charges

I hope you will enjoy this lab. I know I enjoyed working through the
data. Our dataset this week comes, again, from Kaggle, and is a famous
[insurance data set](https://www.kaggle.com/mirichoi0218/insurance) to
explore linear regressions.

[Insurance](https://en.wikipedia.org/wiki/History_of_insurance) as a
concept is actually quite old. Regardless of what one insures, it is a
means to share risk. In health insurance, risks are not evenly
distributed. The majority of the students in the class are 19 years
old and young adults are usually healthy (poor habits have not yet
caught up with you) and thus inexpensive. Older, sicker members are
generally more expensive to insure.

Using RStudio, create a new folder/project called `Insurance`. We will
use this project and data some next week during our lecture, so don't
lose it. Download the <a
href="https://raw.githubusercontent.com/intro-to-data/Data/master/insurance.csv"
download>insurance.csv</a> dataset and save it in the root folder of
the `Insurance` project.

Run the first 20 lines of code to import your data. Because of the
problems last week, I wrote a chunk of code which looks for the
`insurance.csv` file and will return an error to you if it cannot see
it. This will certainly help me help some of you who get stuck on this
step.

Be sure to run lines 28-31, or some of the demo code will not run. I
have included a fair amount of demo data in this lab because I want
you to spend some time this week thinking critically about the
_meaning_ of what we are doing.

### Question 01: Distribution of charges

Links:
- [Multimodal Distribution](https://en.wikipedia.org/wiki/Multimodal_distribution)
- [Log-normal_Distribution](https://en.wikipedia.org/wiki/Log-normal_distribution)

How would you describe the distribution of charges?  This data is
obviously skewed. Is the data multi-modal? Do you believe it roughly
follows the log-normal distribution? An eye-ball assessment is fine. I
am not asking for a formal statistical test.

``` 
ggplot(Insurance, aes(charges)) +
    geom_density() +
    geom_vline(xintercept = avg_charges, color = "red")
```

Fortunately, we can remove much of the skew from our data by taking
the log of charges. It isn't perfect, and yes, it is still
multi-modal, but it is much more normalized than before.

```
ggplot(Insurance, aes(log(charges))) +
    geom_density() +
    geom_vline(xintercept = avg_log_charges, color = "red")
```

### Question 02: Measures of central tendency

Links:
- https://simple.wikipedia.org/wiki/Central_tendency

The red line on the above plots shows the calculated average. Which
average (mean) is a better measure of central tendency?

Hint: You do not need any additional code for this question. Just look
at the graphs.

### Question 03: Create log_charges and calculate the average log_charge.

Create a new column in the Insurance data called `log_charges`. This
column should contain the more normalized distribution of charges.
You will need to use the `mutate()` function to do this. You can see
above for an example of how to apply `log()` to a vector. Remember to
save the results of mutate back to Insurance to keep your new column.

- Write the code in the Insurance.R file.

Run the code below to calculate the average log_charge. If you successfully
create the column above, this code should work for you. Remember,
although useful for comparison purposes, the log of charges has no
real meaning and the average does not approximate anything in the real
world. Enter the results of this into Canvas.

```
Insurance %>% summarize(MeanLogCharges = mean(log_charges))
```

### Question 04: Average Charges

It would be nice to compare costs of men to women. Group `charges` by
`sex`, and calculate the average charge and standard deviation for males
and females. To do this, you will need to use the dplyr commands
`group_by()` and `summarize()`. The function for average is `mean()` and
standard deviation is `sd()`.

- Write the code in the Insurance.R file.
- In Canvas, please  enter the average charge for males.

### Question 05: Average Log Charges

This is just like question 3, but applied to a different column.

- Write the code in the Insurance.R file.
- In Canvas, please  enter the average charge for males.


### Question 06:

Links:
- [Coefficient of variation](https://en.wikipedia.org/wiki/Coefficient_of_variation)

Obviously, the average of log_charge is different than the average
charge. Now, let's discuss the differences in standard deviation.

Calculate the coefficient of variation for charges and log_charges.
Anytime you are compariing groups where the sd is a high proportion of
the mean, you have the opportunity for misleading results.  Note: This
happens frequently.

- Write the code in the Insurance.R file.

Question 07: Student's T-Test

Links:

- [Student's T Test](https://en.wikipedia.org/wiki/Student%27s_t-test)

We haven't done this yet in class, so I'm going to give you the
code. The t-test is a classic test used for comparing the average of
two groups. But, this data violates a key assumption of the
t-test. The charges data is not even a little normalized.


```
## Read the t.test function documentation.
?t.test 
```

We are using the formular interface to define the t-test. You can read
the `charges~sex` as `charges as a function of sex`. In other words,
does the average `charges` vary across `sex` in a statistically
meaningful way?

```
## Run a t-test on the original data.
t.test(charges~sex, data = Insurance)
```

```
## Now run a t-test on the normalized data.
t.test(log_charges~sex, data = Insurance)
```

Of course, the averages will differ. What do you notice about the
p-value of the two t-tests? Are they similar? Are they different? If
we assume statistical significance at the .05 level, do both tests
suggest the same conclusion? Does this surprise you?


### Question 08: Charges as a function of age

On average, we will all get more expensive as we age. (Yes, even you.)
The graph below shows charges as a function of age, and adds in the
linear model regression to prove the point. However, you should
observe a weird banding effect in the distribution of charges. To my
eyes, there are three "bands" of members. Banding such as this
suggests there are one or more additional confounding variables which
would help explain the banding/grouping.

```
ggplot(Insurance, aes(age, charges)) +
    geom_point() +
    geom_smooth(method = lm)
```

Can you add color to the aesthetic command (aes) which helps explain
at least some of the banding? In other words, which variable from our
data can explain some or all of the banding we see from the above
plot.

- Hint: This variable is probaly a categorical, and not a numeric
  variable like bmi. I'll explain how to add bmi into this later.
- Write the code in the Insurance.R file.
- In Canvas, tell me what variable you added to the code to explain
  the banding.

### Question 09: Charges as a function of bmi and smoker status.

Create a linear regression, like we did in the previous question. The
x-axis should be bmi, the y-axis shoud be charges, and color should be
smoker status.


- In Canvas, please discuss what you see here.

