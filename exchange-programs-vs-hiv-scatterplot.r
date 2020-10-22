library(ggplot2)

nep_vs_hiv_table <- read.table("num-needle-exchange-programs.txt", header = TRUE, sep = ",")

nep_vs_hiv_plot <- ggplot(nep_vs_hiv_table, aes(Number.of.Needle.Exchange.Programs, New.HIV.Cases.per.100000.People, color = Region)) + geom_point()




