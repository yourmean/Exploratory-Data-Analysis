# assignment 1


# Q2-5 ------------------------------
# (a)
line1= c(1.18, 1.42, 0.69, 0.88, 1.62, 1.09, 1.53, 1.02, 1.19, 1.32)
line2= c(1.72, 1.62, 1.69, 0.79, 1.79, 0.77, 1.44, 1.29, 1.96, 0.99)

boxplot(line1, line2)
shapiro.test(line1)
shapiro.test(line2)
qqnorm(line1)
qqline(line1)
qqnorm(line2)
qqline(line2)

# (b)
t.test(line1, line2, paired = FALSE, var.equal = TRUE, conf.level = 0.95)

# Q3-3 ------------------------------

a1= c(19, 20, 23, 20, 26, 18, 18, 35)
a2= c(20, 20, 32, 27, 40, 24, 22, 18)
a3= c(16, 15, 18, 26, 19, 17, 19, 18)

df= data.frame(a1, a2, a3)
df= gather(df, key='shape', value='time')

#plot
ggplot(df, aes(shape, time)) +
  geom_boxplot() 

# (a)분산분석표
anova.res= aov(time~shape, data=df)
summary(anova.res)

#(b)모평균에 대한 신뢰구간 & LSD
result= LSD.test(anova.res, "shape", group=FALSE, console = TRUE)
result
