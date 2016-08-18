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

data2001$sex <- data2001$sexp

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

data2001$hhinc[data2001$hhincp == 1] <- 1
data2001$hhinc[data2001$hhincp == 2] <- 1
data2001$hhinc[data2001$hhincp == 3] <- 1
  data2001$hhinc[data2001$hhincp == 4] <- 2
  data2001$hhinc[data2001$hhincp == 5] <- 3
  data2001$hhinc[data2001$hhincp == 6] <- 4
  data2001$hhinc[data2001$hhincp == 7] <- 5
  data2001$hhinc[data2001$hhincp == 8] <- 7
  data2001$hhinc[data2001$hhincp == 9] <- 9
  data2001$hhinc[data2001$hhincp == 10] <- 10
  data2001$hhinc[data2001$hhincp == 11] <- 11
  data2001$hhinc[data2001$hhincp == 12] <- 12
  data2001$hhinc[data2001$hhincp == 13] <- 13
  data2001$hhinc[data2001$hhincp == 14] <- 14
  data2001$hhinc[data2001$hhincp == 15] <- 15
  data2001$hhinc[data2001$hhincp == 16] <- 16
  data2001$hhinc[data2001$hhincp == 17] <- 17
  data2001$hhinc[data2001$hhincp == 18] <- 18
  data2001$hhinc[data2001$hhincp == 19] <- 19
  data2001$hhinc[data2001$hhincp == 20] <- 20
  data2001$hhinc[data2001$hhincp == 21] <- 22
  data2001$hhinc[data2001$hhincp == 22] <- 25
  data2001$hhinc[data2001$hhincp == 23] <- 27

data2001$weight <- data2001$weightp

data2001$marsth <- data2001$marstlp

data2001$pkids <- data2001$prescp

data2001$immstat <- data2001$immpopp

data2001$yrimm <- data2001$yrimmig



data2001$aboid[data2001$absrp==1] <- 6
data2001$aboid[data2001$absrp==2] <- 1
data2001$aboid[data2001$absrp==3] <- 2
data2001$aboid[data2001$absrp==4] <- 3
data2001$aboid[data2001$absrp==5] <- 4
data2001$aboid[data2001$absrp==6] <- 5


#dataM <- rbind.fill(data2011,data2006)
#dataM2 <- rbind.fill(dataM,data2001)
dataS <- rbind.fill(data2011,data2006,data2001)

dataS$Aboriginal[dataS$aboid==1 ] <- 1
dataS$Aboriginal[dataS$aboid==2 ] <- 1
dataS$Aboriginal[dataS$aboid==3 ] <- 1
dataS$Aboriginal[dataS$aboid==4 ] <- 1
dataS$Aboriginal[dataS$aboid==5 ] <- 1
dataS$Aboriginal[dataS$aboid==6 ] <- 0

dataST <- dataS[which(dataS$totinc < 8888888),]

length(dataS$totinc)
length(dataST$totinc)
summary(dataST)
write.csv(dataST,"/Users/heatherkrause/Desktop/Canada Data/Canada Census 2001 2006 2011.csv")

