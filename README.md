cleaningdata
============

Course Project for Getting and Cleaning Data

## Running the analysis
run_analysis.R is an R script responsible for collecting, cleaning and analyzing data. It assumes that the data sets are all contained in the ./data/UCI HAR Dataset. Further, the expected file names are as follows:

* X_test.txt
* X_train.txt
* y_test.txt
* y_train.txt
* features.txt
* activity_level.txt

The script depends on the ```plyr``` package. Once the script has been run, a tidy set, output.txt, is written. 

### Steps to run the analysis

1. Fork and clone this repository using the fork icon in the top right corner
2. Inside RStudio, set your current working directory to the project root
3. Install ```plyr``` if you have not done so - install.package("plyr"); library(plyr)
4. Run the script using the run button or source('./run_analysis.R')


