
# instructions taken from the peer assessment web page on coursera

# you should create one R script called run_analysis.R that does the following.
# 1 - merges the training and the test sets to create one data set.
# 2 - extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 - uses descriptive activity names to name the activities in the data set
# 4 - appropriately labels the data set with descriptive variable names. 
# 5 - from the data set in step 4, creates a second, independent tidy data set with the average 
#     of each variable for each activity and each subject.
 
# change path name of working dir accordingly
mywd<-"." 

#set the working dir
setwd(mywd)

# set file url
myurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 

# download file
#download.file(myurl, destfile="dataset_local.zip")
 
# eventual use of the method curl for downloading
download.file(myurl, destfile="dataset_local.zip", method="curl")

# unzip file
unzip("dataset_local.zip")

# start here some housekeeping (tidying up dir and file names)

# remove annoying spaces and capital letters within working dir and file names 
# here define a recursive funcion for that purpose

# load the base package "tools" for the later use of function file_ext() inside the user defined function
# see next

library(tools)

# this is my user defined function
# for removing spaces and put everything in lowercase in dir and file name  

recursive_replace_lowercase<-function(path=".", replace=" ", with="_", lowercase=TRUE) {
  
  # this is the base case
  
  filelist<-list.files(path, full.names=TRUE)
  
  if (lowercase) {
    
    for(filename in filelist)
      
      if (file_ext(tolower(filename))!="r")
        
        file.rename(filename,gsub(replace, with, tolower(filename)))
    
  } else {
    
    for(filename in filelist)
      
      if (file_ext(tolower(filename))!="r")
        
        file.rename(filename, gsub(replace, with, filename))
  }
  
  # and this is the recursive part of the function
  
  dirlist<-list.dirs(path, full.names=TRUE, recursive=FALSE)
  
  if(length(dirlist)) {
    
    for(dirname in dirlist)
      recursive_replace_lowercase(dirname, replace=replace, with=with,
                                  lowercase=lowercase)
  }
  
}

# apply the user defined function to the current working dir 
# where it is supposed to be the dataset, eventually change accordingly

recursive_replace_lowercase()

#set test path
testpath<-"./uci_har_dataset/test/"

#read test files
xtest<-read.table(paste0(testpath,"x_test.txt"))
ytest<-read.table(paste0(testpath,"y_test.txt"))
stest<-read.table(paste0(testpath,"subject_test.txt"))

# rename columns
names(ytest)<-"activity"
names(stest)<-"subject"

#column bind test dataset
test<-cbind(xtest, ytest, stest)

names(test)
dim(test)

#set train path
trainpath<-"./uci_har_dataset/train/"

#read train files
xtrain<-read.table(paste0(trainpath,"x_train.txt"))
ytrain<-read.table(paste0(trainpath,"y_train.txt"))
strain<-read.table(paste0(trainpath,"subject_train.txt"))

# change names
names(ytrain)<-"activity"
names(strain)<-"subject"

# column bind train data set
train<-cbind(xtrain, ytrain, strain)

names(train)
dim(train)

# row bind of test and train dataset
all<-rbind(test, train)

names(all)
dim(all)

# check number of rows
dim(all)[1]==(dim(train)[1]+dim(test))[1]

# check number of columns
dim(all)[2]== dim(train)[2] & dim(test)[2]

# read file for activity labels
act_labs<-read.table("./uci_har_dataset/activity_labels.txt")
names(act_labs)<-c("activity","activity_label")

# and this is completing step 1 of the assignment
all<-merge(all, act_labs, sort=FALSE)
names(all)
head(all)
dim(all)

# rearrange columns of df
# important step for the proper selection of variables, see next
all<-all[,c(2:564,1)]
names(all)

# load feature labels - variable names
feat_labs<-read.table("./uci_har_dataset/features.txt", stringsAsFactors = FALSE)
names(feat_labs)<-c('Vnum', 'feature_label')

# here to select variables ending with mean() or std()
# single pattern
#feat_labs[grep('mean()',feat_labs$feature_label, fixed=TRUE),]
#feat_labs[grep('std()',feat_labs$feature_label, fixed=TRUE),]
#feat_labs[grep('\\b*-mean()\\b',feat_labs$feature_label),]
#feat_labs[grep('\\b*-std()\\b',feat_labs$feature_label),]

# one shot: multiple pattern
toMatch <- c("\\b*-mean()\\b", "\\b*-std()\\b")
paste(toMatch,collapse="|")

# define selected features names and corresponding variable number
sub_feat<-feat_labs[grep(paste(toMatch,collapse="|"),feat_labs$feature_label),]

# export selected features for reference
#write.table(sub_feat, "selected_features.txt", row.names=FALSE)

# indices of columns to be selected
col_index<-sub_feat$Vnum

# subset data by col index
# and this is completing step 2 of the assignment
my_subset<-all[ , c(col_index, 562:564)]

dim(my_subset)

# assign decriptive names to variables
# and this is completing steps 3 and 4 of the assignment 
# (along with has already been done on beforehand)

# assign name to variables: dimensionless (standardized -1,1)
names(my_subset)[-c(67:69)]<-sub_feat$feature_label

# check
names(my_subset)
str(my_subset)

# use more descriptive names for variables
names(my_subset)<-gsub("Acc", "Accelerometer", names(my_subset))
names(my_subset)<-gsub("BodyBody", "Body", names(my_subset))
names(my_subset)<-gsub("^f", "Frequency", names(my_subset))
names(my_subset)<-gsub("Gyro", "Gyroscope", names(my_subset))
names(my_subset)<-gsub("Mag", "Magnitude", names(my_subset))
names(my_subset)<-gsub("^t", "Time", names(my_subset))

# create an independent tidy data set 
# with the average of each variable for each activity and each subject
my_means<-aggregate(my_subset[,1:66], list(subject=my_subset[,67], activity=my_subset[,68] ), mean, na.rm=TRUE)

# alternative using the formula approach
# aggregate(. ~ subject + activity+ activity_label, data=my_subset, mean, na.rm=TRUE)

# check dimensions: (subjects * activities) equals n rows of my_means df
length(unique(my_subset[,67])) * length(unique(my_subset[,68]))==nrow(my_means)

# check
dim(my_means)

#export final result
# and this is completing step 5
write.table(my_means, "./export_dataset.txt", row.names=FALSE)
