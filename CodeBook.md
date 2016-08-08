# Code Book #

 This file describes the variables, the data, and any transformations or work that was performed to clean up the data.

## About the data ##

**Raw data:** Human Activity Recognition Using Smartphones Data Set available at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):


 > ...Experiments have been carried out with a group of 30 volunteers performing six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity [were captured] at a constant rate of 50Hz.
> 
>  ...The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data...

**Output data:** The output data contains the column means grouped by subject and activity for all columns describing means or standard deviations. Test and training data were merged during the transformation. 

The output data contains 180 observations (rows) in 88 variables:

## Identifier and Activities ##

- subject (numeric): identifier for the participant/ between 1 and 30  
- activity (character): `WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING`


## Attributes/ Measurements ##

All 86 attributes are numeric.
Attributes describing means contain "Mean". Attributes describing standard deviations contain "Std".

- tBodyAcc.Mean.X
- tBodyAcc.Mean.Y
- tBodyAcc.Mean.Z
- tBodyAcc.Std.X
- tBodyAcc.Std.Y
- tBodyAcc.Std.Z
- tGravityAcc.Mean.X
- tGravityAcc.Mean.Y
- tGravityAcc.Mean.Z
- tGravityAcc.Std.X
- tGravityAcc.Std.Y
- tGravityAcc.Std.Z
- tBodyAccJerk.Mean.X
- tBodyAccJerk.Mean.Y
- tBodyAccJerk.Mean.Z
- tBodyAccJerk.Std.X
- tBodyAccJerk.Std.Y
- tBodyAccJerk.Std.Z
- tBodyGyro.Mean.X
- tBodyGyro.Mean.Y
- tBodyGyro.Mean.Z
- tBodyGyro.Std.X
- tBodyGyro.Std.Y
- tBodyGyro.Std.Z
- tBodyGyroJerk.Mean.X
- tBodyGyroJerk.Mean.Y
- tBodyGyroJerk.Mean.Z
- tBodyGyroJerk.Std.X
- tBodyGyroJerk.Std.Y
- tBodyGyroJerk.Std.Z
- tBodyAccMag.Mean
- tBodyAccMag.Std
- tGravityAccMag.Mean
- tGravityAccMag.Std
- tBodyAccJerkMag.Mean
- tBodyAccJerkMag.Std
- tBodyGyroMag.Mean
- tBodyGyroMag.Std
- tBodyGyroJerkMag.Mean
- tBodyGyroJerkMag.Std
- fBodyAcc.Mean.X
- fBodyAcc.Mean.Y
- fBodyAcc.Mean.Z
- fBodyAcc.Std.X
- fBodyAcc.Std.Y
- fBodyAcc.Std.Z
- fBodyAcc.MeanFreq.X
- fBodyAcc.MeanFreq.Y
- fBodyAcc.MeanFreq.Z
- fBodyAccJerk.Mean.X
- fBodyAccJerk.Mean.Y
- fBodyAccJerk.Mean.Z
- fBodyAccJerk.Std.X
- fBodyAccJerk.Std.Y
- fBodyAccJerk.Std.Z
- fBodyAccJerk.MeanFreq.X
- fBodyAccJerk.MeanFreq.Y
- fBodyAccJerk.MeanFreq.Z
- fBodyGyro.Mean.X
- fBodyGyro.Mean.Y
- fBodyGyro.Mean.Z
- fBodyGyro.Std.X
- fBodyGyro.Std.Y
- fBodyGyro.Std.Z
- fBodyGyro.MeanFreq.X
- fBodyGyro.MeanFreq.Y
- fBodyGyro.MeanFreq.Z
- fBodyAccMag.Mean
- fBodyAccMag.Std
- fBodyAccMag.MeanFreq
- fBodyBodyAccJerkMag.Mean
- fBodyBodyAccJerkMag.Std
- fBodyBodyAccJerkMag.MeanFreq
- fBodyBodyGyroMag.Mean
- fBodyBodyGyroMag.Std
- fBodyBodyGyroMag.MeanFreq
- fBodyBodyGyroJerkMag.Mean
- fBodyBodyGyroJerkMag.Std
- fBodyBodyGyroJerkMag.MeanFreq
- angletBodyAccMean.gravity
- angletBodyAccJerkMean.gravityMean
- angletBodyGyroMean.gravityMean
- angletBodyGyroJerkMean.gravityMean
- angleX.gravityMean
- angleY.gravityMean
- angleZ.gravityMean

## How this data set was generated ##

1. The raw data was downloaded as zip file from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzipped into the folder UCI HAR Dataset.
2. The attribute names were loaded from the file `"/UCI HAR Dataset/features.txt"`. The names  were cleaned by replacing `"mean"` by `"Mean"`, `"std"` by `"Std"` and removing the brackets `"()"` for better readability. 
3. Test set, test labels (activities) and test subjects were loaded into three data frames
4. A category `test` was created
5. The data structures from step 2. and 3. were consolidated into single data frame `testComplete`.
6. A data frame `trainComplete` for the training data was constructed similar to the steps 2. to 4. 
7. Test and training data were merged into the data frame `completeSet`.
8. Only the variables and the attributes describing means (containing `"Mean"`) standard deviations (containing `"Std"`) were kept in the data frame `meanStdSet`.
9. Column means grouped by subject and activity for all columns were calculated and stored in the data frame `meanStdAvgs`.
10. The activity ID (numeric) was replaced by the description (character).
11. The content of the data frame was written to the file `meanStdAvgs.txt`.   
