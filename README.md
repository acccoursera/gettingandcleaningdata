---
title: "README"
output: html_document
---
# Overview

This file describes how to use the file "run_analysis.R".

# Details

In order to successfully run "run_analysis.R" do the following 

1. Download the input dataset (in zipped format) from [here][data source]

2. Unzip the dataset into any local directory

    * Once this is done a directy called "UCI HAR Dataset" should exist
    
    
3. Copy the script "run_analysis.R" to directory where you unzipped the data set

    * E.g. This file should be copied to the parent directory of "UCI HAR Dataset"
    
    
4. From within your preferred "R" environemnt (e.g. RStudio), navigate to the directory that contains "run_analysis.R" and set this to you working directory

    * E.g. In the RStudio IDE choose "Session->Set Working Directory"

    
5. Call the "run_analysis.R" from within an R environment


  
NOTE: The script assumes that the dataset has been extracted to a sub-directory called *"UCI HAR Dataset"*.  If this directory does not exist it will **not run correctly**.



[data source]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip