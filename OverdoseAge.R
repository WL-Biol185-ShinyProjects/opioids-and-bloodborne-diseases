# Load ggplot2
library(ggplot2)

# Basic piechart All Opioids 2017
ggplot(Overdoseage, aes(x = "" , y = All2017, fill = Age)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  
  theme_void() +
  ggtitle("Distribution of All Opioid Mortalities 
         in 2017 by Age Group")

# Basic piechart All Opioids 2018
ggplot(Overdoseage, aes(x = "" , y = All2018, fill = Age)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  
  theme_void() +
  ggtitle("Distribution of All Opioid Mortalities 
         in 2018 by Age Group")

# Basic piechart Prescription Opioids 2017
ggplot(Overdoseage, aes(x = "" , y = Prescription2017, fill = Age)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  
  theme_void() +
  ggtitle("Distribution of Prescription Opioid Mortalities 
         in 2017 by Age Group")

# Basic piechart Prescription Opioids 2018
ggplot(Overdoseage, aes(x = "" , y = Prescription2018, fill = Age)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  
  theme_void() +
  ggtitle("Distribution of Prescription Opioid Mortalities 
         in 2018 by Age Group")

# Basic piechart Heroin 2017
ggplot(Overdoseage, aes(x = "" , y = Heroin2017, fill = Age)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  
  theme_void() +
  ggtitle("Distribution of Heroin Mortalities 
         in 2017 by Age Group")

# Basic piechart Heroin 2018
ggplot(Overdoseage, aes(x = "" , y = Heroin2018, fill = Age)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  
  theme_void() +
  ggtitle("Distribution of Heroin Mortalities 
         in 2018 by Age Group")

# Basic piechart Synthetic 2017
ggplot(Overdoseage, aes(x = "" , y = Synthetic2017, fill = Age)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  
  theme_void() +
  ggtitle("Distribution of Synthetic Opioid Mortalities 
         in 2017 by Age Group")

# Basic piechart Synthetic 2018
ggplot(Overdoseage, aes(x = "" , y = Synthetic2018, fill = Age)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  
  theme_void() +
  ggtitle("Distribution of Synthetic Opioid Mortalities 
         in 2018 by Age Group")
