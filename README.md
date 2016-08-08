# Coursera - Getting and Cleaning Data Course Project #
#  #

## Summary ##

This repo contains the content for my Coursera - Getting and Cleaning Data Course Project
([https://www.coursera.org/learn/data-cleaning/home/welcome](https://www.coursera.org/learn/data-cleaning/home/welcome)).
All the work is done by the script `run_analysis.R`.
 
`run_analysis.R` performs the following tasks:

1. Download and unzip the UCI HAR zip file from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Read the data into different data frames.
3. Merges the sets to create one data set.
4. Extracts only the measurements on the mean and standard deviation for each measurement.
5. Generate another data frame containing the column means by activity and subject.
6. Write this data frame into the text file `meanStdAvgs.txt`

Details describing the output data set can be found in the `CodeBook.md`

## How to run the code from RStudio##

1. Clone this repo.
2. Recommended step: Copy the R script `run_analysis.R` into your work directory. 
3. Source the R script `run_analysis.R` (`source(run_Analysis.R`).
 
    Attention: the zip file to be downloaded is approximately 60 MB, unzipped files approximately 270 MB

4. Unzipped files in folder `UCI HAR Dataset` and output file `meanStdAvgs.txt` will be placed in the work directory. 