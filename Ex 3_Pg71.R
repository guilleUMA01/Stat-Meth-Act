# 1. Define the known variables
cpi_1998 <- 135  # CPI for 1998 with respect to 1990 (Base year 1990 = 100)
cpi_1990 <- 100  # CPI for the base year

# 2. Calculate the inflation factor (how many times prices have multiplied)
inflation_factor <- cpi_1998 / cpi_1990

# ==========================================
# 1. Real value in 1990 of a product that cost 1000 in 1998
# ==========================================
nominal_1998_1 <- 1000
real_1990_1 <- nominal_1998_1 / inflation_factor

# ==========================================
# 2. Real value in 1998 of a product that cost 1000 in 1990
# ==========================================
real_1990_2 <- 1000
nominal_1998_2 <- real_1990_2 * inflation_factor

# ==========================================
# Output the results
# ==========================================
cat("--- Inflation Adjustment Analysis ---\n")
cat(sprintf("Inflation Factor (1998 vs 1990): %.2f\n\n", inflation_factor))

cat("1. Real value in 1990 of a product costing 1000 pesetas in 1998:\n")
cat(sprintf("   Calculation: 1000 / %.2f = %.2f pesetas\n\n", inflation_factor, real_1990_1))

cat("2. Real value in 1998 of a product costing 1000 pesetas in 1990:\n")
cat(sprintf("   Calculation: 1000 * %.2f = %.2f pesetas\n", inflation_factor, nominal_1998_2))