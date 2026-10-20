# 1. Input the midpoints (Class Marks)
x_marks <- c(155, 165, 175, 185, 195) # Rows: Height
y_marks <- c(55, 65, 75, 85, 95, 105) # Cols: Weight

# 2. Input the frequency matrix (Rows = X, Columns = Y)
freq <- matrix(c(
  2, 0, 0, 0, 0, 0,  # (150, 160]
  4, 4, 0, 0, 0, 0,  # (160, 170]
  1, 6, 3, 1, 0, 0,  # (170, 180]
  0, 1, 4, 1, 1, 0,  # (180, 190]
  0, 0, 0, 0, 1, 1   # (190, 200]
), nrow = 5, byrow = TRUE)

N <- sum(freq) # Total observations

# 3. Calculate Marginal Totals and Means
row_totals <- rowSums(freq)
col_totals <- colSums(freq)

mean_x <- sum(x_marks * row_totals) / N
mean_y <- sum(y_marks * col_totals) / N

# 4. Calculate Variances (Population variance formula used here)
var_x <- sum(row_totals * (x_marks - mean_x)^2) / N
var_y <- sum(col_totals * (y_marks - mean_y)^2) / N

# 5. Calculate Covariance
# We create an outer product of deviations: (x - mean_x) * (y - mean_y)
# Then multiply by the frequency matrix and sum everything up.
cov_matrix <- outer(x_marks - mean_x, y_marks - mean_y) * freq
cov_xy <- sum(cov_matrix) / N

# 6. Calculate Correlation Ratios
# For R_X/Y, we need the conditional means of X for each column (Y)
cond_means_x <- colSums(freq * x_marks) / col_totals

# Variance of the conditional means of X (Explained variance of X)
var_explained_x <- sum(col_totals * (cond_means_x - mean_x)^2) / N
R_X_Y <- sqrt(var_explained_x / var_x)

# For R_Y/X, we need the conditional means of Y for each row (X)
cond_means_y <- rowSums(freq * y_marks) / row_totals

# Variance of the conditional means of Y (Explained variance of Y)
var_explained_y <- sum(row_totals * (cond_means_y - mean_y)^2) / N
R_Y_X <- sqrt(var_explained_y / var_y)


# ==========================================
# Output the results
# ==========================================
cat("--- Basic Statistics ---\n")
cat(sprintf("Mean of X (Height): %.4f\n", mean_x))
cat(sprintf("Mean of Y (Weight): %.4f\n", mean_y))
cat(sprintf("Variance of X: %.4f\n", var_x))
cat(sprintf("Variance of Y: %.4f\n", var_y))

cat("\n--- Covariance ---\n")
cat(sprintf("Cov(X,Y): %.4f\n", cov_xy))

cat("\n--- Correlation Ratios ---\n")
cat(sprintf("R_{X/Y} (X explained by Y): %.4f\n", R_X_Y))
cat(sprintf("R_{Y/X} (Y explained by X): %.4f\n", R_Y_X))