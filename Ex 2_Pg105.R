x = c(0, 1, 2, 3, 6)
y = c(7, 5, 4, 3.5, 3)

linear_model <- lm((1/y) ~ x)

a <- coef(linear_model)[1]
b <- coef(linear_model)[2]

sprintf("y = 1 / (%.4f + %.4f * x)\n", a, b)

