# 1. Define the datasets
ListA <- c(12, 10, 9, 9, 10)
ListB <- c(5, 10, 16, 15, 4)

# ==========================================
# METHOD 1: Using built-in R functions
# ==========================================
# Note: sd() calculates the SAMPLE standard deviation (dividing by N-1).
# To get the POPULATION standard deviation, we must adjust it.
# Formula: Population SD = Sample SD * sqrt((N-1)/N)

# Calculate Population SD for List A
N_A <- length(ListA)
sd_A_pop <- sd(ListA) * sqrt((N_A - 1) / N_A)

# Calculate Population SD for List B
N_B <- length(ListB)
sd_B_pop <- sd(ListB) * sqrt((N_B - 1) / N_B)

cat("--- Results (Population Standard Deviation) ---\n")
cat(sprintf("List A SD: %.4f\n", sd_A_pop))
cat(sprintf("List B SD: %.4f\n\n", sd_B_pop))


# ==========================================
# METHOD 2: Manual Calculation (Step-by-Step)
# ==========================================
cat("--- Step-by-Step Verification ---\n\n")

# --- List A ---
mean_A <- mean(ListA)
var_A <- sum((ListA - mean_A)^2) / N_A
sd_A_manual <- sqrt(var_A)
cat("List A:\n")
cat(sprintf("  Mean: %.1f\n", mean_A))
cat(sprintf("  Squared Deviations: (12-10)^2 + (10-10)^2 + (9-10)^2 + (9-10)^2 + (10-10)^2\n"))
cat(sprintf("  Sum of Squares: %d\n", sum((ListA - mean_A)^2)))
cat(sprintf("  Variance (Sum/5): %.2f\n", var_A))
cat(sprintf("  Standard Deviation: %.4f\n\n", sd_A_manual))

# --- List B ---
mean_B <- mean(ListB)
var_B <- sum((ListB - mean_B)^2) / N_B
sd_B_manual <- sqrt(var_B)
cat("List B:\n")
cat(sprintf("  Mean: %.1f\n", mean_B))
cat(sprintf("  Squared Deviations: (5-10)^2 + (10-10)^2 + (16-10)^2 + (15-10)^2 + (4-10)^2\n"))
cat(sprintf("  Sum of Squares: %d\n", sum((ListB - mean_B)^2)))
cat(sprintf("  Variance (Sum/5): %.2f\n", var_B))
cat(sprintf("  Standard Deviation: %.4f\n", sd_B_manual))