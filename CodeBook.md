---
title: "CodeBook"
date: "November 20, 2015"
output: html_document
---
# Overview

This markdown document descibes the content, structure and the steps involed in creating a "Tidy" data set from the "Test" and "Training" set downloaded from [here][data source].  Details of how this data is structured can be found [here][data source description].

# Structure of source data

The source data is split into "Test" and "Training" data sets. The test data is contained in "X_test.txt" and  "y_test.txt", while the training data is contained in "X_train.txt" and  "y_train.txt".

Both "X_train.txt" and "X_test.txt" contain measurements for each category while "y_train.txt" and "y_test.txt" contain the labels for the measurement data.

The data in each data set consists of 561 attributes (columms) of data. There are 7352 instances (rows) in the "Training" data and 2947 instances (rows) in the test data.  
  

# Processing steps in detail

The following processing steps are performed by the R script "run_analysis.R".

## Phase 1: Merge "Training" and "Test" data sets

The "Training" and "Test" data were first merged into a single data set.  The combined data was also store and stored in the "./UCI HAR Dataset/combined" directory
    
The "X" data was stored in a file called "xcombined.txt" and the "Y" data was stored in a file called "ycombined.txt"

### Step 1: Create a directory to store merged data

The script first checks to see if a "combined" directory exists in the "UCI HAR Dataset" directory.  If this does not exist it creates on.  
    
This directory is used to store the combined training and test data sets.

### Step 2: Process X "training" and "test" data

The script then performs the following steps
    
    1. Reads in the x "test" data set
    2. Reads in the x "training" data set
    3. Combines the x "training" set with the x "test" set
    4. Writes the combined x data set out into a file called "xcombined.txt" 
    
    
### Step 3: Process Y "training" and "test" data
    
The script then performs the following steps

    1. Reads in the y "test" data set
    2. Reads in the y "training" data set
    3. Combines the y "training" and "test" data sets
    4. Writes the combined y data out into a a file called "ycombined.txt" 
    
### Step 4: Process subject "training" and "test" data
    
The script then performs the following steps

    1. Reads in the subject "test" data set
    2. Reads in the subject "training" data set
    3. Combines the subject "training" and "test" data sets
    4. Writes the combined subject data out into a a file called "subjectcombined.txt" 
    
## Phase 2: Process combined data

In this phase the combined data is processed and used to generate a new *tidy* data set
    
### Step 1: Read in the activity labels

The script then performs the following processing
    
    * Read in the data used to label the training data from "ycombined.txt"
    
### Step 2: Combine the activity label IDs with the measurement data

The script then performs the following processing

    * Combine the activity label IDs with the measurement data

### Step 3: Merge the Activity "Labels" with the measurement data

The script then performs the following processing

    * Combine the activity **labels** from "activity_labels.txt" with the measurement data

### Step 4: Remove Activity ID column from the merged data

The script then performs the following processing

    * Remove the superfluous activity *label ID* from the combined data
    
### Step 5: Extracts the "mean" and "std" data to a new data frame

The script then performs the following steps

    1. Extract the "std" and "mean" values fomr the combined data
    2. Store this data in a new "reduced" data frame

### Step 6: Add descriptive couumn names

The script then performs the following

    * Adds human readable column names to the new "reduced" data frame

### Step 10: Save "reduced" data to a file

The script then performs the following

    * Save the"reduced" data frame to "reduced.txt" in the "./UCI HAR Dataset/combined" directory

### Step 11: Generates tidy data set

The script then performs the following steps

    1. Process the "reduced" data frame
    2. Save the results to "tidy.txt" in the "./UCI HAR Dataset/combined" directory


[data source]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
[data source description]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones