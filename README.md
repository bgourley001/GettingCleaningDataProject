---
title: "Getting and Cleaning Data : Course Project : README.md"
author: "William Gourley"
date: "25 July 2015"
output: html_document
---

# Overview

This readme describes the script run_analysis.R which was created to produce the tidy data set
required for the Course Project.

The readme contains the following:

    1. Course Project Details.
    2. The data folder strucure.
    3. Run instructions for the script.
    4. Output file description

A description of the data variables contained in the output file can be found in the file : CodeBook.md
which can also be found in the repository.

For convenience, the repository also contains the following files which describe the original raw data set.
These have been obtained from the UCI_HAR_Dataset folder created during the download section of the run_analysis.R
script.

    activity_labels.txt
    features.txt
    features_info.txt
    original_README.md (file renamed to avoid conflict with this readme)
    
## 1. Course Project Details

From the project assignment instructions :

`The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.` 
`The goal is to prepare tidy data that can be used for later analysis.`

There are 6 tasks which the script performs :

    1. Download the raw data set
    2. Merge the training and test data sets
    3. Extract mean and standard deviation mesurement variables
    4. Replace activity id's with their associated activity names
    5. Label the variabes in the data set appropriately
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



    

