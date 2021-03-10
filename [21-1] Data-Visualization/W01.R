# CH1. basic of R

rm(list = ls()); gc(reset = T)


x = c("a","b","a","c","a")
#a:red, b:green, c:blue
b = c("red", "green", "blue")
b[factor(x)]

xf = factor(x, levels = c("c","b","a","d"))
table(xf)
table(x)

a = matrix(1:10,5,2)
b = a[,-1, drop=F] #drop=F 옵션 Re
class(b)
nrow(b)

a=list()
a[1:15]=1:15
unlist(a) #정보를 풀어서 벡터로 연결







#### 1-01. 벡터
#-----------------------------
x1 = 3.5
typeof(x1) #double
x2 = 3
typeof(x2) #double
x3 = 3L
typeof(x3) #integer

# -----------------------------
x4 = "a"
typeof(x4) #character
x5 = TRUE
typeof(x5) #logical 

# -----------------------------
x4 = "a"
typeof(x4)
x5 = TRUE
typeof(x5)

# -----------------------------
x6 = x1 + x3 #정수+실수=double
typeof(x6)

# Creating Vector -----------------------------
# 1. c() :1차운 array 생성, ,로 값 연결
x = c(3)
print(x) #3
x = c(88, 15, 12, 13)
x

# -----------------------------
# 2. :(콜론)로 연속적인 수 생성, 1씩 +- 자동으로 정해 줌
x1 = 1:3
x2 = 10:5
x3 = c(x2,x1)
x3
c(1:3, 10:5)

# -----------------------------
# 3. seq(from, to, by/length)
y = seq(from = 12, to = 30, by = 2)
y
y = seq(12, 30, length = 19) #길이가 19가 되도록 등간격으로 자름
y

# Useful function to create vector-----------------------------
# 1. rep() ★★★
x = rep(8, 4)
x
x = rep( c(5, 12, 13), 3)
x
x = rep( c(5, 12, 13), each = 3) #하나씩 3회씩 반복
x

# Slicing VVector 1 -----------------------------
# [] (브라켓)으로 원소 꺼내기
x = 5:8
x1 = x[1:3]
x1
x2 = c(x1[1:3], 10, x[4])
x2

# -----------------------------
y = c(1.2, 3.9, 0.4, 0.12)
y[c(1, 3)] #y의 1,3번째 원소
y[2:3]
v = 3:4
y[v]
y[c(1, 1, 2)] #중복도 ㄱㅊ

# -----------------------------
# index와 - 부호 함께 사용하면 -> 해당 변수 제외 후 return
y[-c(1,2)]
y[-length(y)]

# -----------------------------
# length
x = 3:6
length(x)
1:length(x)

# Operating on Vectors -----------------------------
#사칙연산은 원소별로 계산
x1 = c(5,0, -4)
x2 = c(1, 2, 2)

# -----------------------------
x1+x2
x1*x2
x1/x2

# -----------------------------
#벡터 간 길이가 맞지 않는 경우 -> 원소 재사용
x1 + 3
x1*2

# -----------------------------
x1 = c(5,0,-4,2)
x2 = c(2,1)
x1/x2

# Order of Operation -----------------------------
# : 연산이 사칙연산보다 우선
y = 1:10-1
y
y = 1:(10-1)
y

# Useful Operation -----------------------------
x <- 11
x^2
x%/%5
x%%5

# Logical Operation -----------------------------
6<=7
6==7
6!=7

# -----------------------------
z = c(5, 2, -3, 8)
z^2
z^2 > 8 #각 연산에 대해 판단

# Slicing Vector 2 (filltering) -----------------------------
# 원소가 가진 로지컬 벡터 이용
x = c(3,1,4,1)
x[x>5] #모두 false인 벡터 들어가면 numeric(0) return 
which(x>5) #integer(0)
x[which(x>5)]


