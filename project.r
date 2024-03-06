getwd()

data <- read.csv("olympics.csv", header = TRUE, sep = ",")
install.packages("tidyverse")
library(tidyverse)
library(ggplot2)

#1.
data %>%
  ggplot(aes(x=rank, y=total_segment_score, color = nation)) + geom_point(size = 2) +
  labs(title = "Nation's rank and total segment score", y = "Total Segment Score", x = "Rank") +
  theme_bw()

#2.
data %>%
  ggplot(aes(x=rank, y=total_element_score, color = nation)) + geom_point(size = 2)+ 
  geom_line(colour = "red") + facet_wrap(~program) + theme_bw() +
  labs(title = "Total Element Score in relation to Rank", y = "Total Element Score", x = "Rank")

#3.
data %>%
  ggplot(aes(x=rank, y=total_component_score, color = nation)) + geom_point(size = 2) + 
  geom_smooth(method = lm, se = F, color="grey") + facet_wrap(~program) + 
  labs(title = "Programs in Relation to Nation, their Rank, and Total Component number",
       y= "Total Component Number", x= "Rank") + theme_bw()

#4.
data %>%
  filter(nation == "FRA") %>%
  ggplot(aes(program, total_segment_score)) + 
  geom_point(alpha = 0.5, aes(size = rank, color = nation)) + theme_bw() +
  labs(title = "France Rank in Programs with Total Segment Score", y = "Total Segment Score", x = "Program")

#5.
data %>%
  filter(nation != "JPN" & rank > 5) %>%
  ggplot(aes(program, total_component_score)) + geom_boxplot() +
  geom_point(alpha = 0.5, aes(size = rank, color = nation)) + theme_bw() +
  labs(title = "Rank > 5 and all nation component scores except Japan", y = "Total Component Score", x = "Program")

#6.
data %>%
  ggplot(aes(total_element_score, rank)) + geom_boxplot() +
  geom_point(alpha = 0.5, aes(size = total_segment_score, color = nation)) + coord_flip() + theme_bw() + 
  facet_wrap(~program) + 
  labs(title = "Programs comparison with Nation Rank and Element score", y="Rank", x="Total Element Score")

#7.
data %>%
  filter(nation == "JPN" | nation == "FRA") %>%
  ggplot(aes(nation)) + geom_bar(position = "dodge") + theme_classic() +
  labs(title = "Japan and France participation in Olympics")

#8.
data %>%
  ggplot(aes(total_element_score)) + geom_histogram(binwidth = 2, fill = "light blue") + facet_wrap(~program) + theme_classic() +
  labs(title = "Histogram of Total Element Scores", x="Total Element Scores")

#9.
data %>%
  ggplot(aes(total_component_score)) + geom_density(color = "red") + facet_wrap(~program) + theme_bw() +
  labs(title = "Total Component Score Density", x = "Total Component Score")

#10.
data %>%
  ggplot(aes(x=rank, y=total_segment_score, color = starting_number)) + 
  geom_point(size = 2) + geom_line(size = 1)  + facet_wrap(~program) +
  labs(title = "Programs in Relation to Rank, and Segment Scores with starting no.", x = "Rank", 
       y ="Total Segment Score") + theme_bw()

#11.
install.packages("scatterplot3d")
library(scatterplot3d)
if(require(scatterplot3d)) {
  s3d <- scatterplot3d(data[,c(7,6,9)],
                       type = "b", angle = 65, scale.y = 1, pch = 16)
  s3d$plane3d(data)
}

