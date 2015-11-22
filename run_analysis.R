source("add_column_names.R")
source("extract_reduced_data.R")
source("generate_tidy_data.R")

run_analysis <- function(){

    ## Create a directory to store merged data  
    if(!file.exists("./UCI HAR Dataset/combined")) 
      dir.create("./UCI HAR Dataset/combined")
  
    #
    # Process X "training" and "test" data
    #
    
    ## Read in the x "test" data set
    xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, strip.white=TRUE)
    ## Read in the x "training" data set
    xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, strip.white=TRUE)
    
    ## Combine the x "training" set with the x "test" set
    xcombined <- rbind(xtrain, xtest)
    ## Write combined x data set out into a file
    write.table(xcombined, "./UCI HAR Dataset/combined/xcombined.txt", sep=" ", row.names=FALSE, col.names=FALSE)
    
    
    #
    # Process Y "training" and "test" data
    #
    
    ## Read in the y "test" data set
    ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, strip.white=TRUE)
    ## Read in the y "training" data set
    ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE, strip.white=TRUE)
    
    ## Combine the y "training" and "test" data sets => Actually activity
    ycombined <- rbind(ytrain, ytest)
    ## Write combined y data out into a file
    write.table(ycombined, "./UCI HAR Dataset/combined/ycombined.txt", sep=" ", row.names=FALSE, col.names=FALSE)
     
    
    #
    # Process Subject "training" and "test" data
    #
    
    ## Read in the y "test" data set
    subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, strip.white=TRUE)
    ## Read in the y "training" data set
    subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, strip.white=TRUE)
    
    ## Combine the y "training" and "test" data sets => Actually activity
    subjectcombined <- rbind(subjecttrain, subjecttest)
    ## Write combined y data out into a file
    write.table(ycombined, "./UCI HAR Dataset/combined/subjectcombined.txt", sep=" ", row.names=FALSE, col.names=FALSE)
    
    
    ## Read in the activity labels
    activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, strip.white=TRUE)
  
    ## Combine the activity label IDs with the measurement data
    xcombinedWithActivityIDsAndSubject <- data.frame(ycombined, xcombined, subjectcombined)
    
    ## Merge the Activity "Labels" with the measurement data
    mergedx <- merge(activitylabels, xcombinedWithActivityIDsAndSubject,by="V1")
    
    
    
    ## Remove Activity ID column
    mergedx$V1 <- NULL
    
    ## Extract the "mean" and "std" data
    reduced <- extract_reduced_data(mergedx)
    
    ## Add descriptive couumn names
    reduced <- add_column_names(reduced)
    
    ## Save "reduced" data to a file
    write.table(reduced, "./UCI HAR Dataset/combined/reduced.txt", sep=" ", row.names=FALSE, col.names=TRUE)

    ## generate tidy data
    tidydata <- generate_tidy_data(reduced)
    
    ## Save "tidy" data to a file
    write.table(tidydata, "tidy.txt", sep=" ", row.names=FALSE, col.names=FALSE)
    
    
    reduced
}
