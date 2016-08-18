rm(list = ls())
library(nlme)
library(lattice)
library(car)
library(dplyr)
library(ggplot2)

data2011 <- read.csv("/Users/heatherkrause/Desktop/Canada Data/Canada NHS 2011.csv",na.strings = c("", " ", "NA", "."))
