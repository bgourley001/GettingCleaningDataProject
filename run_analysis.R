#GettingAndCleaningData : Project
#run_analysis.R
#
#See README.md for run instructions and script details
#See Codebook.md for data description

#Load Required Packages
library(dplyr)

#Included functions declarations
#Function downloadFile
downloadFile <- function(url,dest.file,method) {
    download.file(url,dest.file,method)
}

#create data directory if it doesn't exist
if(!file.exists("data")) {
    dir.create("data")
}

#####################################################################################################
# Download Dataset.zip & extract the contents (requires curl)
#####################################################################################################
#Check to see if Dataset.zip exists in the data folder
#If it exists, then don't download and unzip it again
#To create a fresh dataset, delete the Dataset.zip file and 'UCI_HAR_Dataset" folder
#then run the script again
dest.file <- "data/Dataset.zip"
if(!file.exists("data/Dataset.zip")) {
    print(paste("Downloading Dataset - Please wait..."))
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    method="curl" 
    downloadFile(url,dest.file,method)
    #unzip Dataset
    unzip(dest.file,exdir="data")
    #The extracted zip file creates the folder 'UCI HAR Dataset' which has spaces in the filename
    #This would cause issues if analysis is run on a non-Windows platform so let's rename the folder
    #by replacing the spaces with underscores '_'
    file.rename("data/UCI HAR Dataset","data/UCI_HAR_Dataset")
    print(paste("Download Complete at ",Sys.time()))
} else {
    print(paste("Dataset.zip exists - skipping download"))
}

#####################################################################################################
# set the data path
#####################################################################################################
data.path <- "data/UCI_HAR_Dataset"

#####################################################################################################
# Read the Feature Names
#####################################################################################################
#x.test and x.train data column names are contained in the file 'features.txt'
#read features column names to a vector
features <- read.table(file.path(data.path,"features.txt"))

#clean up feature names
#Replace '-' and ',' with '.' 
feature.names <- features[,2]
feature.names <- gsub("[,-]",".",feature.names)
#remove '(' and ')'
feature.names <- gsub("[\\(\\)]","",feature.names)

#####################################################################################################
# Read Activity Labels
#####################################################################################################
#Activities are found in activity_labels.txt
#read the labels into df.activity
df.activity <- read.table(file.path(data.path,"activity_labels.txt"),col.names = c("id","activity"))
#Activity Labels are :
#1 WALKING
#2 WALKING_UPSTAIRS
#3 WALKING_DOWNSTAIRS
#4 SITTING
#5 STANDING
#6 LAYING

####################################################################################################
# Load the test data and test labels
####################################################################################################
#the file path to the test data and labels is data/UCI_HAR_Dataset/test/
#test set filename = X_test.txt
x.test <- read.table(file.path(data.path,"test","X_test.txt"),col.names = feature.names)

#read y_test.txt and label the table column as 'activity'
#y.test labels are activity references and range from 1:6 
y.test <- read.table(file.path(data.path,"test","y_test.txt"),col.names = c("activity"))

####################################################################################################
# Read the subject data
####################################################################################################
#Subject references are contained in the file 'subject_test.txt'
#read 'subject_test.txt' and label the column as 'subject'
subject.test <- read.table(file.path(data.path,"test","subject_test.txt"),col.names = c("subject"))

#####################################################################################################
#Combine the test data, subject and activity data frames
#####################################################################################################
test.data <- cbind(subject.test,y.test,x.test)

#####################################################################################################
# Load the training data and training labels
#####################################################################################################
#the file path to the training data and labels is data/UCI_HAR_Dataset/train/
#train set filename = X_train.txt
x.train <- read.table(file.path(data.path,"train","X_train.txt"),col.names = feature.names)

#read y_train.txt and label the table column as 'activity'
y.train <- read.table(file.path(data.path,"train","y_train.txt"),col.names = c("activity"))

######################################################################################################
# Load the training subject data
######################################################################################################
#Subject references are contained in the file 'subject_train.txt'
#read 'subject_train.txt' and label the column as 'subject'
subject.train <- read.table(file.path(data.path,"train","subject_train.txt"),col.names = c("subject"))

######################################################################################################
# Combine the training data, subject and activity data frames
######################################################################################################
train.data <- cbind(subject.train,y.train,x.train)

######################################################################################################
# Combine the test and training data into a single data frame
######################################################################################################
combined.data <- rbind(test.data,train.data)

######################################################################################################
# Extract mean and standard deviation measurements
######################################################################################################
#Construct a regular expression which matches only the std and mean variables
#Extract from the combined data only those variables which have '.std.' or '.mean.' in the name
#pattern will match features with '.std.' and '.mean.'
pattern <- "\\.(std|mean)\\."

#create data frame with only the selected features
selected.features <- select(combined.data,subject,activity,grep(pattern,names(combined.data)))

#sort selected.features by subject and activity
selected.features <- arrange(selected.features,subject,activity)

#Replace activity id's with activity labels
#There are only 6 activities so we will use a nested ifelse structure
selected.features$activity <- with(selected.features,
    ifelse(activity == 1, gsub("1",df.activity[1,2],activity),
        ifelse(activity == 2, gsub("2",df.activity[2,2],activity),
            ifelse(activity == 3, gsub("3",df.activity[3,2],activity),
                ifelse(activity == 4, gsub("4",df.activity[4,2],activity),
                    ifelse(activity == 5, gsub("5",df.activity[5,2],activity),
                        gsub("6",df.activity[6,2],activity))))))
)

########################################################################################################
# Create a tidy data set with calculated means for each subject and activity arranged by subject
########################################################################################################
#Convert activity labels into ordered factors so that arrange can retain the activity factor ordering
selected.features$activity <- factor(selected.features$activity,
                                     levels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                                                "SITTING","STANDING","LAYING"))

#create the tidy data set by first aggregating the mean of all variables except subject and activity,
#then arranging by subject and activity
subject.activity.means <- arrange(
    aggregate(selected.features[,3:50],
                    list(subject = selected.features$subject,
                    activity = selected.features$activity),mean),
        subject,activity)

########################################################################################################
# Write the tidy data set to the output folder
########################################################################################################
#create the output folder if it doesn't exist
if(!file.exists("output")) {
    dir.create("output")
}

#write out the tidy data set
output.file.folder <- "output"
write.table(subject.activity.means,file = file.path(output.file.folder,"subject_activity_means.txt"),
            row.names = FALSE)

########################################################################################################
# Test that the output tidy data set can be loaded 
########################################################################################################
#test reading the tidy data set
output.file.name <- "subject_activity_means.txt"
if(file.exists(file.path(output.file.folder,output.file.name))) {
    tidy.test <- read.table(file.path(output.file.folder,output.file.name),header = TRUE)
} else {
    paste("File",output.file.name,"does not exist",sep = " ")
}
