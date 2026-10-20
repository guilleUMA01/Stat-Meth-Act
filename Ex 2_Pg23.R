# 1. Recreate the frequency table in R
# We use a matrix to represent the grid of numbers.
# The rows represent X (0, 1, 2, 3) and columns represent Y (-2, -1, 0, 1, 2)

freq_matrix <- matrix(c(
  2,  7, 12, 10,  4,  # Row X=0
  5, 14, 23, 15,  7,  # Row X=1
  12, 31, 23,  8,  3,  # Row X=2
  20, 18,  8,  2,  1   # Row X=3
), nrow = 4, byrow = TRUE)

# Assign row and column names for clarity
rownames(freq_matrix) <- c("X=0", "X=1", "X=2", "X=3")
colnames(freq_matrix) <- c("Y=-2", "Y=-1", "Y=0", "Y=1", "Y=2")

cat("--- Original Absolute Frequency Table ---\n")
print(addmargins(freq_matrix)) # addmargins gives us the row/col totals


# ==========================================
# 2. Distribution of Y conditioned on X = 2
# ==========================================
cat("\n--- Distribution of Y conditioned on X = 2 ---\n")

# Extract the row for X=2
row_X2 <- freq_matrix["X=2", ]

# Calculate total for X=2 (which is 77)
total_X2 <- sum(row_X2)

# Calculate relative frequencies (divide each cell by the row total)
cond_Y_given_X2 <- row_X2 / total_X2

# Format output
df_cond_Y <- data.frame(
  Y_Value = colnames(freq_matrix),
  Abs_Freq = as.vector(row_X2),
  Conditional_Prob = round(as.vector(cond_Y_given_X2), 4),
  Percentage = paste0(round(cond_Y_given_X2 * 100, 2), "%")
)
print(df_cond_Y, row.names = FALSE)


# ==========================================
# 3. Distribution of X conditioned on Y = -1
# ==========================================
cat("\n--- Distribution of X conditioned on Y = -1 ---\n")

# Extract the column for Y=-1
col_Y_minus1 <- freq_matrix[, "Y=-1"]

# Calculate total for Y=-1 (which is 70)
total_Y_minus1 <- sum(col_Y_minus1)

# Calculate relative frequencies (divide each cell by the column total)
cond_X_given_Y_minus1 <- col_Y_minus1 / total_Y_minus1

# Format output
df_cond_X <- data.frame(
  X_Value = rownames(freq_matrix),
  Abs_Freq = as.vector(col_Y_minus1),
  Conditional_Prob = round(as.vector(cond_X_given_Y_minus1), 4),
  Percentage = paste0(round(cond_X_given_Y_minus1 * 100, 2), "%")
)
print(df_cond_X, row.names = FALSE)