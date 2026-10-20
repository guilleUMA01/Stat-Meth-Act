x <- c(0, 1, 0, -1, 0, 1, 1, 2)
y <- c(0, 1, 1, 1, 3, 2, 2, 0)
z <- c(2, 3, 4, 5, 7, 4, 5, 0)

n <- length(z)

X <- matrix(c(x, y, rep(1, n)), nrow = n, ncol = 3)
colnames(X) <- c("x", "y", "Intercept")

Z <- matrix(z, nrow = n, ncol = 1)

X_transpuesta <- t(X)          
XTX <- X_transpuesta %*% X    
XTZ <- X_transpuesta %*% Z    

cat("Matriz X'X:\n")
print(XTX)
cat("\nVector X'Z:\n")
print(XTZ)

beta <- solve(XTX) %*% XTZ

a <- beta[1, 1] 
b <- beta[2, 1] 
c <- beta[3, 1] 

cat("\n--- Coeficientes obtenidos por Ecuaciones Normales ---\n")
cat(sprintf("a = %.4f\n", a))
cat(sprintf("b = %.4f\n", b))
cat(sprintf("c = %.4f\n", c))
cat(sprintf("Ecuación del plano: z = %.4f*x + %.4f*y + %.4f\n\n", a, b, c))

Z_hat <- X %*% beta

residuos <- Z - Z_hat

SSE <- sum(residuos^2)

gl <- n - 3
varianza_residual <- SSE / gl

SST <- sum((Z - mean(Z))^2)
R2 <- 1 - (SSE / SST)

cat("--- Resultados Finales ---\n")
cat(sprintf("Suma de Errores al Cuadrado (SSE): %.4f\n", SSE))
cat(sprintf("Varianza Residual: %.4f\n", varianza_residual))
cat(sprintf("Coeficiente de Determinación (R^2): %.4f\n", R2))