#GetNCleanData

##Project Submission for Getting and Cleaning Data course

##Name: ProjectSubmission.R

##Type: Script for R package

###Inputs:
* $working_dir/UCI HAR Dataset/test/subject_test.txt
* $working_dir/UCI HAR Dataset/train/subject_train.txt
* $working_dir/UCI HAR Dataset/test/y_test.txt
* $working_dir/UCI HAR Dataset/train/y_train.txt
* $working_dir/UCI HAR Dataset/train/X_train.txt
* $working_dir/UCI HAR Dataset/test/X_test.txt
* $working_dir/UCI HAR Dataset/features.txt

###Output:
Tidy dataset of means of means and standar deviations grouped by Subject ID and Activity type.

###Function:
This script works on data captured by the sensors in a smartphone during an experiment involving 30 subjects performing various activities.
Further information referenced from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and
Coursera page: https://class.coursera.org/getdata-016/human_grading/view/courses/973758/assessments/3/submissions.

The script:

1.  combines data from the test and train sets i.e. 
	* a) X_train with X_test to form X dataframe
	* b) y_train with y_test to form y dataframe
	* c) subject_train with subject_test to form subject dataframe
	
2.  Loads data from features.txt into FEATURE dataframe

3.  Performs some housekeeping on description of FEATURE dataframe (remove whitespaces, convert "-" to "_", convert "," to "_", remove"()", convert "t" to "time", convert "f" to "freq")

4.  Adds FEATURE dataframe to X dataframe as variable column headers 

5.  Subsets columns which have "mean", "Mean" and "std" in the description

6.  Converts y dataframe from numeric code to character description as referenced in $working_dir/UCI HAR DATASET/activity_labels.txt 

7.  Combines subsetted X dataframe in (5) with subject dataframe and y dataframe to form on Activity dataframe

8.  Calculates the mean of all the variables in the Activity dataframe for each activity and each subject

The output upto step (7) looks like this:


|	FEATURES	                |
|:-----------------------------:|:-----:|
|	X-train			|y-train|
|:-----------------------------:|:-----:|
|	X-test			|y-test |

(REFERENCE:https://class.coursera.org/getdata-016/forum/thread?thread_id=50#comment-333)

Output:
Tidy data contained in text file located in working directory called ProjectSubmission.txt
