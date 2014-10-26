
# runAnalysis
#   perform the data merging and analysis described in Coursera's "Getting and Cleaning Data" project
#
# outFile : output file name
runAnalysis <- function(out_file = "./tidy_data_set.txt") {

    library(reshape2)    
    
    # makeFilePath
    #   convenience function to construct a file path to a specific data file.
    #
    # data_name : data file name without extension
    # set_type : should be NULL, "test" or "train"
    # ext : data file extension. Default is ".txt"    
    #
    makeFilePath <- function(data_name, set_type = NULL, ext = ".txt") {
        elems = c("./UCI HAR Dataset/")
        if (!is.null(set_type)){
            elems <- append(elems, c(set_type, "/", data_name ,"_", set_type)) 
        } else {
            elems <- append(elems, c(data_name))
        }
        elems <- append(elems, c(ext))
        paste(elems, sep = "", collapse = '')
    }
    
    # readData
    #   convenience function to read a specific data file using read.table 
    #
    # data_name : data file name without extension
    # set_type : should be NULL, "test" or "train"
    # ext : data file extension. Default is ".txt"     
    #
    readData <- function(data_name, set_type = NULL, ext = ".txt") {
        read.table(makeFilePath(data_name, set_type, ext))
    }    
    
    # mergeDataSet
    #   merge "test" and "train" set, keeping only the measurements on the mean and standard deviation.
    #
    mergeDataSet <- function() {    
        
        # read features
        features <- readData("features")[,2]
        
        # keep features whose name contains "mean()" or "std()"
        features_to_extract = grep("mean\\(\\)|std\\(\\)", features)
        
        # read activity labels
        activity_labels = readData("activity_labels")[,2]
        
        # set to merge
        data_set = c("test","train")
        
        # initialize result data to empty
        data = {}
        
        # for each set 
        for (set_type in data_set) {
            
            # read X data, label it and extract features we are interested in
            X <- readData("X", set_type)
            names(X) <- features
            X <- X[,features_to_extract]
            
            # read Y data, replace activity values with actity labels and label the column as "Activity"
            Y <- readData("Y", set_type)
            Y[,1] <- activity_labels[Y[,1]]
            names(Y) <- "Activity"
            
            # read subject data and label it
            subject <- readData("subject", set_type)
            names(subject) <- "Subject"
            
            # merge X data with Y data
            current_set_data <- cbind(X, Y, subject)    
            
            # merge current data set with previous data set
            data <- rbind (data, current_set_data)            
        }
        # result of all the sets merged
        data
    }
    # merged data of all sets
    data <- mergeDataSet()
    # molten data with Activity and Subject as Ids
    molten_data = melt(data, id.vars=c("Activity", "Subject"))
    # cast molten data with the average of each variable for each activity and each subject
    tidy_data = dcast(molten_data, Activity + Subject ~ variable, mean)
    #write tidy data to "tidy_data_set.txt"
    write.table(tidy_data, file = out_file, row.names = FALSE)
}
