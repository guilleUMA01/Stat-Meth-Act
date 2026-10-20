# 1. Input the data
prices <- c(6, 8, 6, 8, 6, 8, 12, 6, 8, 8, 6, 8, 8, 8, 12, 
            12, 8, 8, 12, 6, 8, 6, 6, 8, 12, 6, 6, 6, 6, 6)

# 2. Calculate Absolute Frequencies
# The table() function counts the occurrences of each unique value
abs_freq <- table(prices)

# 3. Calculate Relative Frequencies
rel_freq <- abs_freq / length(prices)

# 4. Calculate Cumulative Frequencies
cum_abs_freq <- cumsum(abs_freq)
cum_rel_freq <- cumsum(rel_freq)