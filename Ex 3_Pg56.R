xx <- c(33742, 35401, 36147, 38067, 34149, 36176, 37485,
        39047, 34783, 37042, 38008, 40132, 36466, 38680, 39976, 42273,
        39131, 40780, 41852, 43684, 38729, 40427, 41576, 43886, 39131,
        40394, 40956, 42959, 38714, 40062, 41152, 43460, 38695, 39780,
        40923, 44093, 40777, 41778, 43160, 45897, 41947, 44061, 44378,
        47237, 43315, 43396, 44843, 46835, 42833, 43548, 44637, 47107,
        42552, 43526, 45039, 47940, 43740, 45007, 46667, 49325, 44878,
        46234, 47055, 50318, 46354, 47260, 48883, 52605, 48527, 50237,
        51592, 55152, 50451, 52294, 54633, 58802, 53990, 55477, 57850,
        61978)

car_sales_ts <- ts(xx, start = c(1969, 1), frequency = 4)

ma4_trend <- stats::filter(car_sales_ts, c(0.5, 1, 1, 1, 0.5)/4, sides = 2)

ratio_to_ma <- car_sales_ts / ma4_trend

seasonal_indices <- tapply(ratio_to_ma, cycle(car_sales_ts), mean, na.rm = TRUE)

deseasonalized <- car_sales_ts / rep(seasonal_indices, length.out = length(car_sales_ts))

df_results <- data.frame(
  Year = floor(time(car_sales_ts)),
  Quarter = cycle(car_sales_ts),
  Original = as.numeric(car_sales_ts),
  Trend_MA4 = as.numeric(ma4_trend),
  Deseasonalized = as.numeric(deseasonalized)
)
print(head(df_results, 12))

plot(car_sales_ts, main = "Quarterly Car Sales", ylab = "Sales", xlab = "Year")
lines(ma4_trend, col = "red", lwd = 2)
legend("topleft", legend = c("Original Data", "Trend (Centered MA4)"), 
       col = c("black", "red"), lty = 1, lwd = 2)