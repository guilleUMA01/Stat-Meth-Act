p_success <- 1 / 36
p_failure <- 35 / 36

n <- 0
prob_success <- 0

# 3. Use a while loop to find the number of rolls
# We keep rolling as long as the probability of at least one success is <= 0.5
while (prob_success <= 0.5) {
  n <- n + 1
  # Probability of at least one pair of 6s in n rolls
  prob_success <- 1 - (p_failure ^ n)
}

# 4. Output the results
cat("--- Dice Roll Analysis ---\n")
cat(sprintf("It takes %d rolls to make it more favourable (P > 0.5) to get at least one pair of 6s.\n\n", n))

# Show the probabilities around the threshold for clarity
cat("--- Probabilities around the threshold ---\n")
for (i in (n-1):(n+1)) {
  prob_i <- 1 - (p_failure ^ i)
  cat(sprintf("Rolls: %d | Probability of at least one (6,6): %.4f (%.2f%%)\n", 
              i, prob_i, prob_i * 100))
}

# Optional: Mathematical verification using logarithms
# n > log(0.5) / log(35/36)
n_math <- log(0.5) / log(35/36)
cat(sprintf("\nMathematical exact threshold: %.4f (so we need to round up to %d)\n", 
            n_math, ceiling(n_math)))