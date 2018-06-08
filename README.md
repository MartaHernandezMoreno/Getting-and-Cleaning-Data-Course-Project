# Getting and Cleaning Data Project
The purpose of this project is to prepare tidy data that can be used for later analysis.

This repo includes:
* README.md: Markdown that explains all functions have been used and the results obtained in every step.
* run_analysis.R: R script that gets and cleans the data set.
* Codebook.md: Markdown that describes the variables.

## Processing steps
### 0.	Download zip file and read the data.
Functions:
* download.file
*	unzip



### 1.	Merge the training and the test sets (x_test, x_train) to create one data set.
Functions:
* rbind: combine the data by rows

Results:
* 10299 rows
* 561 columns



### 2.	Extract only the measurements on the mean and standard deviation for each measurement.
Functions:
* grep: search for matches to “mean()” or “std()” in features.txt
*	clean: this function has been created to assign the feature that correspond to each data variable and delete brackets.

Results:
* 10299 rows
* 79 columns 


### 3.	Use descriptive activity names to name the activities in the data set.
Functions:
*	rbind: combine subject data (subject_test, subject_train) and activity data (y_test, y_train) by rows, and assign the variable names “subject” and “activity” to each variable.
*	cbind: merge subject, activity and dataset created in step 1 by columns.
*	levels: assign the activity label using auxiliar function “activ_aux”.

Results:
* 10299 rows
* 81 columns ("subject" + "activity" + 79 columns)

### 4.	Appropriately labels the data set with descriptive variable names.
Functions:
*	gsub: function that replaces all matches of variable names:

    "^t" --> "time"
    
    "^f" --> "frequency”
    
    "Acc" --> "Accelerometer”
    
    "Gyro" --> "Gyroscope”
    
    "Mag" --> "Magnitude”
    
    "BodyBody" --> "Body”

Variable names:

 [1] "subject"                                         
 [2] "activity"                                        
 [3] "timeBodyAccelerometer-mean-X"                    
 [4] "timeBodyAccelerometer-mean-Y"                    
 [5] "timeBodyAccelerometer-mean-Z"                    
 [6] "timeBodyAccelerometer-std-X"                     
 [7] "timeBodyAccelerometer-std-Y"                     
 [8] "timeBodyAccelerometer-std-Z"                     
 [9] "timeGravityAccelerometer-mean-X"                 
[10] "timeGravityAccelerometer-mean-Y"                 
[11] "timeGravityAccelerometer-mean-Z"                 
[12] "timeGravityAccelerometer-std-X"                  
[13] "timeGravityAccelerometer-std-Y"                  
[14] "timeGravityAccelerometer-std-Z"                  
[15] "timeBodyAccelerometerJerk-mean-X"                
[16] "timeBodyAccelerometerJerk-mean-Y"                
[17] "timeBodyAccelerometerJerk-mean-Z"                
[18] "timeBodyAccelerometerJerk-std-X"                 
[19] "timeBodyAccelerometerJerk-std-Y"                 
[20] "timeBodyAccelerometerJerk-std-Z"                 
[21] "timeBodyGyroscope-mean-X"                        
[22] "timeBodyGyroscope-mean-Y"                        
[23] "timeBodyGyroscope-mean-Z"                        
[24] "timeBodyGyroscope-std-X"                         
[25] "timeBodyGyroscope-std-Y"                         
[26] "timeBodyGyroscope-std-Z"                         
[27] "timeBodyGyroscopeJerk-mean-X"                    
[28] "timeBodyGyroscopeJerk-mean-Y"                    
[29] "timeBodyGyroscopeJerk-mean-Z"                    
[30] "timeBodyGyroscopeJerk-std-X"                     
[31] "timeBodyGyroscopeJerk-std-Y"                     
[32] "timeBodyGyroscopeJerk-std-Z"                     
[33] "timeBodyAccelerometerMagnitude-mean"             
[34] "timeBodyAccelerometerMagnitude-std"              
[35] "timeGravityAccelerometerMagnitude-mean"          
[36] "timeGravityAccelerometerMagnitude-std"           
[37] "timeBodyAccelerometerJerkMagnitude-mean"         
[38] "timeBodyAccelerometerJerkMagnitude-std"          
[39] "timeBodyGyroscopeMagnitude-mean"                 
[40] "timeBodyGyroscopeMagnitude-std"                  
[41] "timeBodyGyroscopeJerkMagnitude-mean"             
[42] "timeBodyGyroscopeJerkMagnitude-std"              
[43] "frequencyBodyAccelerometer-mean-X"               
[44] "frequencyBodyAccelerometer-mean-Y"               
[45] "frequencyBodyAccelerometer-mean-Z"               
[46] "frequencyBodyAccelerometer-std-X"                
[47] "frequencyBodyAccelerometer-std-Y"                
[48] "frequencyBodyAccelerometer-std-Z"                
[49] "frequencyBodyAccelerometer-meanFreq-X"           
[50] "frequencyBodyAccelerometer-meanFreq-Y"           
[51] "frequencyBodyAccelerometer-meanFreq-Z"           
[52] "frequencyBodyAccelerometerJerk-mean-X"           
[53] "frequencyBodyAccelerometerJerk-mean-Y"           
[54] "frequencyBodyAccelerometerJerk-mean-Z"           
[55] "frequencyBodyAccelerometerJerk-std-X"            
[56] "frequencyBodyAccelerometerJerk-std-Y"            
[57] "frequencyBodyAccelerometerJerk-std-Z"            
[58] "frequencyBodyAccelerometerJerk-meanFreq-X"       
[59] "frequencyBodyAccelerometerJerk-meanFreq-Y"       
[60] "frequencyBodyAccelerometerJerk-meanFreq-Z"       
[61] "frequencyBodyGyroscope-mean-X"                   
[62] "frequencyBodyGyroscope-mean-Y"                   
[63] "frequencyBodyGyroscope-mean-Z"                   
[64] "frequencyBodyGyroscope-std-X"                    
[65] "frequencyBodyGyroscope-std-Y"                    
[66] "frequencyBodyGyroscope-std-Z"                    
[67] "frequencyBodyGyroscope-meanFreq-X"               
[68] "frequencyBodyGyroscope-meanFreq-Y"               
[69] "frequencyBodyGyroscope-meanFreq-Z"               
[70] "frequencyBodyAccelerometerMagnitude-mean"        
[71] "frequencyBodyAccelerometerMagnitude-std"         
[72] "frequencyBodyAccelerometerMagnitude-meanFreq"    
[73] "frequencyBodyAccelerometerJerkMagnitude-mean"    
[74] "frequencyBodyAccelerometerJerkMagnitude-std"     
[75] "frequencyBodyAccelerometerJerkMagnitude-meanFreq"
[76] "frequencyBodyGyroscopeMagnitude-mean"            
[77] "frequencyBodyGyroscopeMagnitude-std"             
[78] "frequencyBodyGyroscopeMagnitude-meanFreq"        
[79] "frequencyBodyGyroscopeJerkMagnitude-mean"        
[80] "frequencyBodyGyroscopeJerkMagnitude-std"         
[81] "frequencyBodyGyroscopeJerkMagnitude-meanFreq"


### 5.	From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
Functions:
*	aggregate (~formula, data, FUN):

    formula = ~subject + activity: numeric data to be split into groups according to the grouping subject + activity.
    
    data = tidydata (step 4 data set)
    
    FUN = mean
*	order: by subject and activity.
*	write.table

Results:
* 180 rows (30 subjects * 6 activities)
* 81 columns

##### The final output is tidy_data.txt



