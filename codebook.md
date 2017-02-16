# tidyDataSet.csv
The tidied data set contains an amalgam of x, y and subject data sets where the training and test sets have been joined.

The features in X have been subsetted as to only filter out measurements relating to standard deviations (std) and mean values (mean). It also contains measurements dealing with gravityMeans which most likely are not of interest. Since I didn't have the chance to clear this out though I assumed it better to keep the data just in case rather than remove it.

# summarisedDataSet.csv
This summarised data set groups the above data by Subject and Activity and calculates the mean values based on that.