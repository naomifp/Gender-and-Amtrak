# Gender and Amtrak study

## Application of discrete choice modeling to estimate gender effect on the access and the use of Amtrak from Davis, CA

In this collaborative study with Dr. Susie Pike and fellow graduate students at UC Davis (Carolina, Jahan, and Claire), I apply Multinomial Logit model to estimate factors affecting access mode choice to Davis Amtrak station and Ordinal Logit model to estimate factors affecting the frequency of riding Amtrak / Capitol Corridor from Davis with a focus on gender effect. 
I am in charge for data preparation, data visualization, and discrete choice modeling. 

### Introduction

The major questions of the study are:

1. How does gender affect people's mode choice to access the Davis Amtrak station?

2. How does gender affect people's frequency of riding Amtrak from Davis station?

The study takes place in Davis. Located approx. 80 miles northeast of San Francisco Bay area, a suburban city Davis is well-known as the "Bicycle capital of the U.S.". 
Given the prevalent use of bicycle as a mode of transportation in Davis, we'd like to know whether women are likely to ride bicycle to access the Davis Amtrak station or not. 
Also, we question if women and men are differ in using the service of Amtrak / Capitol Corridor that spans across Sacramento area to San Francisco Bay Area.

### Methods and Description of Code in the Repository

The access mode choice is analyzed using Multinomial Logit model, while the frequency of riding train is examined using Ordinal Logit model. 
The original data set was collected by the City of Davis with a file name **"Amtrak_user_survey_2019.csv"**. 
The process of data wrangling as well as visualization of the descriptive statistics are documented in **"Amtrak_gender_masterfile.Rmd"**. 
This process produce a new data set for discrete choice modeling, **"amtrak_actual.csv"**. 
This new data set is used for two modeling, one is the Multinomial Logit model, **"MNL_access_mode.R"**, and the other one is for the Ordinal Logit model, **"OLM_riding_freq.R"**.

### Findings

Preliminary findings show that women are not differ from men in terms of their frequency of riding Amtrak / Capitol Corridor. HOwever, women and men show different preferences in mode choice to access the station. Men are found biking a lot to the station, while women are found to be less likely to biking and walking. Women are also found to be more dependent to car. Statistically significant factors that hinder women from bicycling to the station are safety and bicycle parking.

### Remarks

This study is in the writing process and have been twice presented. The first one was presented by M. Jahan in the PSR congress on March 2024 in Las Vegas, NV. The second one was presented in UC Davis 3rd Transit Research Symposium on April 2024 in Davis, CA. 
This study will also be presented in the TRB Conference on Women and Gender in Transportation on September 2024 in Irvine, CA.
