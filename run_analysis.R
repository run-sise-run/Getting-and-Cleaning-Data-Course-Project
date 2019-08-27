# run_analysis.R

# library(ggplot2)
library(data.table)
# library(plyr)
library(dplyr)  
# library(XML)
# library(httr)

#--------------------------------------
# My Preferences (feel free to omit)
#--------------------------------------

memory.limit(size=2000000)
options(datatable.print.topn = 10)
options(datatable.print.nrows = 200)

#========================
#    Read Files
#========================

actdat <- fread("data/uci/activity_labels.txt")
feat <- fread("data/uci/features.txt")

tr_subject <- fread("data/uci/train/subject_train.txt")
tr_x <- fread("data/uci/train/X_train.txt")
tr_y <- fread("data/uci/train/y_train.txt")


te_subject <- fread("data/uci/test/subject_test.txt")
te_x <- fread("data/uci/test/X_test.txt")
te_y <- fread("data/uci/test/y_test.txt")


#========================
#    Apply descriptive names for activities
#========================

tr_y <- merge(actdat, tr_y, all=T)[,2]
te_y <- merge(actdat, te_y, all=T)[,2]

#========================
#    Combine the test and training data sets
#========================

### All test data and all train data joined separately first 
### before combining test and train data into one big dataset.

train <- data.table(DataSrc = "TRAIN", tr_subject, tr_y, tr_x)
test <- data.table(DataSrc = "TEST", te_subject, te_y, te_x)

dat_set <- rbind(train, test)

#========================
#    Assign meaningful column names
#========================

### Rename the columns
colnames(dat_set) <- c("DataSrc","Subject", "Activity", feat[[2]])

# dat_set[1:10,1:10] # Just checking

### Cleanup
rm(tr_y, te_y, tr_subject, te_subject, tr_x, te_x)

#========================
#    Extract only means and StdDev valued-columns
#========================

ext_set <- dat_set[,c(1:3,which(grepl("mean|std",colnames(dat_set)))), with=F]

# ext_set[1:10,1:10] # Just checking

### Write the intermediary file (optional)
write.csv(ext_set, "Extracted_Data_Set.csv", row.names = F)

#========================
#    Reshape the data
#========================

### quickly check how many rows our final data set should have (40)
x <- ext_set[,1:3]
check_sum <- sum(table(x$Activity,x$Subject) > 0)


y <- aggregate(dat_set[,4:ncol(dat_set)], 
               by = list(dat_set$Subject, dat_set$Activity),
               FUN = mean, na.rm = T)

print(ifelse(check_sum == dim(y)[1],
             "reshaped data set matches dimension expectations",
             "reshaped data does NOT match expectated dimensions"))

# Rename the first 2 columns to be consistent with original data set
colnames(y)[1:2] <- c("Subject","Activity")

# Sort the data set according to Subject # and Activity.
y <- data.table(y)
setkey(y, Subject, Activity)

# Write the Tidy Data Set to file.
write.table(y, file="Tidy_Data_Set.txt", row.name = F)

### additional cleanup (optional)
# rm(list = ls())
# gc()

