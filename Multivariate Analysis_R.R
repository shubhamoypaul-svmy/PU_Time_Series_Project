## Import data file
multi.data <- read.csv("C:/Users/SVMY/Downloads/multivariate_final.csv")
head(multi.data)

## NO of rows and Columns
print(paste0("Rows: ", dim(multi.data)[1]))
print(paste0("Columns: ", dim(multi.data)[2]))

## chack Dimmension
summary(multi.data)

## correlation 
cor(multi.data)


# Calculate the index to split the data
split_index <- round(0.8 * dim(multi.data)[1])

# Split the data into 80% training and 20% testing
train_data <- multi.data[1:split_index,]
test_data <- multi.data[(split_index + 1):dim(multi.data)[1],]

# Print the lengths of the training and testing data sets
cat("Train rows: ",dim(train_data)[1])
cat("Test rows: ",dim(test_data)[1])


