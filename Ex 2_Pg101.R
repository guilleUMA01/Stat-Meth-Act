# 1. Introducir los datos
x <- c(0, 1, 0, -1, 0, 1, 1, 2)
y <- c(0, 1, 1, 1, 3, 2, 2, 0)
n <- length(x)

# Función para resolver por Ecuaciones Normales y calcular la bondad de ajuste
resolver_minimos_cuadrados <- function(X, Y, nombres_params, nombre_modelo) {
  # X: Matriz de diseño
  # Y: Vector de respuestas
  # nombres_params: Nombres de los coeficientes (ej. c("a", "b"))
  
  # Calcular Ecuaciones Normales: (X'X) * beta = X'Y
  XTX <- t(X) %*% X
  XTY <- t(X) %*% Y
  
  cat("====================================================\n")
  cat("Modelo:", nombre_modelo, "\n")
  cat("====================================================\n")
  
  cat("Ecuaciones Normales (Matriz X'X):\n")
  print(XTX)
  cat("\nVector X'Y:\n")
  print(XTY)
  cat("\n")
  
  # Resolver el sistema: beta = (X'X)^(-1) * (X'Y)
  beta <- solve(XTX) %*% XTY
  
  # Imprimir la ecuación ajustada
  cat("Coeficientes obtenidos:\n")
  for(i in 1:length(beta)) {
    cat(sprintf("%s = %.4f\n", nombres_params[i], beta[i, 1]))
  }
  
  # Calcular valores predichos y residuos
  Y_hat <- X %*% beta
  residuos <- Y - Y_hat
  
  # Calcular Suma de Errores al Cuadrado (SSE)
  SSE <- sum(residuos^2)
  
  # Calcular Suma Total de Cuadrados (SST)
  SST <- sum((Y - mean(Y))^2)
  
  # Calcular Coeficiente de Determinación (R^2)
  R2 <- 1 - (SSE / SST)
  
  # Calcular Varianza Residual
  gl <- n - length(beta) # Grados de libertad
  varianza_residual <- SSE / gl
  
  cat("\n--- Bondad de Ajuste ---\n")
  cat(sprintf("SSE: %.4f\n", SSE))
  cat(sprintf("Varianza Residual: %.4f\n", varianza_residual))
  cat(sprintf("R^2: %.4f\n\n", R2))
  
  return(list(beta = beta, SSE = SSE, R2 = R2))
}

# ==========================================
# Apartado 1: Ajuste y = a * sin(x) + b * cos(x)
# ==========================================
# La matriz de diseño X1 tiene columnas: sin(x) y cos(x)
X1 <- matrix(c(sin(x), cos(x)), nrow = n, ncol = 2)
colnames(X1) <- c("sin(x)", "cos(x)")

# Resolver
res1 <- resolver_minimos_cuadrados(X1, y, c("a", "b"), "y = a*sin(x) + b*cos(x)")


# ==========================================
# Apartado 2: Ajuste y = a * x^2 + b * x + c
# ==========================================
# La matriz de diseño X2 tiene columnas: x^2, x, y una columna de 1s (para c)
X2 <- matrix(c(x^2, x, rep(1, n)), nrow = n, ncol = 3)
colnames(X2) <- c("x^2", "x", "Intercepto")

# Resolver
res2 <- resolver_minimos_cuadrados(X2, y, c("a", "b", "c"), "y = a*x^2 + b*x + c")