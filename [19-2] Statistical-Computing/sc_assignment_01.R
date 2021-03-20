# Q1 ------------------------------------
.2 == (.3-.1) 
# FALSE

all.equal(.2 ,(.3-.1))
# TRUE

# ��ǻ�� ���꿡���� �Ǽ� ǥ�������� �ε��Ҽ��� ����� ���.
# ���� �Ҽ� �ڸ����� ���ϴ� ��쿡�� �� ���� ���̰� �������� �������� �Ǵ�.




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


### (2) f(x) = sinx/x�� 0���� ������ �ǵ��� ����. epsilon���� ū ��� 1 �� �ֵ��� ��
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

# x=0������ ��ġ�� ���� �ذ� O




# Q3 ------------------------------------

### (1) ��� ���α׷�
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


### (2) �ݺ� ���α׷�
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


### �ð� ����
for(i in c(10, 20, 30, 40)){
  cat("i" = i , "recursive = ", system.time(fiborecursive(i))[3],
      "iterative = ", system.time(fiboiterative(i))[3], "\n")}

## 10 recursive = 0.02 iterative = 0
## 20 recursive = 0 iterative = 0
## 30 recursive = 0.81 iterative = 0
## 40 recursive = 90.87 iterative = 0

# n�� Ŀ������ ��� ���α׷��� �ӵ��� �ξ� ����