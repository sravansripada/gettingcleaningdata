##Setting the directory
setwd("##################")

##Merge Test and Train Data

##1. Append X_Train and X_test
#####Read training and test data
X_test<-read.table("X_test.txt")
Y_test<-read.table("Y_test.txt")
X_train<-read.table("X_train.txt")
Y_train<-read.table("Y_train.txt")
subject_test<-read.table("subject_test.txt")
subject_train<-read.table("subject_train.txt")
features<-read.table("features.txt")
##################################################
##4. Rename columns
colnames(X_test)<-features[,2]
colnames(X_train)<-features[,2]
colnames(Y_train)<-"Activity"
colnames(Y_test)<-"Activity"
colnames(subject_test)<-"Subject"
colnames(subject_train)<-"Subject"

##Append X-train and x-test
X<-rbind(X_train,X_test)
Y<-rbind(Y_train,Y_test)
subject<-rbind(subject_train,subject_test)

##Merge the columns together
data<-cbind(X,Y,subject)
fix(data)
###Final Data - data
####################################################

##2. Extract only mean and std measurements
##extract mean
data_mean<-data[, grep(c('mean'),names(data))] 
##extract sd
data_std<-data[, grep(c('std'),names(data))] 
##extract activity
Activity<-data[, grep(c('Activity'),names(data))] 
##extract subject 
Subject<-data[, grep(c('Subject'),names(data))] 
##Merge all of them
data_mean_std<-cbind(data_mean,data_std,Activity,Subject)
fix(data_mean_std)
##########################################################

##3.Use descriptive activity names to name the activities in dataset
data_mean_std$Activity<-as.factor(data_mean_std$Activity)
levels(data_mean_std$Activity)<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
data_mean_std$Activity

###########################################################

##5. Making tidy data

library(dplyr)
tidy_data<-data_mean_std %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))
write.table(x = tidy_data,row.names = FALSE,file = "tidy_data.txt")

