rm(list = ls())
library(nlme)
library(lattice)
library(car)
library(dplyr)
library(ggplot2)

data2011 <- read.csv("/Users/heatherkrause/Desktop/Canada Data/Canada NHS 2011.csv",na.strings = c("", " ", "NA", "."))
data2006 <- read.csv("/Users/heatherkrause/Desktop/Canada Data/Canada Census 2006.csv",na.strings = c("", " ", "NA", "."))
data2001 <- read.csv("/Users/heatherkrause/Desktop/Canada Data/Canada Census 2001.csv",na.strings = c("", " ", "NA", "."))

data2001$Year <- 2001
data2011$Year <- 2011
data2006$Year <- 2006

names(data2011)
summary(data2011$aboid)
tab(data2011$aboid)
xyplot(data2011$aboid~data2011$cma)

dataM <- rbind(data2011,data2006)
