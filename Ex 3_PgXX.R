# 1. Input the data
years <- c(1976, 1977, 1978, 1979, 1980, 1981)

d <- matrix(c(178.2, 156.7, 164.2, 153.2, 157.5, 172.6, 185.9, 185.8, 165.0, 163.6,
              169.0, 183.1, 196.3, 162.8, 168.6, 156.9, 168.2, 180.2, 197.9, 195.9,
              176.0, 166.4, 166.3, 183.9, 197.3, 173.7, 173.2, 159.7, 175.2, 187.4, 
              202.6, 205.6, 185.6, 175.6, 176.3, 191.7, 209.5, 186.3, 183.0, 169.5, 
              178.2, 186.7, 202.4, 204.9, 180.6, 179.8, 177.4, 188.9, 200.0, 188.7, 
              187.5, 168.6, 175.7, 189.4, 216.1, 215.4, 191.5, 178.5, 178.6, 195.6, 
              205.2, 179.6, 185.4, 172.4, 177.7, 202.7, 220.2, 210.2, 186.9, 181.4, 
              175.6, 195.6), nrow = 12, byrow = TRUE)

# 2. Flatten the matrix into a single chronological vector
# The matrix has 12 rows (months) and 6 columns (years).
# as.vector() reads the matrix column by column, which perfectly 
# orders the data chronologically from Jan 1976 to Dec 1981.
sales_vector <- as.vector(d)

# 3. Create a Time Series object
# frequency = 12 indicates monthly data
# start = c(1976, 1) indicates the series starts in January 1976
sales_ts <- ts(sales_vector, start = c(1976, 1), frequency = 12)

# 4. Calculate the Centered Moving Average of Order 12 (Trend)
# For a 12-month MA, we use a filter of 1/12 for the middle 12 terms, 
# and 1/24 for the endpoints to center the average.
ma12_trend <- stats::filter(sales_ts, c(0.5, rep(1, 11), 0.5)/12, sides = 2)

# 5. Calculate the Ratio to Moving Average (Seasonal Irregular component)
ratio_to_ma <- sales_ts / ma12_trend

# 6. Calculate Seasonal Indices
# Average the ratio_to_ma for each month (Jan, Feb, ... Dec)
seasonal_indices <- tapply(ratio_to_ma, cycle(sales_ts), mean, na.rm = TRUE)

# 7. Calculate Deseasonalized Data
deseasonalized <- sales_ts / rep(seasonal_indices, length.out = length(sales_ts))

# 8. Output the results
cat("--- Seasonal Indices (By Month) ---\n")
print(round(seasonal_indices, 4))

cat("\n--- Deseasonalized Data (First 24 months) ---\n")
df_results <- data.frame(
  Year = floor(time(sales_ts)),
  Month = cycle(sales_ts),
  Original = as.numeric(sales_ts),
  Trend_MA12 = as.numeric(ma12_trend),
  Deseasonalized = as.numeric(deseasonalized)
)
print(head(df_results, 24))

# Optional: Plot the original data and the trend
plot(sales_ts, main = "Monthly Sales Data", ylab = "Sales", xlab = "Year")
lines(ma12_trend, col = "red", lwd = 2)
legend("topleft", legend = c("Original Data", "Trend (Centered MA12)"), 
       col = c("black", "red"), lty = 1, lwd = 2)