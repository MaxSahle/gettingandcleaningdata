print("Loading required libraries...")
library(plyr)
library(dplyr)
library(reshape2)
print("Reading data (1/2)....")
testx <- read.table(".\\X_test.txt")
testy <- read.table(".\\y_test.txt")
testsubject <- read.table(".\\subject_test.txt")
testy <- rename(testy, activity =V1)
testsubject <- rename(testsubject, subject=V1)
test <- cbind(testx, testy)
test <- cbind(testsubject, test)
print("Reading data (2/2)....")
trainx <- read.table(".\\X_train.txt")
trainy <- read.table(".\\y_train.txt")
trainsubject <- read.table(".\\subject_train.txt")
trainy <- rename(trainy, activity =V1)
trainsubject <- rename(trainsubject, subject=V1)
train <- cbind(trainx, trainy)
train <- cbind(trainsubject, train)
total <- rbind(train, test)
print("Reading data for activity labels...")
activity_labels <- read.table(".\\activity_labels.txt")
activity_labels <- activity_labels[,2]
activity_labels <- as.character(activity_labels)
#Name activities
print("Adding labels to activity data...")
for(i in 1:6){total$activity <- replace(total$activity, total$activity==i, activity_labels[i])}
#Activities:

print("Rearanging data and calculating mean for each activity for all subjects combined....")
activities <- melt(total, id=c("activity"))
activities <- dcast(activities, activity ~ variable, mean)

#subjects
print("Rearanging data and calculating mean for each activity per subject...")
subjects <- melt(total, id=c("subject", "activity"))
subjects <- dcast(subjects, subject+activity~variable, mean)

#combined
print("Combining results into one table.")
result <- rbind(activities, subjects)

#some renaming
print("Adding descriptive names to variables...")
result$subject[1:6]<-"All"
features <- read.table(".\\features.txt")
features <- features[,2]
for(i in 3:length(result)){names(result)[i] <- as.character(features[i-2])}
# mean and sd for each Measurement

print("Calculating mean and standard deviation for each variable...")
totalmelt <- melt(total, id=c("activity"))
measurementssummary <- ddply(totalmelt, c("activity", "variable"), summarise, mean = mean(value), sd = sd(value))

space <- ""
resulttitle <-"These are the results for step five of the final assignment. They contain the average of each variable for each activity and each subject."
measurementssummarytitle <- "These are the results for the second step of the final assignment. They contain the measurements on the mean and standard deviation for each measurement"
print(measurementssummarytitle)
print(space)
print(measurementssummary)
print(space)
print(space)
print(resulttitle)
print(space)
print(result)
print(space)
print(space)

write.table(result, file = "dataset", row.name= FALSE)

