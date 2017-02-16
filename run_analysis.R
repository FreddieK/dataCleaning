library(dplyr)

getXCombined <- function() {
    x_test <- read.table("test/X_test.txt")
    x_train <- read.table("train/X_train.txt")
    
    x_combined <- rbind(x_test, x_train)
    
    colnames_x <- read.table("features.txt")
    
    regExp <- "std|mean|Mean"
    
    filteredColumns <- filter(colnames_x, grepl(regExp, colnames_x$V2))
    
    x_filtered <- x_combined[,filteredColumns$V1]
    
    colnames(x_filtered) <- filteredColumns$V2
    
    x_filtered
}
    
getYCombined <- function() {
    y_test <- read.table("test/y_test.txt")
    y_train <- read.table("train/y_train.txt")
    y_combined <- rbind(y_test, y_train)
    
    labelnames_y <- read.table("activity_labels.txt")
    
    y_combinedWithActivity <- left_join(y_combined, labelnames_y, by = "V1")
    
    y <- select(y_combinedWithActivity, V2)
    
    colnames(y) <- c('Activity')
    
    y
}

getSubjectCombined <- function() {
    subject_test <- read.table("test/subject_test.txt")
    subject_train <- read.table("train/subject_train.txt")
    subject_combined <- rbind(subject_test, subject_train)
    
    colnames(subject_combined) <- c('Subject')
    
    subject_combined
}

joinAll <- function(x, y, subject) {
    joinedDataSet <- x %>% cbind(y) %>% cbind(subject)
}

fetchTidyDataSet <- function() {
    x <- getXCombined()
    y <- getYCombined()
    subject <- getSubjectCombined()
    joinedDataSet <- joinAll(x, y, subject)
}

# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.
summariseDataSet <- function(tidyDataSet) {
    tidyDataSet %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
}