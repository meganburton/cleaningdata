# Reading data into R
    X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", quote="\"")
    X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", quote="\"")
    
    subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", quote="\"")
    subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", quote="\"")
    
    y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", quote="\"")
    y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", quote="\"")
    
    features <- read.table("./data/UCI HAR Dataset/features.txt", quote="\"")
    activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", quote="\"")
    
# Merging test and train data
    x_data <- rbind(X_test, X_train)
    colnames(x_data) <- features$V2

# Merging test and train labels
    subject_data <- rbind(subject_test, subject_train)
    colnames(subject_data) <- "id"
    
# Merging activity data
    y_data <- rbind(y_test, y_train)
    colnames(y_data) <- "activityLevel"

# Subsetting to get columns dealing with mean or sd
    x_data <- x_data[,grepl("mean\\(\\)", features$V2) | grepl("std\\(\\)", features$V2)]

# Create one data set by c-binding subject_data and x_data
    data <- cbind(subject_data, y_data, x_data)

# Renaming variables to be easier to read
    new_names <- gsub("\\(\\)", "", names(data))
    new_names <- gsub("^t", "time", new_names)
    new_names <- gsub("^f", "frequency", new_names)
    new_names <- gsub("\\-std", "Std", new_names)
    new_names <- gsub("\\-mean", "Mean", new_names)
    new_names <- gsub("\\-", "", new_names)
    
    colnames(data) <- new_names
    
# Changing integer activity levels to descriptive activity levels
    data$activityLevel <- factor(data$activityLevel, labels=tolower(activity_labels$V2))

# Calculate averages across columns based on subject and activity level
    library(plyr)
    new_data <- ddply(data, .(id, activityLevel), numcolwise(mean))
    write.table(new_data, file = "./output.txt")
