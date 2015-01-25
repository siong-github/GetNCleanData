#Updated for Jan 2015 session
#Load data into data frame and combine
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep=" ",header=FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep=" ",header=FALSE)
subject <- rbind(subject_train, subject_test)
names(subject) <- c("SubjectId")

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep=" ",header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", sep=" ",header=FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
X_data <- rbind(X_train,X_test)
y_data <- rbind(y_train,y_test)

#Read in variables
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
feature_label <- features[,2]
#Clean up variable labels
feature_label <- sub("t","time",feature_label)
feature_label <- sub("f","freq",feature_label)
feature_label <- sub("-","_",feature_label)
feature_label <- sub("-","_",feature_label)
feature_label <- sub("\\(\\)","",feature_label)
feature_label <- sub(",","_",feature_label)

#Add to X and y data frame
names(X_data) <- feature_label
names(y_data) <-c("Activity_code")


#Map activity code to activity description
y_data$activity[y_data$Activity_code == 1] <- "WALKING"
y_data$activity[y_data$Activity_code == 2] <- "WALKING_UPSTAIRS"
y_data$activity[y_data$Activity_code == 3] <- "WALKING_DOWNSTAIRS"
y_data$activity[y_data$Activity_code == 4] <- "SITTING"
y_data$activity[y_data$Activity_code == 5] <- "STANDING"
y_data$activity[y_data$Activity_code == 6] <- "LAYING"
activity_description <- data.frame(y_data$activity)
names(activity_description) <- c("ActivityName")

#Take only mean and std measurement
Mean_std_data <- X_data[,grep("mean|std|Mean",names(X_data))]

#Combine all data frames in tidy
activity <- Mean_std_data
activity <- cbind(activity,subject)
activity <- cbind(activity,activity_description)
activity$ActivityName <- as.character(activity$ActivityName)

#Tidy data
aggregate(activity[,-which(names(activity) %in% c("ActivityName"))],list(activity$ActivityName,acitvity$SubjectId),mean)
colnames(tidy)[1] <- c("Activity")
colnames(tidy)[2] <- c("Subject")
tidy$SubjectId <- NULL

#Output to file
write.table(tidy,file="./ProjectSubmission.txt",row.name=FALSE)
