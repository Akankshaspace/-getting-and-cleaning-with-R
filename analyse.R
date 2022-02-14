## Following is the code for step 1 i.e merging the two datasets. 

library("tidyverse")
#. .. .... READING FILES

path <- file.path("C:","Users","Ashish","Documents","UCI HAR Dataset")
setwd(path)
trainset <- read.table("./train/X_train.txt",sep="", header= FALSE )
trainlabel <- read.table("./train/Y_train.txt", sep="",header=FALSE)
trainsubject <- read.table("./train/subject_train.txt",sep ="",header= FALSE)
testset <- read.table("./test/X_test.txt", sep="", header= FALSE)
testlabel <- read.table("./test/Y_test.txt",sep="",header=FALSE)
testsubject <- read.table("./test/subject_test.txt", sep= "", header= FALSE)
#..........NAMING COLUMNS
column_name <- read.table("features.txt")
names(trainlabel) <- "activity"
names(testlabel) <- "activity"
names(trainsubject) <- "subject"
names(testsubject)<- "subject"
#.........CREATING DATA FRAME
training <- cbind(trainlabel,trainsubject,trainset)
test <- cbind(testlabel,testsubject,testset)
frame <- merge.data.frame(training,test, all = TRUE)
names(frame)[3:563] <- column_name$V2 

## following is the code for step 2 i.e extracting mean and std.dev columns.
allmean <- frame[grep("mean",names(frame))]
allstd <- frame[grep("std",names(frame))]
act <- frame[grep("activity",names(frame))]
sub <- frame[grep("subject",names(frame))]

frame2 <- data.frame(act,sub,allmean,allstd)

##following is the code for step 3.

frame2$activity <- recode(frame2$activity, "1"= "walking","2"="walking_upstairs"
                          ,"3"="walking_downstairs","4"="sitting", "5"="standing"
                          , "6"="laying")

## following is the code for step 4.
gsub("()","",names(frame2))
##following is the code for step 5.
tidy_final_frame <- frame2%>%group_by(subject,activity)%>%summarise_all(~mean(.))

##submission step
submit <- file.path("C:","Users","Ashish","Documents","johnhopkins")
setwd(submit)
write.table(tidy_final_frame,file = submit,row.names = FALSE)
