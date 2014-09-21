gettingcleaningdata
===================

Course project submission for getting and cleaning data

##Please note that the course project assignment questions are not solved in the order in which they were asked. 
I have included the question number #1, #2 etc for respective parts of the code

1. The name of the R code is run_Analysis.R
2. First step is to set the directory. Working directory should have all the raw data files
3. Test and Train data along with features is read using read.table command
4. All the column names have been renamed as needed 
5. X training and test set have been appended using rbind and Y, subject sets are merged using cbind. Please note that ordering
of the variabels doesnt change here unlike the merge command
6. Extracted only the mean and standard deviation columns
7. Created final dataset with mean, std columns, Activity and Subject
8. Descriptive activity names have been used to name the activities
9. Script to make the data tidy

