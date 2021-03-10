# Q1 ------------------------------------

# 모의실험
set.seed(2020)

# 표준라플라스 분포를 따르는 난수 생성 (by 역변환법)
ran = function(N){
  n = N/2 # 두 개의 구간에 대해 절반씩 생성
  u1 = runif(n, 0, 1/2) # U(0, 1/2) 에서 생성
  u2 = runif(n, 1/2, 1) # U(1/2, 1) 에서 생성
  x1 = log(2 * u1) # x < 0 부분 생성
  x2 = -log(2 - 2 * u2) # x >= 0 부분 생성
  return(c(x1, x2))
}

x = ran(N = 1000) # 표준 라플라스분포를 따르는 난수

# 히스토그램으로 그린 밀도함수(경험적 분포)
hist(x, breaks = 100, probability = TRUE, main = "empirical laplace(0, 1)")

# curve로 그린 밀도함수(이론적 분포)
fx = function(x){
  fx = ifelse(x >= 0, exp(-x) / 2, exp(x) / 2)
  return(fx)
}
curve(fx, from = -7, to = 7, add = TRUE, col = "red", lwd = 2)

# QQ plot
library(jmuOutlier)
library(lattice)

set.seed(2020)
qqmath( ~ x, distribution = function(x){qlaplace(x)},
        xlab = "theoritical quantiles", ylab = "Sample quantiles", main = "QQplot")





# Q2 ------------------------------------

# 모의실험
#library(dplyr)
set.seed(2020)
N = 1000
u = runif(N)
x = cut(u, breaks = c(0, 0.1, 0.3, 0.5, 0.7, 1), include.lowest = TRUE) %>% as.numeric()

# 상대도수 표
table(x) / N
## x
## 1 2 3 4 5
## 0.112 0.192 0.211 0.202 0.283





# Q3 ------------------------------------
N = 1000
ran_cauchy = function(N, location, scale){ # ~ cauchy(location, scale)
  if(scale <= 0) stop("scale must be greater than 0")
  y1 = rnorm(N)
  y2 = rnorm(N)
  Y = y1/y2
  return(scale*Y+location)
}
ran_x = ran_cauchy(N = 1000, location = 0, scale = 1) # ~ cauchy(0, 1)
# 경험적 분포
hist(ran_x[-10 < ran_x & ran_x < 10], breaks = 100, xlim = c(-10, 10),
     prob = TRUE, main = "empirical cauchy(0, 1)", xlab = "x")
# 이론적 분포
x = seq(-10, 10, length = 100)
curve(dcauchy(x), from = -10, to = 10, lwd = 2, col = "red", add = TRUE)





# Q4 ------------------------------------

# 모의실험

## Box - Miller 변환
box_miller = function(N){
  n = N/2
  U1 = runif(n) # 서로 독립인 균일분포
  U2 = runif(n)
  Z1 = sqrt(-2 * log(U1)) * cos(2 * pi * U2)
  Z2 = sqrt(-2 * log(U1)) * sin(2 * pi * U2)
  return(list(Z1, Z2))
}
system.time(box_miller(N = 100000))
## user system elapsed
## 0.02 0.00 0.01


## 극좌표에 의한 방법
polar = function(N){
  n = N/2
  V1 = runif(n, -1, 1)
  V2 = runif(n, -1, 1)
  W = V1^2 + V2^2
  id = which(W<=1)
  Z1 = sqrt(-2 * log(W[id])) * (V1[id]/sqrt(W[id]))
  Z2 = sqrt(-2 * log(W[id])) * (V2[id]/sqrt(W[id]))
  return(list(Z1, Z2))
}


system.time(polar(N = 100000))
## user system elapsed
## 0.02 0.00 0.02

