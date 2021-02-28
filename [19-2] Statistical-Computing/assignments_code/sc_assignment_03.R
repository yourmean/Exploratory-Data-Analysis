# Q1 ------------------------------------


### data
X = matrix(c(1, 1, 1, 1, 1, 1, 1, 2, 3, 5, 5, 7, 1, 3, 3, 4, 4, 5), nrow = 6, ncol = 3)
y = c(2, 4, 5, 8, 8, 9)
XX = t(X) %*% X # XX = X^t X 지정

### (a)
# 2.1 예제 함수 (강의노트 참조)
choleskyfactorization = function(A){
  n = nrow(A)
  L = matrix(0,nrow=n,ncol=n)
  for (i in (1:n)){
    L[i,i] = A[i,i]
    if (i > 1){
      for (k in (1:(i-1))){
        L[i,i] = L[i,i] - L[i,k]*L[i,k]
      }
    }
    L[i,i] = (L[i,i])^(1/2)
    if (i < n){
      for (j in ((i+1):n)){
        L[j,i] = A[j,i]
        if (i > 1){
          for (k in (1:(i-1))){
            L[j,i] = L[j,i] - L[j,k]*L[i,k]
          }
        }
        L[j,i] = L[j,i]/L[i,i]
      }
    }
  }
  return(L)
}


# 2.2 예제 함수 - 하삼각행렬
choleskyfactorization(XX)
## [,1] [,2] [,3]
## [1,] 2.449490 0.000000 0.000000
## [2,] 9.389711 4.983305 0.000000
## [3,] 8.164966 2.876270 1.029759


# 3 내장 함수 - 하삼각행렬
t(chol(XX))
## [,1] [,2] [,3]
## [1,] 2.449490 0.000000 0.000000
## [2,] 9.389711 4.983305 0.000000
## [3,] 8.164966 2.876270 1.029759



### (b)

svd(X)$d # X의 고유값
## [1] 13.8687545 1.5167688 0.5975465

svd(X)$d^2 # X의 고유값의 제곱
## [1] 192.3423505 2.3005877 0.3570618

svd(XX)$d # X^t X의 고유값
## [1] 192.3423505 2.3005877 0.3570618



### (c)

# QR 분해
X.qr = qr(X)
Q = qr.Q(X.qr); R = qr.R(X.qr)

Q; R
## [,1] [,2] [,3]
## [1,] -0.4082483 -0.5685651 0.677815759
## [2,] -0.4082483 -0.3678950 -0.703885596
## [3,] -0.4082483 -0.1672250 -0.143384103
## [4,] -0.4082483 0.2341150 0.006517459
## [5,] -0.4082483 0.2341150 0.006517459
## [6,] -0.4082483 0.6354551 0.156419021
## [,1] [,2] [,3]
## [1,] -2.44949 -9.389711 -8.164966
## [2,] 0.00000 4.983305 2.876270
## [3,] 0.00000 0.000000 -1.029759

Q %*% R # X = QL임을 확인
## [,1] [,2] [,3]
## [1,] 1 1 1
## [2,] 1 2 3
## [3,] 1 3 3
## [4,] 1 5 4
## [5,] 1 5 4
## [6,] 1 7 5

qr.solve(R) %*% t(Q) %*% y # QR분해로 구한 회귀계수 추정값
## [,1]
## [1,] 0.6455696
## [2,] 0.8354430
## [3,] 0.6455696

lm(y ~ X[,-1])$coefficients # lm으로 구한 회귀계수 추정값
## (Intercept) X[, -1]1 X[, -1]2
## 0.6455696 0.8354430 0.6455696




# Q2 ------------------------------------
gaussianeliminationpartial = function(Ab){
  n = nrow(Ab)
  for (k in (1:(n-1))){
    pivotindex = k
    for (i in ((k+1):n)){
      if (abs(Ab[i,k]) > abs(Ab[pivotindex,k])){
        pivotindex = i
      }
    }
    if (pivotindex != k){
      for (j in (k:(n+1))){
        buffer = Ab[k,j]
        Ab[k,j] = Ab[pivotindex,j]
        Ab[pivotindex,j] = buffer
      }
    }
    for (i in ((k+1):n)){
      mik = Ab[i,k]/Ab[k,k]
      Ab[i,k] = 0
      for (j in ((k+1):(n+1))){
        Ab[i,j] = Ab[i,j] - mik*Ab[k,j]
      }
    }
  }
  return(Ab)
}

A = matrix(c(5, -2, 1, 3, 1, 1, 4, 1, -1), ncol = 3, nrow = 3, byrow = TRUE)
b = c(9, 2, 3)
Ab = cbind(A, b)
ge = gaussianeliminationpartial(Ab)

backsolve(ge[,1:3], ge[,4])
## [1] 1.16 -1.56 0.08

# solve함수 이용
solve(A) %*% b
## [,1]
## [1,] 1.16
## [2,] -1.56
## [3,] 0.08


# Q3 ------------------------------------
library(Matrix)
X = matrix(c(1, 1, 2, 2, -2, -1, -1, 1, 1), 3, 3)
lufactorization = function(A){
  n = nrow(A)
  L = matrix(0,nrow=n,ncol=n)
  for (k in (1:(n-1))){
    for (i in ((k+1):n)){
      L[i,k] = A[i,k]/A[k,k]
      A[i,k] = 0
      for (j in ((k+1):n)){
        A[i,j] = A[i,j] - L[i,k]*A[k,j]
      }
    }
  }
  for (k in (1:n)) L[k,k] = 1
  return(cbind(L,A))
}
U = lufactorization(X)[,4:6]

prod(diag(U)) # U의 대각원소들의 곱
## [1] -2

det(X) # 행렬식과 결과 같음
## [1] -2