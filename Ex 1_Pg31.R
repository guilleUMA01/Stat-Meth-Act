# 1. Input the data
X <- c(13.725, 13.975, 14.225, 14.725)
n <- c(7, 14, 18, 6)

# ==========================================
# METHOD 1: Using the Change of Variable (as suggested)
# ==========================================

# 2. Create the new variable Y
# Formula: Y = (X - 13.975) / 0.25
Y <- (X - 13.975) / 0.25

# 3. Calculate the total number of observations (N)
N <- sum(n)

# 4. Calculate the mean of Y (mu_Y)
# This is the weighted sum of Y divided by N
mu_Y <- sum(Y * n) / N

# 5. Calculate the mean of X using the transformation rule
# mu_X = 0.25 * mu_Y + 13.975
mu_X_transformed <- 0.25 * mu_Y + 13.975

# ==========================================
# METHOD 2: Direct Calculation (for verification)
# ==========================================
mu_X_direct <- sum(X * n) / N
