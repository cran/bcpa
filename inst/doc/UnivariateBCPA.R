## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, message = FALSE, fig.width = 6, fig.height = 4)

## ---- eval = FALSE------------------------------------------------------------
#  require(devtools)
#  install_github("EliGurarie/bcpa")

## -----------------------------------------------------------------------------
require(magrittr)
require(lubridate)
require(bcpa)

## ---- echo = -1---------------------------------------------------------------
set.seed(42)
n.obs <- 100
time = (Sys.time() - dhours(runif(n.obs, 0, n.obs))) %>% sort

d1 <- 50; d2 <- 100
t1 <- 25; t2 <- 65; t3 <- 85
sd1 <- 1; sd2 <- 5; sd3 <- 10

dtime <- difftime(time, min(time), units="hours") %>% as.numeric
phases <- cut(dtime, c(-1, t1, t2, t3, 200), labels = c("P1","P2","P3","P4")) 
means <- c(0,d1,d2,0)[phases]
sds <- c(sd1,sd2,sd3,sd1)[phases]
depth <- rnorm(n.obs,means, sds)
# make all depths positive!
depth <- abs(depth)
mydata <- data.frame(time, depth)

## -----------------------------------------------------------------------------
head(mydata)

## -----------------------------------------------------------------------------
with(mydata, plot(time, depth, type = "o"))

## -----------------------------------------------------------------------------
depth.ws <- WindowSweep(mydata, variable = "depth", time.var = "time", windowsize = 25, windowstep = 1, progress=FALSE)

## -----------------------------------------------------------------------------
plot(depth.ws, ylab = "Depth (m)")
plot(depth.ws, type = "flat", cluster = 8, ylab = "Depth (m)")
ChangePointSummary(depth.ws, cluster = 8)

