# 1. Input the data as two separate vectors
# xi = Pressure, fi = Frequency (Compression magnitudes)
pressure_xi <- c(1, 2, 3, 4, 5)
compression_fi <- c(1, 1, 2, 2, 4)

# ==========================================
# METHOD 1: Create a simple data frame
# ==========================================
freq_table <- data.frame(
  Pressure = pressure_xi,
  Frequency = compression_fi
)

# Add a Total row
total_row <- data.frame(
  Pressure = "Total",
  Frequency = sum(compression_fi)
)

freq_table <- rbind(freq_table, total_row)

cat("--- Frequency Distribution Table ---\n")
print(freq_table, row.names = FALSE)


# ==========================================
# METHOD 2: Reconstruct raw data & use table()
# ==========================================
# If you want to use R's built-in table() function, you must 
# expand the frequency pairs into the actual raw list of 10 observations.

# rep(x, times) repeats each value of x by its corresponding frequency
raw_data <- rep(pressure_xi, times = compression_fi)

cat("\n--- Reconstructed Raw Data ---\n")
print(raw_data)

cat("\n--- Using R's table() function ---\n")
print(table(raw_data))