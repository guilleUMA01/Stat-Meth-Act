# 1. Input the data
data <- c(5, 2, 3, 3, 3, 5, 7)
N <- length(data)

# 2. Calculate the Center Points
# Note: R does not have a built-in mean deviation function, so we calculate step-by-step.
mean_val <- mean(data)
median_val <- median(data)

cat("--- Center Points ---\n")
cat(sprintf("Mean: %.2f\n", mean_val))
cat(sprintf("Median: %.2f\n\n", median_val))

# ==========================================
# 3. Concerning the MEAN
# ==========================================
# Mean Deviation
mean_dev_mean <- sum(abs(data - mean_val)) / N

# Mean Squared Error (using N as denominator, i.e., population formula)
mse_mean <- sum((data - mean_val)^2) / N

cat("--- Calculations Concerning the MEAN ---\n")
cat(sprintf("Mean Deviation: %.4f\n", mean_dev_mean))
cat(sprintf("Mean Squared Error (MSE): %.4f\n\n", mse_mean))

# ==========================================
# 4. Concerning the MEDIAN
# ==========================================
# Mean Deviation
mean_dev_median <- sum(abs(data - median_val)) / N

# Mean Squared Error
mse_median <- sum((data - median_val)^2) / N

cat("--- Calculations Concerning the MEDIAN ---\n")
cat(sprintf("Mean Deviation: %.4f\n", mean_dev_median))
cat(sprintf("Mean Squared Error (MSE): %.4f\n", mse_median))