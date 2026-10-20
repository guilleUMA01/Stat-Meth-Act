# UNIT 1 Descriptive Statistics of one variable ====

#Way to show a list of data
data <- c(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)

#Way to calculate frequency of one specific data
n <- 3            # n is the number of times the specific data appears 
                  # n is also called absolute frequency    \ All freq sum to N
N <- length(data) # N is the total number of data
freq <- n/N       # freq is also called relative frequency \ All freq sum to 1

#Way to calculate all frequencies of the data in absolute and relative
total_abs_freq <- table(data)   #Table is an R command that creates table with all frequencies
                                #Absolute frequency table
total_rel_freq <- total_abs_freq/length(data) #Divides every element (n) by the total (N)
#length(data) is another way to get N         |Relative frequency table

#Way to calculate cumulative frequency
cum_abs_freq <- cumsum(total_abs_freq) #cumsum is the R command to transform a frequency table
cum_rel_freq <- cumsum(total_rel_freq) #into a cumulative frequency table

#JUST IN CASE Way to make bar chart and pie chart
elements_data <- unique(data)           #Used to get the unique data of a multiple data
barplot(total_abs_freq,                 #freq table usually absolute
        names.arg = ninlist,            #(Opt)List of names of the elems in this case the unique elems
        main = "Frequency of numbers",  #(Opt)Name of the chart
        xlab = "Number",                #(Opt)Name of the bar section
        ylab = "Frequency",             #(Opt)Name of the altitude meaning of the bar
        col = "steelblue",              #(Opt)Color of the bars | gray by default
        ylim = c(0, 5))                 #Upper limit Usually a bit greater than the biggest bar

pie(total_abs_freq,                     #freq table usually absolute
    labels = ninlist,                   #(Opt)List of names of the elems in this case the unique elems
    main = "Frequency of numbers",      #(Opt)Name of the chart
    col = rainbow(length(ninlist)),     #(Opt)Generates a nice color palette | random colors at default
    radius = 1.0)                       #Radius of the pie leave at 1.0

#Way to calculate the mean
mean1_data <- mean(data)                              #Calculates the mean of all the data
                                                      #Use mean1 if you get ALL the data in a list
mean2_data <- sum(elements_data * total_abs_freq) / N #You can also get it with this formula
                                                      #Use mean2 if you get the freq and the unique elems
weight <- c(4,3, 3, 2, 2, 2, 1, 1, 1, 1)              #Weights for our data list
wmean <- weighted.mean(data, weight)                  #Weighted mean of the data

quadratic_mean <- sqrt(mean1_data)                    #Mean1 and 2 are interchangeable

#Way to get the mode
#Just search which element has the highest frequency if all are equal there is no mode

#Way to get the median
median_data <- median(data)

#Way to get Quartiles, Deciles, Percentiles
P25 <- quantile(data, 0.25) 

#Way to get deviation
mean_dev_mean <- sum(abs(data - mean1_data)) / N     #Mean deviation
mean_dev_median <- sum(abs(data - median_data)) / N  #Median deviation

#Way to get squared error
mse_mean <- sum((data - mean1_data)^2) / N     #Mean squared error
mse_median <- sum((data - median_data)^2) / N  #Median squared error

#Way to get the standard deviation
sd_data <- sd(data) * sqrt((N - 1) / N) #We include the sqrt if the list is the whole population

#Way to get the standardization
data_element <- data[1]                          #Specific element to calculate z
z_data <- (data_element - mean1_data) / sd_data  #z is useful to compare it to others z

#Way to get Pearson's coefficient of variation
cv_data <- sd_data/mean1_data

#Way to get the moment of order r with respect to point c
C <- median_data              #In this example the point is the median
r <- 1                        #In this example the order is 1
MrC <- sum((data - C)^r) / N  #This is the complete formula

#Way to get the ordinary moment of order r
r <- 1                        #In this example the order is 1
Mr <- sum(data^r) / N         #This is the formula

#Way to get the central moment of order r
r <- 1                                #In this example the order is 1
CMr <- sum((data - mean1_data)^r) / N #This formula instead of a random point it uses the mean


# UNIT 2 Statistical Modelling ====

#Way to show frequency table / all types of matrices
freqtable <- matrix(c(1, 2, 3,
                      4, 5, 6,     #Matrix Data
                      7, 8, 9),
                    nrow = 3,      #Variable to select the number of rows of the matrix     
                    byrow = TRUE)  #Variable to tell if the data input goes by rows

#Way to create a table from vertex of (x, n)
xi <- c(1, 2, 3, 4)             #From the vertices (1,4), (2,3), (3,2), (4,1)
ni <- c(4, 3, 2, 1)             #We separate first the number and second the frequency
raw_data <- rep(xi, times = ni) #If we need the raw list or if we find it more useful

#Way to create a table from vertex of (x, y)
xi <- c(1, 1, 1, 1, 2, 2, 2, 3, 3)        #This time we work with two X
yi <- c(0, 1, 1, 0, 0, 0, 1, 0, 1)        #So there are freq when for each X and Y pair
freq_xy_table <- table(X = xi, Y = yi)    #Creates the freq table
print(addmargins(freq_xy_table))          #addmargins puts the rows and columns sum
rel_xy_table <- prop.table(freq_xy_table) #Due to the other been absolute I created the 
print(addmargins(rel_xy_table))           #version where its relative

