#set working directory
setwd("~/Documents")
#read in data extracted from original graph
shark <- read.delim("Shark.txt")
shark

str(shark)

library(tidyverse)
