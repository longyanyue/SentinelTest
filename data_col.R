##########  PROJECT: SEQ Water Real Time Data Processing #######################
###### Author: Melissa Winnel

##-------------------------------------------------------------------------
##  Librarys needed
##-------------------------------------------------------------------------
library(utils)
library(gtools)
library(caTools)
library(grDevices)
library(rJava)
library(rJython)
library(RMySQL)

##-------------------------------------------------------------------------
##  load data and workspace
##-------------------------------------------------------------------------
source("functions.R")
kPeriod<-1440

##-------------------------------------------------------------------------
## counters
##-------------------------------------------------------------------------
countAB.pH1 <- 0
countBW.pH1 <- 0

countAB.pH2 <- 0
countBW.pH2 <- 0

countAB.EC1 <- 0
countBW.EC1 <- 0

countAB.EC2 <- 0
countBW.EC2 <- 0

countAB.TurbS1 <- 0
countBW.TurbS1 <- 0

countAB.TurbS2 <- 0
countBW.TurbS2 <- 0

countAB.TempC1 <- 0
countBW.TempC1 <- 0

countAB.TempC2 <- 0
countBW.TempC2 <- 0

month.in.database <- 0
##############################################################
sensor.socket <- make.socket(host = "localhost", port = 8888)
read.socket(sensor.socket)

windows(width = 60, height = 40)
par(mfcol = c(4,2))

##############################################################

##-------------------------------------------------------------------------
## ALARMS
##-------------------------------------------------------------------------
alarms.pH1 <- as.data.frame(matrix(0, nrow = 1, ncol = 4))
colnames(alarms.pH1) <- c("MINUTES", "pH", "DIRECTION", "lenTIME")

alarms.EC1 <- as.data.frame(matrix(0, nrow = 1, ncol = 4))
colnames(alarms.EC1) <- c("MINUTES", "EC", "DIRECTION", "lenTIME")

alarms.TurbS1 <- as.data.frame(matrix(0, nrow = 1, ncol = 4))
colnames(alarms.TurbS1) <- c("MINUTES", "TurbS", "DIRECTION", "lenTIME")

alarms.TempC1 <- as.data.frame(matrix(0, nrow = 1, ncol = 4))
colnames(alarms.TempC1) <- c("MINUTES", "TempC", "DIRECTION", "lenTIME")

system.codes1 <- as.data.frame(matrix(0, nrow = 1, ncol = 3))
colnames(system.codes1) <- c("MINUTES", "Codes", "Action")

alarms.pH2 <- as.data.frame(matrix(0, nrow = 1, ncol = 4))
colnames(alarms.pH2) <- c("MINUTES", "pH", "DIRECTION", "lenTIME")

alarms.EC2 <- as.data.frame(matrix(0, nrow = 1, ncol = 4))
colnames(alarms.EC2) <- c("MINUTES", "EC", "DIRECTION", "lenTIME")

alarms.TurbS2 <- as.data.frame(matrix(0, nrow = 1, ncol = 4))
colnames(alarms.TurbS2) <- c("MINUTES", "TurbS", "DIRECTION", "lenTIME")

alarms.TempC2 <- as.data.frame(matrix(0, nrow = 1, ncol = 4))
colnames(alarms.TempC2) <- c("MINUTES", "TempC", "DIRECTION", "lenTIME")

system.codes2 <- as.data.frame(matrix(0, nrow = 1, ncol = 3))
colnames(system.codes2) <- c("MINUTES", "Codes", "Action")


