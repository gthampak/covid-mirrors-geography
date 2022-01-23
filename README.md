# GroupJ-COVID

## Possible Directions (last updated: 11/23/2021)

### things we can do

- Watch how "loadings" (the coefficients for the principal components linear combos) of each (significant) principal component (in PCA) changes over time (DataViz, possible animation).
- Use country as the observational unit and run PCA separately for each year (need a lot of data wrangling, data currently in country over time and not time by country).
- Imputation of missing data after initial (more involved) exploratory data analysis (EDA). Maybe use kNN for data imputation (for variables with some missing data (but not variables where data is missing) i.e., filter variables where most data is missing, impute for those that some are missing).

### possible questions

Using World Bank Data
- classify countries into "third-world", developing, developed and see which factors improve the most or improve earlier as countries move "up" the categories. (if seems like correlation, then this information may help inform which countries are about to experience rapid development. If it seems like correlation, then this information would help inform which sectors, development metrics countries want to focus on or be more agressive in improving (or getting up to standard) first to have the best chance of human/social development).
Using COVID Data
- Using trends from past days/weeks to predict important metrics, such as hospitalization rates, death rates so we can be more equiped/prepared to deal with things. Maybe using data from the past 5 days/2 weeks/(or whatever timeframe) as explanatory variables and data from a given day/week as the response. We can use model to "predict the future".

# Initial Proposal

## Group Members

Arm: Project Manager, Reporter
Jared: Facilitator, Director of Research
Guy: Task Manager, Director of Computation

## Title

Covid Data Mirrors Geography

## Purpose
 
We want to explore whether covid data is telling of the geography of covid cases as well as covid policies.  Some questions we want to ask are:

- Are we able to determine the infected country based on covid data?
- Are there similarities between covid policies across different countries if the covid data is clustered together?
- Why are some data points clustered together if not for geographical reasons?

We aim to do this by exploring and implementing the applications of principal component analysis. 
We hope this project will help identify important factors which affect covid cases, so we can better understand how to deal with the pandemic at hand and future pandemics.
 
## Data
 
Covid dataset: https://github.com/owid/covid-19-data/tree/master/public/data

We will be using a CSV file, and the variables are mostly numerical.
 
## Variables
 
The dataset we are using has 60 variables, the variables are categorized by confirmed cases, confirmed deaths, excess mortality, hospital and ICU, policy responses, reproduction rate, tests and positivity, vaccinations, others. Because we hope to compare the covid trends of countries with respect to their covid policies, we will be omitting the policy responses variable initially for our PCA, which is a variable that ranges from 0 to 100 based on the strictness of the covid policy. Our idea is that we will, after clustering the data following PCA, be able to examine the policies of countries within the same clusters more closely and draw comparisons.
 
## End Product

As a final product, we hope to draw conclusions about the Covid-19 trends of different countries based on the policies employed by the countries. We hypothesize that we will obtain a model that will be able to determine the relative geographic region, as well as possibly the types of policies employed by a nation, given the covid data available. 

## Possible Extentions

Relating COVID to twitter: https://zenodo.org/record/5595136#.YXmeIdnMIzg

# Update 1

- Have you already collected, or do you have access to, all of the data that you will need in order to complete your project? If not, please estimate the percentage of the data that you have, describe any issues that you are having, and what your plan is for getting the rest of the data.

Yes, we have a solid COVID dataset and may use more world bank data to explore some other things (an example of it in the data folder).

- What is the single biggest unresolved issue you are having? Please describe it briefly, and what your plan is for resolving this issue.

We are not sure how to handle time in our data. With the covid data, we have days/week as the time and for world bank data we have years. We are looking into different machine learning and/or computational techniques that deal with time. Or maybe we just have time be an observation.

- What are the elements from outside of the course, if any, that you plan to incorporate into your project?

Because the world bank data as over 1400 variables (many numeric data) and the covid data has over 60 variables (many of these also numeric), we plan to use principal component analysis to reduce the dimensions of the dataset and auto-feature engineer variables that can help with classification.
