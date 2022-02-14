I have merged "train" folder and "test" folder Leaving the inertial signals subfolder in them. 
my choice of files to merge is based on the fact that X-train / X-test represent the actual data set. 
whereas subject_test/subject_train represent 30 volunteers, each of whom performed 6 activities, on which the data is based.
y_train/y_test represent the labels for those 6 activities in numbering form ( i.e "1" for first activity, "2" for second ....).
the name of those 6 activities are otherwise separately given in "activity_labels" document.
after merging I used "features" document to assign column names ( measurements related to those 6 activities)
the main task was to group the average of entire data set measurements(columns) by each volunteer and each activity performed by the volunteer.
tidy data set thus created in last can be opened by read.table("tidydata.txt").
