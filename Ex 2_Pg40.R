# 1. Input the data matrix
# Rows = X, Columns = Y
data <- matrix(c(
  1,  3,  2,  4,
  3,  9,  6, 12,
  2,  6,  4,  8
), nrow = 3, byrow = TRUE)

rownames(data) <- c("x1", "x2", "x3")
colnames(data) <- c("y1", "y2", "y3", "y4")

# 2. Calculate Row Totals, Column Totals, and Grand Total
row_totals <- rowSums(data)
col_totals <- colSums(data)
grand_total <- sum(data)

cat("--- Totals ---\n")
print(row_totals)
print(col_totals)
cat("Grand Total:", grand_total, "\n\n")

# 3. Calculate the Expected Frequencies Matrix
# The outer() function multiplies every row total by every column total
expected_matrix <- outer(row_totals, col_totals) / grand_total

# Add names to expected matrix for clarity
dimnames(expected_matrix) <- dimnames(data)

cat("--- Expected Frequencies (E_ij) ---\n")
print(round(expected_matrix, 2))
cat("\n")

# 4. Verify Independence (Compare Observed vs Expected)
# If they are independent, Observed == Expected
cat("--- Verification ---\n")
is_independent <- all(abs(data - expected_matrix) < 1e-10) # Checking if difference is effectively zero

if (is_independent) {
  cat("Conclusion: The variables X and Y ARE independent.\n")
  cat("Reason: All Observed frequencies exactly match the Expected frequencies.\n")
} else {
  cat("Conclusion: The variables X and Y are NOT independent.\n")
}