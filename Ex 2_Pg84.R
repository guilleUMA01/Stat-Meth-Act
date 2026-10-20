# 1. Input the data
x_vals <- c(0, 1, 2, 3, 4, 5)          # X values (Columns)
y_marks <- c(2, 5, 7, 10)              # Y midpoints (Rows)

# Frequency matrix (Rows = Y, Columns = X)
freq <- matrix(c(
  3, 3, 1, 0, 0, 0,  # Y = [0,4]
  3, 4, 2, 0, 0, 0,  # Y = (4,6]
  1, 3, 2, 1, 0, 0,  # Y = (6,8]
  0, 1, 1, 2, 3, 2   # Y = (8,12]
), nrow = 4, byrow = TRUE)

N <- sum(freq)
row_totals <- rowSums(freq)
col_totals <- colSums(freq)

# Calculate overall means
mean_x <- sum(x_vals * col_totals) / N
mean_y <- sum(y_marks * row_totals) / N

# ==========================================
# TASK 1: Conditional Distribution (Y | 1 <= X <= 3)
# ==========================================
cat("--- TASK 1: Conditional Distribution ---\n")
# We need the columns for X = 1, 2, 3
cols_1_to_3 <- 2:4 # Index positions for X=1, 2, 3
freq_subset <- freq[, cols_1_to_3]
y_subset_totals <- rowSums(freq_subset)
N_subset <- sum(freq_subset)

# Calculate conditional probabilities
cond_probs <- y_subset_totals / N_subset

df_cond <- data.frame(
  Y_Interval = c("[0,4]", "(4,6]", "(6,8]", "(8,12]"),
  Y_Midpoint = y_marks,
  Absolute_Freq = y_subset_totals,
  Conditional_Prob = round(cond_probs, 4)
)
print(df_cond, row.names = FALSE)

# Calculate Skewness and Kurtosis for this conditional distribution
# Using standard moment formulas (m3/m2^1.5 and m4/m2^2)
cond_mean <- sum(y_marks * cond_probs)
cond_var <- sum(y_marks^2 * cond_probs) - cond_mean^2
cond_sd <- sqrt(cond_var)

m2 <- sum((y_marks - cond_mean)^2 * cond_probs)
m3 <- sum((y_marks - cond_mean)^3 * cond_probs)
m4 <- sum((y_marks - cond_mean)^4 * cond_probs)

skewness <- m3 / (m2^1.5)
kurtosis <- m4 / (m2^2)

cat(sprintf("\nConditional Mean: %.4f\n", cond_mean))
cat(sprintf("Skewness: %.4f\n", skewness))
cat(sprintf("Kurtosis: %.4f\n\n", kurtosis))


# ==========================================
# TASK 2: Regression Lines
# ==========================================
cat("--- TASK 2: Regression Lines ---\n")
# Calculate Variances and Covariance
var_x <- sum(col_totals * (x_vals - mean_x)^2) / N
var_y <- sum(row_totals * (y_marks - mean_y)^2) / N

cov_matrix <- outer(y_marks - mean_y, x_vals - mean_x) * freq
cov_xy <- sum(cov_matrix) / N

# Regression of X on Y: X = a + bY
b_xy <- cov_xy / var_y
a_xy <- mean_x - b_xy * mean_y

# Regression of Y on X: Y = a + bX
b_yx <- cov_xy / var_x
a_yx <- mean_y - b_yx * mean_x

cat(sprintf("Regression of X on Y: X = %.4f + %.4f * Y\n", a_xy, b_xy))
cat(sprintf("Regression of Y on X: Y = %.4f + %.4f * X\n\n", a_yx, b_yx))


# ==========================================
# TASK 3: Linear Correlation & RMSE
# ==========================================
cat("--- TASK 3: Correlation and RMSE ---\n")
# Linear correlation coefficient (r)
r <- cov_xy / (sqrt(var_x) * sqrt(var_y))
cat(sprintf("Linear Correlation Coefficient (r): %.4f\n", r))

# Root Mean Square Error of the linear model Y on X
# RMSE = sqrt( sum( (actual_Y - predicted_Y)^2 ) / N )
# First, predict Y for every X value using the Y on X regression line
predicted_y <- a_yx + b_yx * x_vals

# We need to create a matrix of squared errors using the original frequencies
sq_errors_matrix <- outer(y_marks, predicted_y, function(actual, pred) (actual - pred)^2)
rmse <- sqrt(sum(sq_errors_matrix * freq) / N)

cat(sprintf("Root Mean Square Error (RMSE): %.4f\n", rmse))

  