# 1. Define the variables for both exams
# Student A
score_A <- 8.5
mean_A <- 7.9
sd_A <- 0.8

# Student B
score_B <- 7.4
mean_B <- 7.0
sd_B <- 0.5

# 2. Calculate the Z-scores (Standardization)
z_A <- (score_A - mean_A) / sd_A
z_B <- (score_B - mean_B) / sd_B

# 3. Output the results
cat("--- Standardization (Z-Scores) ---\n")
cat(sprintf("Student A's Z-score: (%.1f - %.1f) / %.1f = %.2f\n", 
            score_A, mean_A, sd_A, z_A))
cat(sprintf("Student B's Z-score: (%.1f - %.1f) / %.1f = %.2f\n", 
            score_B, mean_B, sd_B, z_B))

# 4. Determine who performed better relative to their group
cat("\n--- Conclusion ---\n")
if(z_A > z_B) {
  cat("Student A performed better relative to their class.\n")
} else if(z_B > z_A) {
  cat("Student B performed better relative to their class.\n")
} else {
  cat("Both students performed equally well relative to their classes.\n")
}