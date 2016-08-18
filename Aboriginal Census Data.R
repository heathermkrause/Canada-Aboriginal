rm(list = ls())
library(nlme)
library(lattice)
library(car)
library(dplyr)
library(ggplot2)
library(plyr)

data2011 <- read.csv("/Users/heatherkrause/Desktop/Canada Data/Canada NHS 2011.csv",na.strings = c("", " ", "NA", "."))
data2006 <- read.csv("/Users/heatherkrause/Desktop/Canada Data/Canada Census 2006.csv",na.strings = c("", " ", "NA", "."))
data2001 <- read.csv("/Users/heatherkrause/Desktop/Canada Data/Canada Census 2001.csv",na.strings = c("", " ", "NA", "."))

data2001$Year <- 2001
data2011$Year <- 2011
data2006$Year <- 2006

data2001$pr <- data2001$provp

data2001$hhtype <- data2001$htypep

data2001$cfsize <- data2001$cfsizep

data2001$attsch <- data2001$schattp

data2001$cip2000 <- data2001$dgmfsp

data2001$mob1 <- data2001$mob1p

data2001$mob5 <- data2001$mob5p

data2001$pr1 <- data2001$prov1p

data2001$pr5 <- data2001$prov5p

data2001$dist <- data2001$distp

data2001$mode <- data2001$modep

data2001$lfact <- data2001$lfactp

data2001$fptwk <- data2001$fptwkp

data2001$lstwrk <- data2001$lstwkp

data2001$wkswrk <- data2001$wkswkp

data2001$naics <- data2001$naicsp

data2001$nocs <- data2001$nocs01p

data2001$totinc <- data2001$totincp

data2001$gtrfs <- data2001$tgovtp

data2001$hhinc <- data2001$hhincp

data2001$weight <- data2001$weightp

data2001$pkids <- data2001$prescp

data2001$immstat <- data2001$immpopp

data2001$yrimm <- data2001$yrimmig



data2001$aboid[data2001$absrp==1] <- 6
data2001$aboid[data2001$absrp==2] <- 1
data2001$aboid[data2001$absrp==3] <- 2
data2001$aboid[data2001$absrp==4] <- 3
data2001$aboid[data2001$absrp==5] <- 4
data2001$aboid[data2001$absrp==6] <- 5

names(data2011)
summary(data2011$aboid)
tab(data2011$aboid)
xyplot(data2011$aboid~data2011$cma)

dataM <- rbind.fill(data2011,data2006)
dataM2 <- rbind.fill(dataM,data2001)
dataS <- rbind.fill(data2011,data2006,data2001)
summary(dataM2$Year)
summary(dataS$Year)
length(dataM2$Year)
length(dataS$Year)


length(dataS$aboid)
length(data2001$aboid)
length(data2006$aboid)
length(data2011$aboid)

