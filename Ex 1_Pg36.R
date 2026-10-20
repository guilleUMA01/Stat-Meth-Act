# 1. Input the data
calls <- c(2, 3, 1, 0, 4, 3)

# ==========================================
# METHOD 1: Step-by-step (Matching the image)
# ==========================================

# Step 1: Square each value
squared_values <- calls^2

# Step 2: Sum the squared values
sum_squares <- sum(squared_values)

# Step 3: Find N (total number of observations)
N <- length(calls)

# Step 4: Divide the sum by N (this gives the Mean Square)
mean_square <- sum_squares / N

# Step 5: Take the square root (this gives the Root Mean Square)
rms_manual <- sqrt(mean_square)

# ==========================================
# METHOD 2: One-liner Calculation
# ==========================================

rms_short <- sqrt(mean(calls^2))

cat("--- One-liner Calculation ---\n")
cat(sprintf("RMS: %.5f\n", rms_short))