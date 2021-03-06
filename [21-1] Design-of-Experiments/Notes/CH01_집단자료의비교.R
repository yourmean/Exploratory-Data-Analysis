# CH1.

library(ggplot2)
library(dplyr)
library(tidyr)
library(cowplot)
library(agricolae)
library(kableExtra)

# 1.1
line1 <- c(16.9, 16.4, 17.2, 16.4, 16.5, 17.0, 17.0, 17.2, 16.6, 16.6)
line2 <- c(16.6, 16.8, 17.4, 17.1, 17.0, 16.9, 17.3, 17.0, 17.1, 17.3)
df220 <- data.frame(line1, line2)
df220

df22<- gather(df220,  key="line", value="strength") 
df22

summary(df220)

df22 %>% group_by(line)  %>%  summarise(mean=mean(strength), median= median(strength), sd=sd(strength), min=min(strength), max=max(strength))

with(df22, boxplot(strength~line))

ggplot(df22, aes(line, strength)) +  geom_boxplot()



# 1.2
company<- as.factor(rep(c(1:4), each=4))
response<- c(1.93, 2.38, 2.20, 2.25,
             2.55, 2.72, 2.75, 2.70,
             2.40, 2.68, 2.32, 2.28,
             2.33, 2.38, 2.28, 2.25)
df31<- data.frame(company=company, response= response)
df31

df31s <- df31 %>% group_by(company)  %>%  summarise(mean=mean(response), median= median(response), sd=sd(response), min=min(response), max=max(response))
df31s

ggplot(df31, aes(company, response)) +  geom_boxplot()

ggplot(df31, aes(company, response)) +
  geom_boxplot() + 
  geom_line(data=df31s, aes(x=company, y=mean, group=1), size=1.5, col="#9ACBF9") +
  geom_point(data=df31s, aes(x=company, y=mean), col="darkblue", size=3) +
  theme_bw()