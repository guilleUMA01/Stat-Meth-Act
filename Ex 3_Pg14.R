X = c(2.6767, 3.2050, 4.8714, 4.6275, 5.9008, 5.5200, 5.1186, 4.9507, 4.6612, 6.2572)

ma_3_full <- stats::filter(X, c(1,1,1)/3)

print(round(ma_3_full, 4))

ma_4_full <- stats::filter(X, c(0.5, 1, 1, 1, 0.5)/4)

print(round(ma_4_full, 4))