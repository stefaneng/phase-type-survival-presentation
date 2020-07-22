library(mstate)
library(msm)
data("cav")
cav <- cav[!is.na(cav$pdiag),]
statetable.msm(state, PTNUM, data = cav)

twoway4.q <- rbind(c(0, 0.25, 0, 0.25), c(0.166, 0, 0.166, 0.166),
                       c(0, 0.25, 0, 0.25), c(0, 0, 0, 0))
rownames(twoway4.q) <- colnames(twoway4.q) <- c("Well", "Mild","Severe", "Death")

cav.msm <- msm(state ~ years, subject = PTNUM, data = cav, qmatrix = twoway4.q, death = 4)
plot(cav.msm)

pmatrix.msm(cav.msm, t = 1, ci = "normal")
qmatrix.msm(cav.msm)