#Way to change the table to display marginal distribution of booth freqs
marginal_abs_X <- margin.table(freq_xy_table, margin = 1)  #Calc the marginal abs freq table
marginal_rel_X <- prop.table(marginal_abs_X)               #Calc the marginal rel freq table
marginal_df <- data.frame(                                 #Creates a df for displaying the two freqs
  X = names(marginal_abs_X),                               #Puts the x column
  Abs_Freq = as.vector(marginal_abs_X),                    #Puts the abs column
  Rel_Freq = as.vector(marginal_rel_X),                    #Puts the rel column
  Percentage = paste0(round(marginal_rel_X * 100, 1), "%") #Puts the % column
)
print(marginal_df, row.names = FALSE)                      #Prints the df

#Way to obtain the mean of X and Y 
X <- c(1, 2, 3)                       #xi without repetition
Y <- c(0, 1)                          #yi without repetition
N <- sum(freq_xy_table)               #Sum of all frequencies
row_totals <- rowSums(freq_xy_table)  #Sum of X frequencies
col_totals <- colSums(freq_xy_table)  #Sum of Y frequencies
mean_X <- sum(X * row_totals) / N     #Mean of X
mean_Y <- sum(Y * col_totals) / N     #Mean of Y

#Way to obtain the variance
var_x <- sum(row_totals * (X - mean_X)^2) / N  #Var of X
var_y <- sum(col_totals * (Y - mean_Y)^2) / N  #Var of Y

#Way to get the covariance
cov_matrix <- outer(X, Y, function(x, y) (x - mean_X) * (y - mean_Y)) * freq_xy_table
cov_xy <- sum(cov_matrix) / N   #All the formula to get the covariance

#Way to get moments
r <- 1                          #r defined
s <- 2                          #s defined
p1 <- 3                         #Defining the point
p2 <- 4
moment_matrix <- outer(X, Y, function(x, y) (x - p1)^r * (y - p2)^s) * freq_xy_table
M_rs <- sum(moment_matrix) / N  #All the formula to get the moments

#Way to check Independence
expected_matrix <- outer(row_totals, col_totals) / N
dimnames(expected_matrix) <- dimnames(freq_xy_table)
is_independent <- all(abs(freq_xy_table - expected_matrix) < 1e-10)

#Way to extract a row or a column
row_X2 <- freq_xy_table["2", ] #Put the freq column or row number in ""

#Way to get the mode
mode_X <- X[which.max(marginal_abs_X)]

#Way to get R X/Y and R Y/X
cond_means_x <- colSums(freq_xy_table * X) / col_totals
var_explained_x <- sum(col_totals * (cond_means_x - mean_X)^2) / N
R_X_Y <- sqrt(var_explained_x / var_x)
cond_means_y <- rowSums(freq_xy_table * Y) / row_totals
var_explained_y <- sum(row_totals * (cond_means_y - mean_Y)^2) / N
R_Y_X <- sqrt(var_explained_y / var_y)

#Way to get Skewness
cond_probs <- y_subset_totals / N_subset
m2 <- sum((Y - cond_mean)^2 * cond_probs) #If you got to separate the matrix in two
m3 <- sum((Y - cond_mean)^3 * cond_probs) #To get the two thingies
m4 <- sum((Y - cond_mean)^4 * cond_probs)

skewness <- m3 / (m2^1.5)
kurtosis <- m4 / (m2^2)

#Way to get regression lines
b_xy <- cov_xy / var_y         # Regression of X on Y: X = a + bY
a_xy <- mean_X - b_xy * mean_X

b_yx <- cov_xy / var_x         # Regression of Y on X: Y = a + bX
a_yx <- mean_Y - b_yx * mean_X

#Way to get linear correlation coefficient
r <- cov_xy / (sqrt(var_x) * sqrt(var_y))

#Way to get the rooted mean squared error
predicted_y <- a_yx + b_yx * X
sq_errors_matrix <- outer(Y, predicted_y, function(actual, pred) (actual - pred)^2)
rmse <- sqrt(sum(sq_errors_matrix * freq_xy_table) / N)

#Way to plot the scatter diagram
plot(x = X, y = Y,              #Point diagram
     main = "Scatter diagram",
     xlab = "D (veh/km)", 
     ylab = "V (km/h)", 
     pch = 19) 

modelo_lineal <- lm(Y ~ X)
abline(modelo_lineal, lwd = 2)  #Line in the diagram

r_calc <- cor(X, Y)             #Calc r

test_cor <- cor.test(X, Y)      #Checks if there is correlation

print(test_cor)

p_valor <- test_cor$p.value

#Mas te vale que no te salga nada mas dificil que esto, si no te buscas las lentejas

# UNIT 3 Time Series ====

#Way to get the moving average for order 3 and 4

X = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

ma_3_full <- stats::filter(X, c(1,1,1)/3)

print(round(ma_3_full, 4))

ma_4_full <- stats::filter(X, c(0.5, 1, 1, 1, 0.5)/4)

print(round(ma_4_full, 4))

#Way to plot a graph with data
library(tidyverse)
xx <- c(5, 6, 4, 6,
        3, 4, 7, 5,
        6, 4, 3, 6,
        4, 3, 2, 5,
        7, 6, 4, 6
)

uk <- ts(xx, start = c(1, 1), frequency = 4)
uk
plot(uk)

#Creates tendency line
tend <- stats::filter(uk, c(.5, 1, 1, 1, .5) / 4) # Trend component, using a moving average of order 4
tend
plot(uk)
lines(tend, col = 2)

#Creates estimated
est_aleM <- uk / tend
est_aleM

# Unnormalized Seasonal Component
est1M <- colMeans(matrix(est_aleM, ncol=4, byrow=T),
                  na.rm=T)
est1M

# Normalize the Seasonal Component
estM <- est1M / mean(est1M)
estM

# Random Component
aleM <- est_aleM / estM
aleM

# Deseasonalized Series
desestM <- uk / estM
desestM
# Graph of the Deseasonalized Series
plot(uk)
lines(desestM, col=4)

# UNIT 4 Probability ====