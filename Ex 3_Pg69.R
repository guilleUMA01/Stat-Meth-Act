# 1. Define the known variables
nominal_growth_rate <- 0.50  # 50% increase
cpi_growth_rate <- 1.00      # 100% increase (doubled)

# 2. Calculate the growth factors (multipliers)
nominal_factor <- 1 + nominal_growth_rate  # 1.50
cpi_factor <- 1 + cpi_growth_rate          # 2.00

# 3. Calculate the real growth factor
real_factor <- nominal_factor / cpi_factor

# 4. Calculate the real percentage change
real_percentage_change <- (real_factor - 1) * 100

# 5. Output the results
cat("--- Economic Analysis ---\n")
cat(sprintf("Nominal Salary Multiplier: %.2f\n", nominal_factor))
cat(sprintf("CPI (Inflation) Multiplier: %.2f\n", cpi_factor))
cat(sprintf("Real Salary Multiplier: %.2f\n", real_factor))
cat(sprintf("Real Percentage Change: %.2f%%\n", real_percentage_change))

# Optional: Show what happens to a hypothetical $100 salary
initial_salary <- 100
new_nominal_salary <- initial_salary * nominal_factor
real_salary_in_1970_dollars <- new_nominal_salary / cpi_factor

cat("\n--- Purchasing Power Example ---\n")
cat(sprintf("If you earned $%.2f in 1970:\n", initial_salary))
cat(sprintf("  In 1980, you earn $%.2f nominally.\n", new_nominal_salary))
cat(sprintf("  But because prices doubled, that $%.2f only buys what $%.2f bought in 1970.\n", 
            new_nominal_salary, real_salary_in_1970_dollars))