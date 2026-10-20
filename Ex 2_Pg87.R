D <- c(43, 55, 40, 52, 39, 33, 50, 33, 44, 21)

V <- c(27.0, 23.8, 30.7, 24.0, 34.8, 41.4, 27.0, 40.4, 31.7, 51.2)

plot(x = D, y = V, 
     main = "Scatter diagram",
     xlab = "D (veh/km)", 
     ylab = "V (km/h)", 
     pch = 19)   

modelo_lineal <- lm(V ~ D)
abline(modelo_lineal, lwd = 2)

r_calculado <- cor(D, V)

test_cor <- cor.test(D, V)

print(test_cor)

p_valor <- test_cor$p.value


# 1. Input the data
# Density (veh/km)
D <- c(43, 55, 40, 52, 39, 33, 50, 33, 44, 21)

# Speed (minutes and seconds) -> Convert to decimal minutes
# e.g., 27'0 = 27 + 0/60; 23'8 = 23 + 8/60
V_min <- c(27, 23, 30, 24, 34, 41, 27, 40, 31, 51)
V_sec <- c( 0,  8,  7,  0,  8,  4,  0,  4,  7,  2)
V <- V_min + (V_sec / 60)


# ==========================================
# TASK 1: Plot the scatter diagram
# ==========================================
# We plot D on the x-axis and V on the y-axis
plot(D, V, 
     main = "Scatter Diagram: Speed vs. Density",
     xlab = "Density D (veh/km)", 
     ylab = "Speed V (min)", 
     pch = 19, col = "blue")

# Add a line of best fit to visualize the trend
abline(lm(V ~ D), col = "red", lwd = 2)


# ==========================================
# TASK 2: Choose the correct r based on the diagram
# ==========================================
cat("--- TASK 2 ---\n")
cat("Looking at the plot, as Density (D) increases, Speed time (V) decreases.\n")
cat("This indicates a NEGATIVE correlation.\n")
cat("The points form a fairly tight line, suggesting a strong correlation.\n")
cat("Therefore, the correct choice is -0.968.\n\n")


# ==========================================
# TASK 3: Verify the answer by calculating r
# ==========================================
r_calculated <- cor(D, V)

cat("--- TASK 3 ---\n")
cat(sprintf("Calculated Correlation Coefficient (r): %.4f\n\n", r_calculated))


# ==========================================
# TASK 4: Is there evidence of an association?
# ==========================================
cat("--- TASK 4 ---\n")
# We perform a correlation test to check for statistical significance
test_result <- cor.test(D, V)

print(test_result)

cat("\nConclusion:\n")
if(test_result$p.value < 0.05) {
  cat("Yes, there is strong statistical evidence of a real association between speed and density.\n")
  cat("The p-value is extremely small, meaning this relationship is highly unlikely to be due to chance.\n")
} else {
  cat("No, there is not enough evidence to suggest an association.\n")
}
