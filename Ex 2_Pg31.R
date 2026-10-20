# 1. Define the midpoints (Class Marks)
t_marks <- c(1, 3.5, 7.5, 12)          # Time intervals
d_marks <- c(0.5, 1.5, 3, 6, 10)       # Distance intervals

# 2. Define the frequency matrix (from the table)
# Rows = Time (t), Columns = Distance (d)
freq <- matrix(c(
  3, 12, 15, 10, 22,
  9,  8,  5,  9, 12,
  7,  5,  3,  8,  8,
  11,  7,  8,  8, 10
), nrow = 4, byrow = TRUE)

N <- sum(freq) # Total observations (180)

# 3. Calculate Marginal Means
# Row totals and column totals
row_totals <- rowSums(freq)
col_totals <- colSums(freq)

# Mean of t and d
mean_t <- sum(t_marks * row_totals) / N
mean_d <- sum(d_marks * col_totals) / N

cat(sprintf("Mean of t (bar_t): %.4f\n", mean_t))
cat(sprintf("Mean of d (bar_d): %.4f\n\n", mean_d))

# 4. Calculate Variances
# Variance of t
var_t <- sum(row_totals * (t_marks - mean_t)^2) / N

# Variance of d
var_d <- sum(col_totals * (d_marks - mean_d)^2) / N

cat(sprintf("Variance of t (V(t)): %.4f\n", var_t))
cat(sprintf("Variance of d (V(d)): %.4f\n\n", var_d))

# 5. Calculate Covariance
# We need to create a grid of (t_i - mean_t) * (d_j - mean_d) * f_ij for all cells
cov_matrix <- outer(t_marks, d_marks, function(t, d) (t - mean_t) * (d - mean_d)) * freq
cov_td <- sum(cov_matrix) / N

cat(sprintf("Covariance (Cov(t,d)): %.4f\n\n", cov_td))

# 6. Calculate the Central Moment M_12(3, 2)
# Formula: (t_i - 3)^1 * (d_j - 2)^2 * f_ij
moment_matrix <- outer(t_marks, d_marks, function(t, d) (t - 3)^1 * (d - 2)^2) * freq
M_12 <- sum(moment_matrix) / N

cat(sprintf("Central Moment M_12(3,2): %.4f\n", M_12))