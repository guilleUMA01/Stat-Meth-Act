# 1. Recreate the absolute frequency table
C <- c(0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 2, 0, 1, 2, 1)
E <- c(0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1)
abs_table <- table(Checks = C, Errors = E)

# ==========================================
# 2. Extract the Marginal Distribution (Rows)
# ==========================================
# margin.table() sums the table across a margin.
# margin = 1 means rows (which is our variable C)
marginal_abs_C <- margin.table(abs_table, margin = 1)

# Calculate relative frequency (proportions)
marginal_rel_C <- prop.table(marginal_abs_C)

# ==========================================
# 3. Create a clean Data Frame for output
# ==========================================
marginal_df <- data.frame(
  Checks_C = names(marginal_abs_C),
  Abs_Freq = as.vector(marginal_abs_C),
  Rel_Freq = as.vector(marginal_rel_C),
  Percentage = paste0(round(marginal_rel_C * 100, 1), "%")
)

cat("--- Marginal Distribution of C (Number of Checks) ---\n")
print(marginal_df, row.names = FALSE)