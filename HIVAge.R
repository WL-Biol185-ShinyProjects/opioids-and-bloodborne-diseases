# Basic piechart HIV Diagnoses 2017
ggplot(HIVAGE, aes(x = "" , y = Year_2017, fill = Age_Group)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  
  theme_void() +
  ggtitle("Distribution of HIV Diagnoses 
         in 2017 by Age Group")

# Basic piechart HIV Diagnoses 2018
ggplot(HIVAGE, aes(x = "" , y = Year_2018, fill = Age_Group)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  
  theme_void() +
  ggtitle("Distribution of HIV Diagnoses 
         in 2018 by Age Group")

