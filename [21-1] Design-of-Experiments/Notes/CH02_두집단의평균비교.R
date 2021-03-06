# CH2.

library(ggplot2)
library(dplyr)
library(tidyr)
library(cowplot)
library(agricolae)
library(kableExtra)

# 2.1 t검정
line1 <- c(16.9, 16.4, 17.2, 16.4, 16.5, 17.0, 17.0, 17.2, 16.6, 16.6)
line2 <- c(16.6, 16.8, 17.4, 17.1, 17.0, 16.9, 17.3, 17.0, 17.1, 17.3)
df220 <- data.frame(line1, line2)
df22<- gather(df220,  key="line", value="strength") 

t.test(strength~line, df22, paired = FALSE, var.equal = TRUE, conf.level = 0.95)

# 2.2 t검정의 재구성