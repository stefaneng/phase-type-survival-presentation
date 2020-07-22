# Example of competing risks survival package
library(survival)
hist(mgus2$age, nclass=30, main='', xlab="Age")
with(mgus2, tapply(age, sex, mean))
View(mgus2)
mfit1 <- survfit(Surv(futime, death) ~ sex, data=mgus2)
mfit1
