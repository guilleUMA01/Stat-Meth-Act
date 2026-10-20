
N <- 20  
K <- 3   
n <- 4   
k <- 1   


ways_1_defective <- choose(K, k)          
ways_3_good <- choose(N - K, n - k)       
total_ways <- choose(N, n)              
prob_manual <- (ways_1_defective * ways_3_good) / total_ways

# 4. Alternative: Use R's built-in hypergeometric function
# dhyper(x, m, n, k) where:
# x = number of defectives we want
# m = total number of defectives
# n = total number of non-defectives
# k = sample size
prob_builtin <- dhyper(x = k, m = K, n = N - K, k = n)

cat(sprintf("Probability (Manual Calculation): %.4f or %.2f%%\n", 
            prob_manual, prob_manual * 100))
cat(sprintf("Probability (dhyper function):    %.4f or %.2f%%\n", 
            prob_builtin, prob_builtin * 100))