#
x=c(NA,3,6,8)
which(x>5) #NA제외한 True 위치 반환
x[x>5] #NA를 포함함
# -----------------------------
# A%in%B 중요! A가 B에 포함?
1 %in% c(2,1,4) #T
c(1,5) %in% c(2,1,5) #T T
c(1,5,3) %in% c(2,1,5)#TTF
x = c(3,1,4,1)
x%in% c(2,1,4) #FTTT

# match() function -----------------------------
# match는 위치를 반환함
#match(찾는원소, 찾을곳)
match(1 ,c(2,1,4))
match(c(1,4),c(2,1,4))
x <- c(3,1,4,1)
match(x ,c(2,1,4))

# 문자열을 이용하여 %in% 함수와 match 함수의 유용성 설명
# 각자 생각해보기

# -----------------------------
y = matrix( c(1, 2, 3, 4), nrow = 2, ncol = 2)
y
y = matrix( c(1, 2, 3, 4), nrow = 2, ncol = 2, byrow = T)
y




#### 1-02. Matrix
# Creating Matrix-----------------------------
y = matrix(c(1,3,4,5,1,3,4,1),4,2)
y[1, 1]
y[, 1]
y[-2,]

# -----------------------------
class(y)
dim(y)
ncol(y)
nrow(y)

# -----------------------------
one = rep(1,4)
z = matrix( c(5:8, rep(-1,4), rep(0,4)), 4, 3)
cbind(one, z)

# -----------------------------
z = rbind(2, z)
z

# 원소가 문자인 행렬, 원소가 숫자인 행렬 만들고 cbind 하면 숫자가 문자로 바뀜



#### 1-03. DataFrame
# -----------------------------
# array, matrix는 같은 type으로 존재, 따라서 다른 타입의 원소가 추가되면 타입을 재설정해야 함
x = 1:10
x[1] = "a"
typeof(x[2]) #character
x = matrix(1:4,2,2)
x[2,2] = "b"
typeof(x) #character

# Creating Dataframe -----------------------------
# 다른 타입의 데이터를 각각의 column에 저장 가능 
kids = c("Jack", "Jill"); ages = c(12, 10)
d = data.frame(kids, ages, stringsAsFactors = F); d

str(d)

# Selecting the elements -----------------------------
d$ages
class(d$ages)
names(d) #열이름만

# -----------------------------
# index를 이용한 slicing 가능능
d[1,]
class(d[1,]) #데이터프레임 타입(행이 아님)

# cbind -----------------------------
# 열의 고유한 이름을 가짐
A = data.frame(x1 = rep(0,10), x2 = rep('b',10))
B = data.frame(x3 = rep(1,10), x2 = rep('d',10))
zz=rbind(A,B) #error
AB = cbind(A,B)
head(AB)

A = data.frame(x1 = rep('a',10), x2 = rep('b',10))
B = data.frame(x2 = rep('b',10), x1 = rep('d',10))
rbind(A,B)#열이름보고 묶어냄


#### 1-04. List
# -----------------------------
# 여러 타입의 오브젝트를 체인 형식으로 연결시킨 오브젝트
j <- list(names='Joe', salary = 55000, union = TRUE)

# -----------------------------
#노드 이름없이 생성가능, 노드 이름이 꺾쇠1 의 형식으로 표시
jn <- list('Joe', 55000, TRUE)

# -----------------------------
jini <- vector(mode = 'list', length = 10)

# Calling the components in the list -----------------------------
j$salary
j[["salary"]]
j[[2]]

# Adding the components in the list -----------------------------
j$history <- 1:10
j[[1]] <- "Yoon"
j

#ex ★★
x= c('a','b','a', 'c','a')
#a:red,b:green,c:blue
b=c('red','green','blue')
b=factor(x)
xf= factor(x, levels=c('c','b','a','d'))
table(xf)




#### 1-05. Factor 
# factor는 문자열이 아님!!
# -----------------------------
# 이산형 자료분석에 유용한 data type
# level은 fzctor를 이루는 값 중 유일한 값들을 의미함.
x <- c(5, 12, 13, 12)
xf <- factor(x)
xf

# Structure of factor -----------------------------
str(xf) #structure
unclass(xf) #속성 제거

# -----------------------------
as.numeric(xf)

