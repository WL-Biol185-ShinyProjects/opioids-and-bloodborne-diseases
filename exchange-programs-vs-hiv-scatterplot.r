library(ggplot2)

nep_vs_hiv <- read.table("num-needle-exchange-programs.txt", header = TRUE)

print(ggplot(nep_vs_hiv, aes(NEP, HIV, color = Region)) + geom_point())




