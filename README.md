---
title: "Getting and Cleaning Data : Course Project : README.md"
author: "William Gourley"
date: "25 July 2015"
output: html_document
---

# Overview

This readme describes the script `run_analysis.R` which was created to produce the tidy data set
required for the Course Project.

The readme contains the following:

    1. Course Project Details.
    2. The data folder strucure.
    3. Run instructions for the script.
    4. Tidy Data and Variable Selection Rationale
    5. Output file description

A description of the data variables contained in the output file can be found in the file : `CodeBook.md`
stored in the repository.

For convenience, the repository also contains the following files which describe the original raw data set.
These have been obtained from the UCI_HAR_Dataset folder created during the download section of the `run_analysis.R`
script.

    activity_labels.txt
    features.txt
    features_info.txt
    original_README.md (file renamed to avoid conflict with this readme)

The github repository can be found here :

[GettingCleaningDataProject](https://github.com/bgourley001/GettingCleaningDataProject.git)
    
## 1. Course Project Details

From the project assignment instructions :

`The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.` 
`The goal is to prepare tidy data that can be used for later analysis.`

There are 6 main tasks which the script performs :

    1. Download the raw data set
    2. Merge the training and test data sets
    3. Extract mean and standard deviation mesurement variables
    4. Replace activity id's with their associated activity names
    5. Label the variables in the data set appropriately
    6. Create and output an independent tidy data set with the average of each subject/activity combination

## 2. Data Folder Structure

The project data folder structure is as follows :

    Root folder (working directory)
        |
        |-- data/
        |     |-- UCI_HAR_Dataset/
        |            |- test/
        |            |- train/
        |-- output/
        
The script creates the required folder structure automatically if it doesn't already exist.

Note :
When the downloaded dataset zip file is unzipped, the folder `UCI HAR Dataset` folder is created.
The script replaces the spaces in the folder name with underscores to prevent the spaces creating
folder access issues if the script is run in a Unix type environment.

**To ensure that the folder structure is created under the desired Root folder, please set
your working directory to an appropriate location before running the script.- see example below.**
    
        Example : my working directory on my local machine is set with
            
            `setwd("I:/Coursera/GettingCleaningData/GettingCleaningDataProject")`
            
## 3. Script Run Instructions

### Required R Packages
The script requires the following packages installed before running:

    dplyr

The packages can be installed using the `install.packages("package name")` command

### Run Instructions
The `run_analysis.R` script can be run from within `RStudio` or the `R Console` or from the command line.

The script does not require any arguments.

### Script Structure and Description
The script is broken up into several commented sections.
Full details of the script operations can be found in the script comments.

## 4. Tidy Data and Variable Selection Rationale
### Tidy Data
For this project, a wide-format tidy data set was selected.

The first 2 columns contain id values, the remainder contain the average of each selected measurement variable.
Each row in the data set contains a single observation of subject and activity.

This satisfies the requirements of the assignment and also satisfies the definition of tidy data as 
described in the following article from :

    Journal of Statistical Software
    MMMMMM YYYY, Volume VV, Issue II. 
    http://www.jstatsoft.org/

    Author : Hadley Wickham (RStudio)

[Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf)

### Variable Selection
The variables selected to form the final tidy data set are those which contain std or mean in the original
raw data variable names but do not include meanFreq in the name as these can be calculated from the selected variables 

Without further information on types of future analysis, it is difficult to judge beforehand, which variable set best meets
the needs of the analysis, so there may be valid cases for several different variable selection subsets.

The selected variables result in a total of 66 variable columns + a column each for subject and activity
for a total of 68 columns.

There are 6 observations of each activity per subject and there are 30 subjects giving a total of 180 rows 
to be included in the final tidy data set.

### Variable Naming
The original variable names have been modified by removing brackets and replacing dashes with a period. 
This is to aid readibilty and to avoid the brackets conflicting with any function calls.

Long and verbose variable names have not been used to avoid over-wide columns when viewing the data.

Descriptions of the variable names can be found in the `CodeBook.md` file in the repository.

## 5. Output File Description
The output file `subject_activity_means.txt` is a text file produced and stored in the `output` folder using the 
following commands.

    output.file.folder <- "output"
    write.table(subject.activity.means,file = file.path(output.file.folder,"subject_activity_means.txt"),
            row.names = FALSE)
    
The table contained in `subject_activity_means.txt` can be read into `tidy.test` using the following commands.

    output.file.name <- "subject_activity_means.txt"
    if(file.exists(file.path(output.file.folder,output.file.name))) {
        tidy.test <- read.table(file.path(output.file.folder,output.file.name),header = TRUE)
    } else {
        paste("File",output.file.name,"does not exist",sep = " ")
    }








    