# -----------------------------
xff <- factor(x, levels = c(5, 12, 13, 88))
xff

# -----------------------------
x1 <- c(4,2,3,3,2,2)
table(x1)
x2 <- c("a","b","a","a","b","b")
table(x2)
x3 = data.frame(x1 = x1, x2 = x2)
table(x3)

# -----------------------------
A = data.frame(x1 = rep(0,2), x2 = rep('b',2))
B = data.frame(x3 = rep(1,2), x2 = rep('d',2))
AB = cbind(A,B)
head(AB)

# -----------------------------
a = 0L
a[2] = 1
typeof(a[1])

# -----------------------------
a = matrix(1:10,5,2)
b = a[,-1]
class(b)

# -----------------------------
a = matrix(1:10,5,2)
b = c(a)
str(b)

# -----------------------------
a = c("tommy", "jimmy", "jane")
b = as.factor(a)
b
# factor -> integer vector
c(b)



#210310

# 반복함수 -----------------------------
# 각각 index 지정하여 계산&출력 가능
a = list()
for (i in 1:5) a[[i]] = i
b = unlist(a)
b

# -----------------------------
a = 1:3
b = as.matrix(a)
b

# -----------------------------
a = matrix(1:10,5,2)
b = as.data.frame(a)
str(b)

# -----------------------------
a = matrix(1:10,5,2)
b = as.data.frame(a)
b = unclass(b)
class(b)

# ------------------------------
for(i in 1:10){
  print(i)
}

# 반복함수 - for 구문------------------------------
ex_list = list(a1 = c(1, 2), a2 = c(4, 5), a3 = c(6, 7), a4=c(10, 11))

ex_vec = c() #ex_vec은 현재 NULL
v= c(2,4)
for(i in v){
  ex_vec = c(ex_list[[i]], ex_vec)
}

ex_vec


#double loop
# 3*4 matrix with all value being 1
a= matrix(rep(1,12), nrow=3, ncol=4)
a= matrix(1, nrow=3, ncol=4) # by recycling policy
a= matrix(1:12,3,4)
a

#i행 j열 원소의 제곱 나열?
add_val= c()
for(j in 1:4){
  for(i in 1:3){
    add_val= c(add_val, a[i,j]**2)
  }
}
add_val


# ------------------------------
ex_list = list(a1 = c(1, 2), a2 = c(4, 5), a3 = c(6, 7))

ex_vec = do.call("c", ex_list)
ex_vec

# ------------------------------
ex_list = list(a1 = c(1, 2), a2 = c(4, 5), a3 = c(6, 7))

ex_dataframe = do.call("rbind", ex_list)
ex_dataframe




# 반복함수 - apply ------------------------------
# 코딩이 짧아지는 이점 have
ex_data = data.frame(a1 = c(1, 2, 3), a2 = c(4, 5, 6))
ex_mean = NULL

for(i in 1:3){
  ex_mean[i] = (ex_data[i, 1] + ex_data[i, 2])/2
}

ex_mean


# ------------------------------
ex_data = data.frame(a1 = c(1, 2, 3), a2 = c(4, 5, 6))

ex_mean = apply(ex_data, 1, mean) #행기준
ex_mean
ex_mean = apply(ex_data, 2, mean) # 열기준
ex_mean


# lapply ------------------------------
# list node를 떼 와서 사용
ex_list = list(a1 = c(1, 2), a2 = c(4, 5), a3 = c(6, 7))
ex_mean = NULL

for(i in 1:3){
  ex_mean[i] = mean(ex_list[[i]])
}
ex_mean

# ------------------------------
ex_list = list(a1 = c(1, 2), a2 = c(4, 5), a3 = c(6, 7))
ex_mean = NULL

ex_mean = unlist(lapply(ex_list, mean, na.rm=TRUE)) #unlist-벡터로 바뀜

ex_mean

ex_list = list(a1 = c(1, 2, NA), a2 = c(4, 5), a3 = c(6, 7))
mean(ex_list[[1]], na.rm=TRUE) # NA 제외

?lapply

