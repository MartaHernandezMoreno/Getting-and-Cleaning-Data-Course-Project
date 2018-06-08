# CODEBOOK
This codebook describes the data used in this project.

## Dataset
The data linked to from the website http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

## Analysis files
The files that have been used in this project are:

#### SUBJECT FILES
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
*	test/subject_test.txt
*	train/subject_train.txt

#### DATA FILES
*	test/X_test.txt
*	train/X_train.txt

#### ACTIVITY FILES
* test/y_test.txt
*	train/y_train.txt

#### FEATURES
Names of column variables in the dataTable.
* features.txt

#### ACTIVITY LABELS
Links the class labels with their activity name.
* activity_labels.txt
