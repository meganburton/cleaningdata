CodeBook
=========

## Scripts
Only one script is needed to run all of the analysis for the course project. Using [run_analysis.R](https://github.com/meganburton/cleaningdata/blob/master/run_analysis.R). Running this script in RStudio will load the data onto the console and clean it up. Further, it will run some analysis to calculate the average of the columns included in the data set. A smaller, tidy set is created at the end of the script. 

### Data
The script creates a tidy data frame called ```data```. This data frame has been created by combining several different data sets from the original source. In addition, column names from the ```features``` data are used to name the columns in ```data```. These column names are then changed to make them more readable. 

The following data sets are combined to make the larger data set:
* X_test.txt
* X_train.txt
* y_test.txt
* y_train.txt
* features.txt
* activity_level.txt

A subset of this data set is taken. This subset only includes measures from the data that involve the mean or standard deviation. 

### Variables
The first column in ```data``` is the subject ID. The second is activity level. The rest of the columns are  means and standard deviations of various measurements broken down by subject and activity level. 

### Transformations
The following transformations are performed by the script:
1. Merge test and train group subject data (via ```rbind```)
2. Merge test and train group y_data (via ```rbind```)
3. Merge test and train group x_data (via ```rbind```)
4. Name the merged data columns using ```features.txt``` (via ```colnames```)
5. Merge the previous data sets into one frame (via ```cbind```)
6. Rename all the columns to be more readable
7. Turn activity column into a factor with readable levels
8. Use ```ddply``` from the ```plyr``` package to calculate the mean for each column based on the unique subject id and activity level
9. Write out this information to a simple and tidy data set, ```output.txt o```
