# 1. Input the data as two separate vectors
# C = Checks, E = Errors
C <- c(0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 
       0, 1, 1, 0, 1, 2, 0, 1, 2, 1)

E <- c(0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 
       1, 1, 0, 0, 0, 0, 1, 1, 0, 1)

# 2. Create the contingency table using the table() function
# Note: Putting E first means E will be the columns and C will be the rows.
freq_table <- table(Checks = C, Errors = E)

# 3. Print the basic table
cat("--- Contingency Table ---\n")
print(freq_table)

# 4. Print the table with margins (Totals) added
cat("\n--- Table with Totals (Margins) ---\n")
print(addmargins(freq_table))