# Q1 ------------------------------------
.2 == (.3-.1) 
# FALSE

all.equal(.2 ,(.3-.1))
# TRUE

# 컴퓨터 연산에서의 실수 표현에서는 부동소수점 방식을 사용.
# 따라서 소수 자릿수를 비교하는 경우에는 두 값의 차이가 오차보다 작은지를 판단.




# Q2 ------------------------------------

### (1) f(x) = sinx / x
evaluatefunctionsinc = function(xmin, xmax, n){
  x = c(0)
  f = c(0)
  for (i in (0:n)){
    x[i+1] = xmin + i*(xmax-xmin)/n
    f[i+1] = (sin(x[i+1]))/x[i+1]
  }
  plot(x,f,type="l",col="blue",xlab="x",ylab="function")
}

# graph
par(mfrow=c(1,2))
evaluatefunctionsinc(-10, 10, 100)
evaluatefunctionsinc(-10^-20, 10^-20, 100)

par(mfrow=c(1,1))


### (2) f(x) = sinx/x을 0에서 연속이 되도록 정의. epsilon보다 큰 경우 1 을 주도록 함
evaluatefunctionwithcheck = function(xmin, xmax, n, epsilon){
  x = c(0)
  f = c(0)
  for (i in (0:n)){
    x[i+1] = xmin + i*(xmax-xmin)/n
    if (abs(x[i+1]) > epsilon){
      f[i+1] = sin(x[i+1])/x[i+1]
    }
    else{
      f[i+1] = 1
    }
  }
  plot(x,f,type="l",col="blue",xlab="x",ylab="function")
}
evaluatefunctionwithcheck(-10^-20, 10^-20, 100, 10^-30)

# x=0에서의 수치적 문제 해결 O




# Q3 ------------------------------------

### (1) 재귀 프로그램
fiborecursive = function(i){
  if(i == 0){return(0)}
  if (i <= 2){
    value = 1
    return(value)
  }
  else{
    return(fiborecursive(i-1) + fiborecursive(i-2))
  }
}


### (2) 반복 프로그램
fiboiterative = function(i){
  if(i == 0){return(0)}
  if (i <= 2){
    value = 1
    return(value)
  }
  else{
    value1 = 1
    value2 = 1
    for(i in 3:i){
      value = value1 + value2
      value1 = value2
      value2 = value
    }
  }
  return(value)
}


### 시간 측정
for(i in c(10, 20, 30, 40)){
  cat("i" = i , "recursive = ", system.time(fiborecursive(i))[3],
      "iterative = ", system.time(fiboiterative(i))[3], "\n")}

## 10 recursive = 0.02 iterative = 0
## 20 recursive = 0 iterative = 0
## 30 recursive = 0.81 iterative = 0
## 40 recursive = 90.87 iterative = 0

# n이 커질수록 재귀 프로그램의 속도가 훨씬 느림