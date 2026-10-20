# 1. Input the data
data <- c(0, 0, 2, 2, 2, 2, 3, 3, 4, 4, 7, 7)

# 2. Find the Median
# The dataset is already ordered. N = 12 (even)
# The median is the average of the 6th and 7th values.
N <- length(data)
Me <- median(data)

cat("--- Data Summary ---\n")
cat(sprintf("Total values (N): %d\n", N))
cat(sprintf("Median (Me): (3 + 3) / 2 = %.1f\n\n", Me))

# ==========================================
# 3. Calculate m1(Me) - Mean Absolute Deviation
# ==========================================
# Step A: Absolute differences from the median
abs_deviations <- abs(data - Me)
# Step B: Sum them up
sum_abs_dev <- sum(abs_deviations)
# Step C: Divide by N
m1_Me <- sum_abs_dev / N

cat("--- m1(Me) Calculation ---\n")
cat("Absolute deviations:", abs_deviations, "\n")
cat(sprintf("Sum of absolute deviations: %d\n", sum_abs_dev))
cat(sprintf("m1(Me) = %d / %d = %.4f\n\n", sum_abs_dev, N, m1_Me))

# ==========================================
# 4. Calculate m2(Me) - Mean Squared Deviation
# ==========================================
# Step A: Squared differences from the median
sq_deviations <- (data - Me)^2
# Step B: Sum them up
sum_sq_dev <- sum(sq_deviations)
# Step C: Divide by N
m2_Me <- sum_sq_dev / N

cat("--- m2(Me) Calculation ---\n")
cat("Squared deviations:  ", sq_deviations, "\n")
cat(sprintf("Sum of squared deviations: %d\n", sum_sq_dev))
cat(sprintf("m2(Me) = %d / %d = %.4f\n", sum_sq_dev, N, m2_Me))