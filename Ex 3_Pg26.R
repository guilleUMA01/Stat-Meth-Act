library(tidyverse)
xx <- c(178.2, 153.2, 185.9, 163.6,
        196.3, 156.9, 197.9, 166.4,
        197.3, 159.7, 202.6, 175.6,
        209.5, 169.5, 202.4, 179.8,
        200.0, 168.6, 216.1, 178.5
)
# Reading the data
# Indicate the frequency of the seasonal component
uk <- ts(xx, start = c(1980, 1), frequency = 4)
uk
plot(uk)

# Trend component, using a moving average of order 4
tend <- stats::filter(uk, c(.5, 1, 1, 1, .5) / 4)
tend
# Plot the series with the trend in red
plot(uk)
lines(tend, col = 2)

###############################################
# Multiplicative Decomposition
###############################################
# Seasonal (E) * Random Component (A) = X/TC :
est_aleM <- uk / tend
est_aleM

# Unnormalized Seasonal Component
est1M <- colMeans(matrix(est_aleM, ncol=4, byrow=T),
                  na.rm=T)
est1M

# Normalize the Seasonal Component
estM <- est1M / mean(est1M)
estM

# Random Component
aleM <- est_aleM / estM
aleM

# Deseasonalized Series
desestM <- uk / estM
desestM
# Graph of the Deseasonalized Series
plot(uk)
lines(desestM, col=4)
