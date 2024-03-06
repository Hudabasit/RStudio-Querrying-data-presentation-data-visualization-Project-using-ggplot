Querrying, data presentation, data visualization Project

Analysis of 2018 Olympic Figure Skating Scores
Dataset Source Link:  https://github.com/BuzzFeedNews/2018-02-olympic-figure-skating-analysis
I have taken Olympic Figure Skating 2018 analysis dataset and edited it to get better results for my project. This data has information about the countries that participated in Olympics, their ranks, the programs of figure skating, total segment, total element and total component scores. I have used ggplot2 for all my graphs.


1. 

data %>%
  ggplot(aes(x=rank, y=total_segment_score, color = nation)) + geom_point(size = 2) +
  labs(title = "Nation's rank and total segment score", y = "Total Segment Score", x = "Rank") +
  theme_bw()

I have used ggplot’s function geom_point to plot the points on the graph with point size 2, where X axis has Rank of Nation in program and Y axis has total segment score in program. While the color of point defines the Nation.

![image](https://github.com/Hudabasit/RStudio-Querrying-data-presentation-data-visualization-Project-using-ggplot/assets/134541252/b3ce938a-f5bd-4729-9db4-29914a49e660)

 

2.

data %>%
  ggplot(aes(x=rank, y=total_element_score, color = nation)) + geom_point(size = 2)+ 
  geom_line(colour = "red") + facet_wrap(~program) + theme_bw() +
  labs(title = "Total Element Score in relation to Rank", y = "Total Element Score", x = "Rank")

Here I have shown total element scores of each rank of nation in programs. I used geom_point to map points, and facet_wrap to classify the graph with each program.

![image](https://github.com/Hudabasit/RStudio-Querrying-data-presentation-data-visualization-Project-using-ggplot/assets/134541252/df569ff3-1956-42c2-9b44-aea62f04290c)
 


3.

data %>%
  ggplot(aes(x=rank, y=total_component_score, color = nation)) + geom_point(size = 2) + 
  geom_smooth(method = lm, se = F, color="grey") + facet_wrap(~program) + 
  labs(title = "Programs in Relation to Nation, their Rank, and Total Component number",
       y= "Total Component Number", x= "Rank") + theme_bw()

I have used geom_smooth function here with method set as linear, using facet_wrap and geom_point. This graph shows relation of Nation’s rank in a program with Total Component Number.

![image](https://github.com/Hudabasit/RStudio-Querrying-data-presentation-data-visualization-Project-using-ggplot/assets/134541252/34449ffa-036b-4a77-a460-a8b80d3ab04a)
 


4.

data %>%
  filter(nation == "FRA") %>%
  ggplot(aes(program, total_segment_score)) + 
  geom_point(alpha = 0.5, aes(size = rank, color = nation)) + theme_bw() +
  labs(title = "France Rank in Programs with Total Segment Score", y = "Total Segment Score", x = "Program")

I have used a filter here that only selects France readings in all programs in count of Total Segment Score

![image](https://github.com/Hudabasit/RStudio-Querrying-data-presentation-data-visualization-Project-using-ggplot/assets/134541252/24fd046b-ccf7-4bda-84df-425824a8e861)
 

5.

data %>%
  filter(nation != "JPN" & rank > 5) %>%
  ggplot(aes(program, total_component_score)) + geom_boxplot() +
  geom_point(alpha = 0.5, aes(size = rank, color = nation)) + theme_bw() +
  labs(title = "Rank > 5 and all nation component scores except Japan", y = "Total Component Score", x = "Program")

This is a boxplot of Total Component Score in relation to Nation’s Rank in each program. I have used a filter here through which all ranks > 5 are shown and Nation Japan is not included in graph.

![image](https://github.com/Hudabasit/RStudio-Querrying-data-presentation-data-visualization-Project-using-ggplot/assets/134541252/29d47e2e-763b-4039-8a75-8c27b71e83a5)
 

6.

data %>%
  ggplot(aes(total_element_score, rank)) + geom_boxplot() +
  geom_point(alpha = 0.5, aes(size = total_segment_score, color = nation)) + coord_flip() + theme_bw() + 
  facet_wrap(~program) + 
  labs(title = "Programs comparison with Nation Rank and Element score", x="Rank", y="Total Element Score")

I have made boxplot here of Nation’s rank and element score of each program, the size of dot represents Total Segment Score and color represents Nation. I used coord_flip to make boxplot horizontal for better visualization.

![image](https://github.com/Hudabasit/RStudio-Querrying-data-presentation-data-visualization-Project-using-ggplot/assets/134541252/ef6541eb-673e-4407-9be3-71917650d574)

 
7.

data %>%
  filter(nation == "JPN" | nation == "FRA") %>%
  ggplot(aes(nation)) + geom_bar(position = "dodge") + theme_classic() +
  labs(title = "Japan and France participation in Olympics")

This is a bar graph of participation of two nations in games, I have used filter here to specify nations in target and used geom_bar to make bar graph.

 
![image](https://github.com/Hudabasit/RStudio-Querrying-data-presentation-data-visualization-Project-using-ggplot/assets/134541252/71cb666e-0fb2-44c4-a2e0-7c47f0d212f5)






8.
data %>%
  ggplot(aes(total_element_score)) + geom_histogram(binwidth = 2, fill = "light blue") + facet_wrap(~program) + theme_classic() +
  labs(title = "Histogram of Total Element Scores", x="Total Element Scores")

This is histogram of Total Element Scores in each Program. I have used geom_histogram here.

 



![image](https://github.com/Hudabasit/RStudio-Querrying-data-presentation-data-visualization-Project-using-ggplot/assets/134541252/05aebb6b-de4c-4142-823f-a04abbe0b015)





9.
data %>%
  ggplot(aes(total_component_score)) + geom_density(color = "red") + facet_wrap(~program) + theme_bw() +
  labs(title = "Total Component Score Density", x = "Total Component Score")

This is a Density plot of Total Component Score in each program. I have used geom_density here to map density in graph. 

 

![image](https://github.com/Hudabasit/RStudio-Querrying-data-presentation-data-visualization-Project-using-ggplot/assets/134541252/42ae8776-af5c-435b-9961-90bc57fef734)






10.
data %>%
  ggplot(aes(x=rank, y=total_segment_score, color = starting_number)) + 
  geom_point(size = 2) + geom_line(size = 1)  + facet_wrap(~program) +
  labs(title = "Programs in Relation to Rank, and Segment Scores with starting no.", x = "Rank", 
       y ="Total Segment Score") + theme_bw()

This Scatter plot is made with color as numeric value. Graph shows starting number in color, also segment score and rank in Y and X axis.

 

![image](https://github.com/Hudabasit/RStudio-Querrying-data-presentation-data-visualization-Project-using-ggplot/assets/134541252/a0c2a446-7a75-450b-9e14-02e3f8c714f1)





11.
library(scatterplot3d)
if(require(scatterplot3d)) {
  s3d <- scatterplot3d(data[,c(7,6,9)],
                       type = "b", angle = 65, scale.y = 1, pch = 16)
  s3d$plane3d(data)
}
I have made a 3d model using scatterplot3d function. I have used 7 , 6,  9 column of my table in this, added data to s3d list and then print model using s3d$plane3d(data).
 
![image](https://github.com/Hudabasit/RStudio-Querrying-data-presentation-data-visualization-Project-using-ggplot/assets/134541252/e171ae4a-d00b-42f6-8242-023b0e2cc560)
