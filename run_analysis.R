library(plyr)

# download zip file and extract to \Documents\R\
# afterwards all files are located in folder \Documents\R\UCI_HAR_Dataset
zipFile <- "UCI_HAR_Dataset.zip"
zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipURL, destfile= zipFile)
unzip(zipFile)


# read features file (two columns: id and features description separated by " ")
# we will use the 2nd columns as columns names for the data sets
features <-read.table("./UCI HAR Dataset/features.txt", sep = " ", col.names = c("featureID", "featureDesc")) 
# the descriptions won't look good without some formatting
features.names <- features[,2]
features.names <- gsub('mean', 'Mean', features.names)
features.names <- gsub('std', 'Std', features.names)
features.names <- gsub("[()]","", features.names) 
features[,2] <- features.names

# 1. create a tidy test data set

# read test data
testDf <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=features$featureDesc)
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity")
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

# category: test or training
# not really needed to produce the data set meanStdAvgs at the end
# but tidy
category <- rep("test", nrow(testDf))

# put things together in one data set
testComplete <- cbind(category, testSubjects, testLabels, testDf)

# remove objects not needed anymore
rm(testDf, testLabels, testSubjects, category)

# 2. create a tidy training data set

# read training data
trainDf <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=features$featureDesc)
trainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity")
trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# category: test or training
# not really needed to produce the data set meanStdAvgs at the end
# but tidy
category <- rep("training", nrow(trainDf))

# put things together in one data set
trainComplete <- cbind(category, trainSubjects, trainLabels, trainDf)

# remove objects not needed anymore
rm(trainDf, trainLabels, trainSubjects, category)

# 3. merge, filter, rename
# merge the data sets
completeSet <- rbind(testComplete, trainComplete)
rm(testComplete, trainComplete)

# get the 1st three columns and all column names containing "Mean" or "Std"
meanStdCols <- grep("category|subject|activity|Mean|Std", colnames(completeSet))
meanStdSet <- completeSet[, meanStdCols]

# calculate average of each variable for each activity and each subject
# for this we drop the 1st column (test/training)
meanStdAvgs <- ddply(meanStdSet[ , -1], .(activity, subject), colMeans)

# replace label id by description
activityLabel <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("labelID", "labelDesc"))
for (i in 1:6) {
  meanStdAvgs$activity[meanStdAvgs$activity == i] <- toString(activityLabel[i,2])
}  

# write file to txt
write.table(meanStdAvgs, "meanStdAvgs.txt", row.name=FALSE)