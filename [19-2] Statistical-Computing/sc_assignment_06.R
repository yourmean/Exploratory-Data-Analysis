# Q1 ------------------------------------

# 1. 표본평균 몬테칼로 적분법

# 모의실험
N = 10000
I = integrate(dnorm, 0, 1)$value #참값
I
## [1] 0.3413447

## 적분값 구하기
set.seed(2020)
x = runif(N)
mean(exp(-x^2/2)/sqrt(2*pi))
## [1] 0.3419765



# 2. 적중법
set.seed(2020)
fx = function(x) exp(-x^2/2)/sqrt(2*pi)
c = 0.4
x = runif(N) # x좌표 생성 X ~ U(0, 1)
y = runif(N, 0, c) # x좌표 생성 Y ~ U(0, c)
hit = y < fx(x) # Hit 갯수
sum(hit)
## [1] 8572

c * sum(hit) / N # 적중법으로 계산한 몬테칼로 적분값
## [1] 0.34288

# plot
plot(x, y, pch = 16, col = "darkgray")
points(x[hit], y[hit], pch = 16, col = "skyblue")



# 3. 오차한계  10^(-3)에서 99% 신뢰도를 가지기 위해 필요한 표본 크기 구하기
## 표본 크기 구하기
alpha = 0.01
e = 10^(-3)
b = 1
a = 0

# 1) 표본평균 몬테칼로 적분법
g = function(x){exp(-x^2)/(2*pi)}
((b-a) * integrate(g, 0, 1)$value - I^2) / (alpha * e^2)
## [1] 234451.7

# 2) 적중법
(c^2 * (b-a)^2) / (4 * alpha * e^2)
## [1] 4e+06




# Q2 ------------------------------------
# (a) 대조변수와 표본평균 몬테칼로 적분법으로 계산된 추정량의 분산 비교
# Cov=-0.2342, Var=0.0156

# 모의실험

## 대조변수법
set.seed(2020)
ant_sampling = function(N = 10000, antithetic=TRUE) {
  g = function(x) exp(x)
  u = runif(N/2)
  if (!antithetic){ # 표본평균 몬테칼로 적분법
    v = runif(N/2)
    u = c(u, v)
    var_I = var(g(u))/N
  } else{ # 대조변수법
    v = 1-u
    var_I = var(g(u) + g(v))/(2 * N)
  }
  return(var_I)
}

ant_var = ant_sampling(antithetic = TRUE) # 대조변수법 I hat var
simple_var = ant_sampling(antithetic = FALSE) # 표본평균 몬테칼로 적분법 I hat var

# 결과
ant_var # 대조변수법의 분산
## [1] 7.869546e-07

simple_var # 표본평균 몬테칼로 적분법의 분산
## [1] 2.421737e-05

1 - (simple_var - ant_var)/simple_var # 분산감소량
## [1] 0.03249546




# Q3 ------------------------------------

# 모의실험
N = 10000
g = function(x) (x^2/sqrt(2*pi)) * exp(-x^2/2) * (x > 1) # x의 범위: x > 1
f1 = function(x) dexp(x, 2)
f2 = function(x) dnorm(x, mean = 1, sd = 1)
max = 5


I = integrate(g, 1, max) # 참값
I
## 0.4006183 with absolute error < 3.7e-11


set.seed(2020)
x1 = rexp(N, 2)
x2 = rnorm(N, mean = 1, sd = 1)


# 적분값 추정
fg1 = g(x1)/f1(x1) # 주함수 1
fg2 = g(x2)/f2(x2) # 주함수 2

# 결과 저장
I_hat1 = list("mean" = mean(fg1), "var" = var(fg1)/N)
I_hat2 = list("mean" = mean(fg2), "var" = var(fg2)/N)


I_hat1 # 주함수 1(지수분포)을 사용했을 때 적분값과 분산
## $mean
## [1] 0.4097321
##
## $var
## [1] 0.0001685661


I_hat2 # 주함수 2(정규분포)을 사용했을 때 적분값과 분산
## $mean
## [1] 0.4028011
##
## $var
## [1] 1.649373e-05

# 주함수 그래프
x = seq(1, max, length = 100)
plot(x, g(x), type = "l", lwd = 2, ylim = c(0, 0.5), ylab = "")
points(x, f1(x), type = "l", lwd = 2, col = "blue")
points(x, f2(x), type = "l", lwd = 2, col = "red")
legend("topright", c("g", "f1(exp(1))", "f2(N(1,1))"), col = c("black", "blue", "red"), lwd = 2
)