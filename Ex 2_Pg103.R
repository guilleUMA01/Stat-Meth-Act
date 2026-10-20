x = c(0, 1, 2, 3, 6)
y = c(7, 5, 4, 3.5, 3)

linear_model <- lm(log(y) ~ x)

intercept <- coef(linear_model)[1]
slope <- coef(linear_model)[2]

a <- exp(intercept)
b <- slope

sprintf("y = %.4f * e^(%.4f * x)\n", a, b)

y_est <- a * exp(b * x)

mse <- mean((y - y_est)^2)

sprintf("MSE = %.4f", mse)

ss <- mean((y - mean(y))^2)

rs <- 1 - (mse / ss)

sprintf("R^2: %.4f\n", rs)
