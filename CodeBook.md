---
title: "Getting and Cleaning Data : Course Project : CodeBook.md"
author: "William Gourley"
date: "26 July 2015"
output: html_document
---

# Overview

This codebook describes the data variables which make up the tidy data set produced by
the script `run_analysis.R`.

The variables detailed here are derived from the raw data variables contained in the
data sets downloaded from the following link :

[Course Project Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The raw data variables are described in the following files :

    activity_labels.txt
    features.txt
    features_info.txt

These files are included in the download, and can also be found in the github repository :

[GettingCleaningDataProject](https://github.com/bgourley001/GettingCleaningDataProject.git)

Details of how the tidy data set was produced are contained in the `README.md` and can be found in the github
repository.

# Tidy Data Set Description

The data set produced by `run_analysis.R` is a wide-format table comprised of 66 variable columns + a column each for subject and activity
for a total of 68 columns.

There are 6 observations of each activity per subject and there are 30 subjects giving a total of 180 rows 

Each variable column is the average value of each measurement for a combination of each activity per subject.

The data set is ordered by subject id number and activity.

# Variable Naming

The original dataset variable names were modified by removing brackets and replacing dashes with a period. 
This is to aid readibilty and to avoid the brackets conflicting with any function calls.

Long and verbose variable names were not used to avoid over-wide columns when viewing the data.

The variable names are constructed using the following pattern :

    {source domain}{motion type}.{measurement function}.{direction}
    
where the values are :

    {source domain}         : t                 : Time Domain
                            : f                 : Frequency Domain
    {motion type}           : BodyAcc           : Body Acceleration
                            : GravityAcc        : Gravity Acceleration
                            : BodyGyro          : Body Linear Velocity
                            : BodyAccJerk       : Body Linear Acceleration
                            : BodyGyroJerk      : Body Angular Velocity
                            : BodyAccMag        : Body Acceleration Magnitude
                            : GravityAccMag     : Gravity Acceleration Magnitude
                            : BodyAccJerkMag    : Body Linear Acceleration Magnitude
                            : BodyGyroJerkMag   : Body Angular Velocity Magnitude
    {measurement function}  : mean              : Mean of the Measurement
                            : std               : Standard Deviation of the Measurement
    {direction}             : X                 : Measurement on the X-Axis
                            : Y                 : Measurement on the Y-Axis
                            : Z                 : Measurement on the Z-Axis
    
    `Examples :
    
        tBodyAcc.mean.X = Time Domain measurement of the mean Body Acceleration in the X-Axis`
        fBodyAccMag.mean = Frequency Domain measurement of the mean Body Acceleration Magnitude`
        
The definitions above were derived from the information contained in the `features_info.txt` file.

### Variable Naming Anomalies
There are a number of Frequency Domain magnitude variables which have `BodyBody` in their names. From
studying the pattern used to derive variables, it looks like a second `Body` term was introduced by mistake.

For this project, the second `Body` term has not been removed.

### Further Information on Time and Frequency Domains and Fourier Transforms

Note:
    For those interested in understanding more about Time Domain, Frequency Domain and Fourier Transforms,
    I found these sources particularly informative :
    
[Time Domain](https://en.wikipedia.org/wiki/Time_domain)

[Frequency Domain](https://en.wikipedia.org/wiki/Frequency_domain)

[Fourier Transforms](https://en.wikipedia.org/wiki/Fast_Fourier_transform)

#List of Variables Definitions

Column | Variable Name                     | Definition
-------|-----------------------------------|-------------------------------------------------------
1      | subject                           | Subject Reference ID Number
2      | activity                          | Activity Performed
3      | tBodyAcc.mean.X                   | Time Domain Mean Body Acceleration in the X-Axis
4      | tBodyAcc.mean.Y                   | Time Domain Mean Body Acceleration in the Y-Axis
5      | tBodyAcc.mean.Z                   | Time Domain Mean Body Acceleration in the Z-Axis
6      | tBodyAcc.std.X                    | Time Domain Standard Deviation Body Acceleration in the X-Axis
7      | tBodyAcc.std.Y                    | Time Domain Standard Deviation Body Acceleration in the Y-Axis
8      | tBodyAcc.std.Z                    | Time Domain Standard Deviation Body Acceleration in the Z-Axis
9      | tGravityAcc.mean.X                | Time Domain Mean Gravity Acceleration in the X-Axis
10     | tGravityAcc.mean.Y                | Time Domain Mean Gravity Acceleration in the Y-Axis
11     | tGravityAcc.mean.Z                | Time Domain Mean Gravity Acceleration in the Z-Axis
12     | tGravityAcc.std.X                 | Time Domain Standard Deviation Gravity Acceleration in the X-Axis
13     | tGravityAcc.std.Y                 | Time Domain Standard Deviation Gravity Acceleration in the Y-Axis
14     | tGravityAcc.std.Z                 | Time Domain Standard Deviation Gravity Acceleration in the Z-Axis
15     | tBodyAccJerk.mean.X               | Time Domain Mean Body Linear Acceleration in the X-Axis
16     | tBodyAccJerk.mean.Y               | Time Domain Mean Body Linear Acceleration in the Y-Axis
17     | tBodyAccJerk.mean.Z               | Time Domain Mean Body Linear Acceleration in the Z-Axis
18     | tBodyAccJerk.std.X                | Time Domain Standard Deviation Body Linear Acceleration in the X-Axis
19     | tBodyAccJerk.std.Y                | Time Domain Standard Deviation Body Linear Acceleration in the Y-Axis
20     | tBodyAccJerk.std.Z                | Time Domain Standard Deviation Body Linear Acceleration in the Z-Axis
21     | tBodyGyro.mean.X                  | Time Domain Mean Body Linear Velocity in the X-Axis
22     | tBodyGyro.mean.Y                  | Time Domain Mean Body Linear Velocity in the Y-Axis
23     | tBodyGyro.mean.Z                  | Time Domain Mean Body Linear Velocity in the Z-Axis
24     | tBodyGyro.std.X                   | Time Domain Standard Deviation Body Linear Velocity in the X-Axis
25     | tBodyGyro.std.Y                   | Time Domain Standard Deviation Body Linear Velocity in the Y-Axis
26     | tBodyGyro.std.Z                   | Time Domain Standard Deviation Body Linear Velocity in the Z-Axis
27     | tBodyGyroJerk.mean.X              | Time Domain Mean Body Angular Velocity in the X-Axis
28     | tBodyGyroJerk.mean.Y              | Time Domain Mean Body Angular Velocity in the Y-Axis
29     | tBodyGyroJerk.mean.Z              | Time Domain Mean Body Angular Velocity in the Z-Axis
30     | tBodyGyroJerk.std.X               | Time Domain Standard Deviation Body Angular Velocity in the X-Axis
31     | tBodyGyroJerk.std.Y               | Time Domain Standard Deviation Body Angular Velocity in the Y-Axis
32     | tBodyGyroJerk.std.Z               | Time Domain Standard Deviation Body Angular Velocity in the Z-Axis
33     | tBodyAccMag.mean                  | Time Domain Mean Body Acceleration Magnitude
34     | tBodyAccMag.std                   | Time Domain Standard Deviation Body Acceleration Magnitude
35     | tGravityAccMag.mean               | Time Domain Mean Gravity Acceleration Magnitude
36     | tGravityAccMag.std                | Time Domain Standard Deviation Gravity Acceleration Magnitude
37     | tBodyAccJerkMag.mean              | Time Domain Mean Body Linear Acceleration Magnitude
38     | tBodyAccJerkMag.std               | Time Domain Standard Deviation Body Linear Acceleration Magnitude
39     | tBodyGyroMag.mean                 | Time Domain Mean Body Linear Velocity Magnitude
40     | tBodyGyroMag.std                  | Time Domain Standard Deviation Body Linear Velocity Magnitude
41     | tBodyGyroJerkMag.mean             | Time Domain Mean Body Angular Velocity Magnitude
42     | tBodyGyroJerkMag.std              | Time Domain Standard Deviation Body Angular Velocity Magnitude
43     | fBodyAcc.mean.X                   | Frequency Domain Mean Body Acceleration in the X-Axis
44     | fBodyAcc.mean.Y                   | Frequency Domain Mean Body Acceleration in the Y-Axis
45     | fBodyAcc.mean.Z                   | Frequency Domain Mean Body Acceleration in the Z-Axis
46     | fBodyAcc.std.X                    | Frequency Domain Standard Deviation Body Acceleration in the X-Axis
47     | fBodyAcc.std.Y                    | Frequency Domain Standard Deviation Body Acceleration in the Y-Axis
48     | fBodyAcc.std.Z                    | Frequency Domain Standard Deviation Body Acceleration in the Z-Axis
49     | fBodyAccJerk.mean.X               | Frequency Domain Mean Body Linear Acceleration in the X-Axis
50     | fBodyAccJerk.mean.Y               | Frequency Domain Mean Body Linear Acceleration in the Y-Axis
51     | fBodyAccJerk.mean.Z               | Frequency Domain Mean Body Linear Acceleration in the Z-Axis
52     | fBodyAccJerk.std.X                | Frequency Domain Standard Deviation Body Linear Acceleration in the X-Axis
53     | fBodyAccJerk.std.Y                | Frequency Domain Standard Deviation Body Linear Acceleration in the Y-Axis
54     | fBodyAccJerk.std.Z                | Frequency Domain Standard Deviation Body Linear Acceleration in the Z-Axis
55     | fBodyGyro.mean.X                  | Frequency Domain Mean Body Linear Velocity in the X-Axis
56     | fBodyGyro.mean.Y                  | Frequency Domain Mean Body Linear Velocity in the Y-Axis
57     | fBodyGyro.mean.Z                  | Frequency Domain Mean Body Linear Velocity in the Z-Axis
58     | fBodyGyro.std.X                   | Frequency Domain Standard Deviation Body Linear Velocity in the X-Axis
59     | fBodyGyro.std.Y                   | Frequency Domain Standard Deviation Body Linear Velocity in the Y-Axis
60     | fBodyGyro.std.Z                   | Frequency Domain Standard Deviation Body Linear Velocity in the Z-Axis
61     | fBodyAccMag.mean                  | Frequency Domain Mean Body Acceleration Magnitude
62     | fBodyAccMag.std                   | Frequency Domain Standard Deviation Body Acceleration Magnitude
63     | fBodyBodyAccJerkMag.mean          | Frequency Domain Mean Body Linear Acceleration Magnitude
64     | fBodyBodyAccJerkMag.std           | Frequency Domain Standard Deviation Body Linear Acceleration Magnitude
65     | fBodyBodyGyroMag.mean             | Frequency Domain Mean Body Linear Velocity Magnitude
66     | fBodyBodyGyroMag.std              | Frequency Domain Standard Deviation Body Linear Velocity Magnitude
67     | fBodyBodyGyroJerkMag.mean         | Frequency Domain Mean Body Angular Velocity Magnitude
68     | fBodyBodyGyroJerkMag.std          | Frequency Domain Standard Deviation Body Angular Velocity Magnitude

# Units Of Measure

From the definitions of Time and Frequency Domain and Fourier Transformation linked to above in this CodeBook :

For Time Domain measurements, the original units of measure would have been some multiple of time, in seconds.

For Frequency Domain measurements, the original units of measure would have been some multiple of frequency, in hertz

However, all measurements in the raw data sets, have been normalized and bounded within the range [-1,1].

This would indicate that, for the purpose of future analysis, the original units of measure themselves are not of primary
importance, but rather the relative value relationships between the variables is. This is a common pre-processing preparatory 
step before carrying out any modelling on the variables. 
Normalizing and bounding remove the relative effects of outlier and other unusual values which would otherwise have a major 
influence on the modelling results.


    


