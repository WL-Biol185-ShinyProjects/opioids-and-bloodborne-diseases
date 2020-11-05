# Load ggplot2
library(ggplot2)

# Basic piechart All Opioids 2017
ggplot(Overdoseage, aes(x = "", y = Age, fill = All2017)) +
  geom_bar(stat = "identity", width=1, color="white") +
  coord_polar("y", start = 0) +
  
  theme_void() # remove background, grid, numeric labels
