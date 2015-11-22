source("add_column_names.R")

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
     
    ## Read in the activity labels
    activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, strip.white=TRUE)
  
    ## Combine the activity label IDs with the measurement data
    xcombinedWithActivityIDs <- data.frame(ycombined, xcombined)
    
    ## Merge the Activity "Labels" with the measurement data
    mergedx <- merge(activitylabels, xcombinedWithActivityIDs,by="V1")
    
    ## Remove Activity ID column
    mergedx$V1 <- NULL
    
    ## Extract the "mean" and "std" data
    reduced <- data.frame(mergedx$V2.x,
                          mergedx$V1.1, mergedx$V2.y, mergedx$V3, mergedx$V4, mergedx$V5, mergedx$V6, 
                          mergedx$V41, mergedx$V42, mergedx$V43, mergedx$V44, mergedx$V45, mergedx$V46,
                          mergedx$V81, mergedx$V82, mergedx$V83, mergedx$V84, mergedx$V85, mergedx$V86,
                          mergedx$V121, mergedx$V122, mergedx$V123, mergedx$V124, mergedx$V125, mergedx$V126,
                          mergedx$V161, mergedx$V162, mergedx$V163, mergedx$V164, mergedx$V165, mergedx$V166,
                          mergedx$V201, mergedx$V202, mergedx$V214, mergedx$V215, mergedx$V227, mergedx$V228,
                          mergedx$V240, mergedx$V241, mergedx$V253, mergedx$V254, 
                          mergedx$V266, mergedx$V267, mergedx$V268, mergedx$V269, mergedx$V270, mergedx$V271,
                          mergedx$V345, mergedx$V346, mergedx$V347, mergedx$V348, mergedx$V349, mergedx$V350,
                          mergedx$V424, mergedx$V425, mergedx$V426, mergedx$V427, mergedx$V428, mergedx$V429,
                          mergedx$V503, mergedx$V504, mergedx$V516, mergedx$V517, mergedx$V529, mergedx$V530,
                          mergedx$V542, mergedx$V543
                          )
    ## Add descriptive couumn names
    reduced <- add_column_names(reduced)
    
    ## Save "reduced" data to a file
    write.table(reduced, "./UCI HAR Dataset/combined/reduced.txt", sep=" ", row.names=FALSE, col.names=TRUE)

    ## generate averages...
    
}
