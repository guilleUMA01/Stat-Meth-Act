t = c(1959, 1960, 1961, 1962, 1963, 1964, 1965)
X = c(6, 6.2, 5.1, 4.9, 5.2, 5.8, 7)

ma_3 =  stats::filter(X, c(1,1,1)/3)

print(round(ma_3, 4))

ma_4 = stats::filter(X, c(0.5, 1, 1, 1, 0.5)/4)

print(round(ma_4, 4))