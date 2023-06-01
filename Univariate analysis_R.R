## Import data file
data <- read.csv("C:/Users/SVMY/Downloads/University project github/univariate_final.csv")

### greenland temperature line with regions
plot(data$Greenland_temperature, type = 'l', xlab = 'Index', ylab = 'Values',xlim = rev(range(seq_along(data$Greenland_temperature))))
rect(11300, -40, 9500, 0, col = "red",density = 10) #E.H.T.R.=Early Holocene Temperature Rise
text(11300,-25.6,"-E.H.T.R.",,srt=90,xpd = TRUE)
rect(9500, -40, 7500, 0, col = "green",density = 10) #M.H.C.=Mid-Holocene Cooling
text(9500,-25.6,"-M.H.C.",,srt=90,xpd = TRUE)
rect(7500, -40, 5000, 0, col = "blue",density = 10) #M.H.O.=Mid-Holocene Optimum
text(7500,-25.6,"-M.H.O.",,srt=90,xpd = TRUE)
rect(1800, -40, 1500, 0, col = rgb(0.3, 0.7, 0.9),density = 10) #B.A.C.E.=Bronze Age Cold Epoch
text(1800,-25.6,"-B.A.C.E.",,srt=90,xpd = TRUE)
rect(5000, -40, 3600, 0, col = "pink",density = 10)  #B.A.O.=Bronze Age Optimum
text(5000,-25.6,"-B.A.O.",,srt=90,xpd = TRUE)
rect(900, -40, 300, 0, col = "coral",density = 10)  #I.A.C.E.=Iron Age Cold Epoch
text(900,-25.6,"-I.A.C.E.",,srt=90,xpd = TRUE)
rect(300, -40, 150, 0, col = "yellow",density = 10)  # I.A.O.=Iron Age Optimum
text(300,-25.6,"-I.A.O.",,srt=90,xpd = TRUE)
rect(1100, -40, 800, 0, col = "#AE4371",density = 10)  #M.C.A.=Medieval Climate Anomaly.
text(1100,-25.6,"-M.C.A.",,srt=90,xpd = TRUE)
mtext("Greenland Temperature",3,cex = 1.0,line = 3.3)


## NO of rows and Columns
print(paste0("Rows: ", dim(data)[1]))
print(paste0("Columns: ", dim(data)[2]))

## Remove Null rows
df <- data[1:11200,]

## chack Dimmension
print(paste0("Rows: ", dim(df)[1]))
print(paste0("Columns: ", dim(df)[2]))

## descriptive Measures
summary(df)


## Simple Line Plot
series = df$Greenland_temperature[1:11200]
plot(series, type = 'l', xlab = 'Index', ylab = 'Values',main ='Greenland Temperature',xlim = rev(range(seq_along(series))))
abline(v=9400, col="red")


## Exploring Trend and Seasonality Patterns
# Select data
x <- 1:11200
y <- series

# Fit a 10-degree polynomial to the data
fit <- lm(y ~ poly(x, 10, raw = TRUE))

# Set up the plot area
par(mfrow=c(2,1), mar=c(5, 4, 4, 2) + 0.1, oma=c(0, 0, 2, 0))


# Create a plot
plot(x, y, type = "l", col = "blue", lwd = 2, xlab = "Time", ylab = "Value",xlim = rev(range(seq_along(series))))

# Add the polynomial fit to the plot
lines(predict(fit), col = "red", lwd = 2)

# Create a plot
plot(x, predict(fit), type = "l", col = "red", lwd = 2, xlab = "Age", ylab = "Value",xlim = rev(range(seq_along(series))))


## Augmented–Dickey–Fuller test
# Importing library
library(tseries)

# Conduct the augmented Dickey-Fuller test
adf.test(series)


## ACF and PACF plot
# create ACF plot
acf(series, lag.max = 50, main = "ACF Plot")

# create PACF plot
pacf(series, lag.max = 50, main = "PACF Plot")


## Split train and test dataset

t_value <- as.integer(length(series)*(80/100))
train <- series[1:t_value]
test <- series[(t_value+1):length(series)]

print(paste0("Train: ", length(train)))  
print(paste0("Test: ", length(test)))


## fit a AR(2) model
AR <- arima(train, order = c(2,0,0))
print(AR)


series <- ts(data$Greenland_temperature[0:11200], frequency = 50)

## perform time series decomposition
decomp <- decompose(series)

# plot the results (flipped with respect to x-axis)
par(mfrow = c(4, 1), mar = c(2, 4, 2, 1))
plot(rev(series), ylab = "Original", type = "l")
plot(rev(decomp$trend), ylab = "Trend", type = "l")
plot(rev(decomp$seasonal), ylab = "Seasonal", type = "l")
plot(rev(decomp$random), ylab = "Random", type = "l")


## Split train and test dataset
t_value <- as.integer(length(decomp$random)*(80/100))
train <- decomp$random[1:t_value]
test <- decomp$random[(t_value+1):length(decomp$random)]

print(paste0("Train: ", length(train)))
print(paste0("Test: ", length(test)))

## fit a AR(2) model
AR <- arima(train, order = c(2,0,0)) 
print(AR)


# Suppress warnings
options(warn = -1)

library(dplyr)

df <- data.frame(Greenland_temperature = series)
df_new <- df

for (i in 0:3) {
  # Shift the DataFrame forward by one period
  df_shifted <- dplyr::lag(df, n = i+1)
  colnames(df_shifted) <- paste0('x', i)
  df_new <- cbind(df_shifted, df_new)
}

# Print the original and shifted DataFrames
colnames(df_new) <- c('x1', 'x2', 'x3', 'x4', 'y')
v <- sum(is.na(df_new$x1))
df_new <- df_new[(v+1):nrow(df_new), ]
head(df_new)



