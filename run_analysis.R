run_analysis <- function() {

        ## Pull variable names (features) and activity labels from source
	names <- read.table("features.txt")
	activitylabels <- read.table("activity_labels.txt")

        ## Pull dataset, activityID and subjectID from source
	File <- read.table("test/X_test.txt")
	ActivityID <- read.table("test/y_test.txt")
	SubjectID <- read.table("test/subject_test.txt")
        ## Label dataset with variable names
	colnames(File) <- names[,2]
	## Extract only variables related to mean and standard deviation
        File <- File[, grepl("mean()", colnames(File)) | grepl("std()", colnames(File))]
	## Append long activity name for each row of the dataset
        for (i in 1:nrow(ActivityID)) {
		holder <- ActivityID[i,1]
		ActivityID[i,2] <- activitylabels[holder, 2]
	}
        ## Compile into a single dataframe
	Test <- cbind(SubjectID, ActivityID, File)
	## Label dataset with variable names
        colnames(Test)[1:3] <- c("subjID", "actID", "activity")

        ## Repeat above for TRAIN dataset
	File2 <- read.table("train/X_train.txt")
	ActivityID2 <- read.table("train/y_train.txt")
	SubjectID2 <- read.table("train/subject_train.txt")
	colnames(File2) <- names[,2]
	File2 <- File2[, grepl("mean()", colnames(File2)) | grepl("std()", colnames(File2))]
	for (i in 1:nrow(ActivityID2)) {
		holder <- ActivityID2[i,1]
		ActivityID2[i,2] <- activitylabels[holder, 2]
	}
	Train <- cbind(SubjectID2, ActivityID2, File2)
	colnames(Train)[1:3] <- c("subjID", "actID", "activity")

        ## Combine TEST and TRAIN datasets together
	Final <- rbind(Test,Train, deparse.level = 1)
        ## Create Summary Dataset and write to disk
	Melted <- melt(Final, id=c("subjID", "actID", "activity"), measure.vars=names(Final)[4:ncol(Final)])
	ReCast <- dcast(Melted, subjID + actID + activity ~ variable, mean)
	write.table(ReCast, file="./ReCast.txt", sep="\t")
}
