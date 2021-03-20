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
b = a[,-1, drop=F] #drop=F �ɼ� Re
class(b)
nrow(b)

a=list()
a[1:15]=1:15
unlist(a) #������ Ǯ� ���ͷ� ����







#### 1-01. ����
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
x6 = x1 + x3 #����+�Ǽ�=double
typeof(x6)

# Creating Vector -----------------------------
# 1. c() :1���� array ����, ,�� �� ����
x = c(3)
print(x) #3
x = c(88, 15, 12, 13)
x

# -----------------------------
# 2. :(�ݷ�)�� �������� �� ����, 1�� +- �ڵ����� ���� ��
x1 = 1:3
x2 = 10:5
x3 = c(x2,x1)
x3
c(1:3, 10:5)

# -----------------------------
# 3. seq(from, to, by/length)
y = seq(from = 12, to = 30, by = 2)
y
y = seq(12, 30, length = 19) #���̰� 19�� �ǵ��� ������� �ڸ�
y

# Useful function to create vector-----------------------------
# 1. rep() �ڡڡ�
x = rep(8, 4)
x
x = rep( c(5, 12, 13), 3)
x
x = rep( c(5, 12, 13), each = 3) #�ϳ��� 3ȸ�� �ݺ�
x

# Slicing VVector 1 -----------------------------
# [] (�����)���� ���� ������
x = 5:8
x1 = x[1:3]
x1
x2 = c(x1[1:3], 10, x[4])
x2

# -----------------------------
y = c(1.2, 3.9, 0.4, 0.12)
y[c(1, 3)] #y�� 1,3��° ����
y[2:3]
v = 3:4
y[v]
y[c(1, 1, 2)] #�ߺ��� ����

# -----------------------------
# index�� - ��ȣ �Բ� ����ϸ� -> �ش� ���� ���� �� return
y[-c(1,2)]
y[-length(y)]

# -----------------------------
# length
x = 3:6
length(x)
1:length(x)

# Operating on Vectors -----------------------------
#��Ģ������ ���Һ��� ���
x1 = c(5,0, -4)
x2 = c(1, 2, 2)

# -----------------------------
x1+x2
x1*x2
x1/x2

# -----------------------------
#���� �� ���̰� ���� �ʴ� ��� -> ���� ����
x1 + 3
x1*2

# -----------------------------
x1 = c(5,0,-4,2)
x2 = c(2,1)
x1/x2

# Order of Operation -----------------------------
# : ������ ��Ģ���꺸�� �켱
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
z^2 > 8 #�� ���꿡 ���� �Ǵ�

# Slicing Vector 2 (filltering) -----------------------------
# ���Ұ� ���� ������ ���� �̿�
x = c(3,1,4,1)
x[x>5] #��� false�� ���� ���� numeric(0) return 
which(x>5) #integer(0)
x[which(x>5)]


#
x=c(NA,3,6,8)
which(x>5) #NA������ True ��ġ ��ȯ
x[x>5] #NA�� ������
# -----------------------------
# A%in%B �߿�! A�� B�� ����?
1 %in% c(2,1,4) #T
c(1,5) %in% c(2,1,5) #T T
c(1,5,3) %in% c(2,1,5)#TTF
x = c(3,1,4,1)
x%in% c(2,1,4) #FTTT

# match() function -----------------------------
# match�� ��ġ�� ��ȯ��
#match(ã�¿���, ã����)
match(1 ,c(2,1,4))
match(c(1,4),c(2,1,4))
x <- c(3,1,4,1)
match(x ,c(2,1,4))

# ���ڿ��� �̿��Ͽ� %in% �Լ��� match �Լ��� ���뼺 ����
# ���� �����غ���

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

# ���Ұ� ������ ���, ���Ұ� ������ ��� ����� cbind �ϸ� ���ڰ� ���ڷ� �ٲ�



