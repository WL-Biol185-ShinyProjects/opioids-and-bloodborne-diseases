library(ggplot2)

nep_vs_hiv_table <- read.table("num-needle-exchange-programs.txt", header = TRUE, sep = ",")

print(ggplot(nep_vs_hiv_table, aes(Number.of.Needle.Exchange.Programs, New.HIV.Cases.per.100000.People, color = Region)) + geom_point() + geom_smooth(method = lm, se = FALSE))





