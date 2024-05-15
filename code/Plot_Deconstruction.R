#set working directory
setwd("~/Documents")
#read in data
data <- read.delim("data.txt")
data

str(data)

data$gear <- factor(data$gear)
data$scenario <- factor(data$scenario)

library(tidyverse)

#making the graph better
p <- ggplot(data, aes(x=scenario, y=hours, width=.8)) + 
  geom_bar(aes(fill=gear), position=position_dodge(width = 0.9), stat="identity") +
  geom_errorbar(aes(group = gear, x=scenario, ymin=hours-SE, ymax=hours+SE), position=position_dodge(width = 0.9), stat="identity", width=0.2, colour="grey50", alpha=0.9) +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),
          legend.box.margin = margin(6, 6, 6, 6)) +
  scale_fill_manual(values = c("paleturquoise", "lightsalmon"))+
  scale_color_manual(values =c ("black", "black"))+
  xlab("Scenario") +
  ylab("Hours at sea")

p + labs(fill = "Gear-type")