#### 1-03. DataFrame
# -----------------------------
# array, matrix�� ���� type���� ����, ���� �ٸ� Ÿ���� ���Ұ� �߰��Ǹ� Ÿ���� �缳���ؾ� ��
x = 1:10
x[1] = "a"
typeof(x[2]) #character
x = matrix(1:4,2,2)
x[2,2] = "b"
typeof(x) #character

# Creating Dataframe -----------------------------
# �ٸ� Ÿ���� �����͸� ������ column�� ���� ���� 
kids = c("Jack", "Jill"); ages = c(12, 10)
d = data.frame(kids, ages, stringsAsFactors = F); d

str(d)

# Selecting the elements -----------------------------
d$ages
class(d$ages)
names(d) #���̸���

# -----------------------------
# index�� �̿��� slicing ���ɴ�
d[1,]
class(d[1,]) #������������ Ÿ��(���� �ƴ�)

# cbind -----------------------------
# ���� ������ �̸��� ����
A = data.frame(x1 = rep(0,10), x2 = rep('b',10))
B = data.frame(x3 = rep(1,10), x2 = rep('d',10))
zz=rbind(A,B) #error
AB = cbind(A,B)
head(AB)

A = data.frame(x1 = rep('a',10), x2 = rep('b',10))
B = data.frame(x2 = rep('b',10), x1 = rep('d',10))
rbind(A,B)#���̸����� ���


#### 1-04. List
# -----------------------------
# ���� Ÿ���� ������Ʈ�� ü�� �������� �����Ų ������Ʈ
j <- list(names='Joe', salary = 55000, union = TRUE)

# -----------------------------
#��� �̸����� ��������, ��� �̸��� ����1 �� �������� ǥ��
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

#ex �ڡ�
x= c('a','b','a', 'c','a')
#a:red,b:green,c:blue
b=c('red','green','blue')
b=factor(x)
xf= factor(x, levels=c('c','b','a','d'))
table(xf)




#### 1-05. Factor 
# factor�� ���ڿ��� �ƴ�!!
# -----------------------------
# �̻��� �ڷ�м��� ������ data type
# level�� fzctor�� �̷�� �� �� ������ ������ �ǹ���.
x <- c(5, 12, 13, 12)
xf <- factor(x)
xf

# Structure of factor -----------------------------
str(xf) #structure
unclass(xf) #�Ӽ� ����

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

# �ݺ��Լ� -----------------------------
# ���� index �����Ͽ� ���&��� ����
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

# �ݺ��Լ� - for ����------------------------------
ex_list = list(a1 = c(1, 2), a2 = c(4, 5), a3 = c(6, 7), a4=c(10, 11))

ex_vec = c() #ex_vec�� ���� NULL
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

#i�� j�� ������ ���� ����?
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




# �ݺ��Լ� - apply ------------------------------
# �ڵ��� ª������ ���� have
ex_data = data.frame(a1 = c(1, 2, 3), a2 = c(4, 5, 6))
ex_mean = NULL

for(i in 1:3){
  ex_mean[i] = (ex_data[i, 1] + ex_data[i, 2])/2
}

ex_mean


# ------------------------------
ex_data = data.frame(a1 = c(1, 2, 3), a2 = c(4, 5, 6))

ex_mean = apply(ex_data, 1, mean) #�����
ex_mean
ex_mean = apply(ex_data, 2, mean) # ������
ex_mean


# lapply ------------------------------
# list node�� �� �ͼ� ���
ex_list = list(a1 = c(1, 2), a2 = c(4, 5), a3 = c(6, 7))
ex_mean = NULL

for(i in 1:3){
  ex_mean[i] = mean(ex_list[[i]])
}
ex_mean

# ------------------------------
ex_list = list(a1 = c(1, 2), a2 = c(4, 5), a3 = c(6, 7))
ex_mean = NULL

ex_mean = unlist(lapply(ex_list, mean, na.rm=TRUE)) #unlist-���ͷ� �ٲ�

ex_mean

ex_list = list(a1 = c(1, 2, NA), a2 = c(4, 5), a3 = c(6, 7))
mean(ex_list[[1]], na.rm=TRUE) # NA ����

?lapply
