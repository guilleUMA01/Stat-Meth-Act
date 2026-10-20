# 1. Re-input the data from the previous exercise
C <- c(0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 
       0, 1, 1, 0, 1, 2, 0, 1, 2, 1)

E <- c(0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 
       1, 1, 0, 0, 0, 0, 1, 1, 0, 1)

# 2. Create the Absolute Frequency Table
abs_table <- table(Checks = C, Errors = E)

# ==========================================
# 3. Create the Relative Frequency Table
# ==========================================
# We can use prop.table() on the absolute table to get proportions.
# margin = NULL means it calculates relative to the grand total (N=20).

rel_table <- prop.table(abs_table)

# ==========================================
# 4. Print the results (Formatted)
# ==========================================

cat("--- 1. Absolute Frequency Distribution (n_ij) ---\n")
print(addmargins(abs_table)) # Adding totals for context

cat("\n--- 2. Relative Frequency Distribution (f_ij) ---\n")
# Multiplying by 100 to show percentages, and rounding to 1 decimal place
rel_table_pct <- round(rel_table * 100, 1)
print(addmargins(rel_table_pct))

# (Optional) If you prefer decimals instead of percentages:
cat("\n--- Relative Frequency (Decimals) ---\n")
print(round(addmargins(rel_table), 4))