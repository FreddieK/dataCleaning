# Cleaned and summarised data based on following data set;

Human Activity Recognition Using Smartphones Dataset
Version 1.0
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
####

## Contains files:
- 'README.txt'
- 'codebook.md' - Explains the reasoning behind the tidied and summarised data files
- 'tidyDataSet.csv' - Cleaned and subsetted version of the original data set, 10299 obs of 88 variables
- 'summarisedDataSet.csv' - Summarised version of the tidied data set, grouped by Subject and Activity, 180 obs of 88 variables
- 'run_analysis.R' - Code to generate the cleaned and summarised data sets

## Recreate files step by step:

## Setup the working directory in order to read in files correctly
localPath <- '~/dev/coursera/cleaningData/UCI HAR Dataset'

setwd(localPath)

## Generate tidied and summarised data from scratch:
tidyDataSet <- fetchTidyDataSet()

summarisedDataSet <- summariseDataset(tidyDataSet)

## Alternatively just summarise the cleaned data:
tidyDataSet <- read.table('tidyDataSet.csv')

summarisedDataSet <- summariseDataset(tidyDataSet)

## ...or read in summary directly for inspection
summarisedDataSet <- read.table('summarisedDataSet.csv')

####
Notes:
####
- For clarifications or further questions you can contact freddiekarlbom@gmail.com