nep_vs_heroin_table <- read.table("nep-vs-heroin-mortality.txt", header = TRUE)
print(ggplot(nep_vs_heroin_table, 
             aes(Number.NEP, Heroin.Overdoses, color = Region)) + geom_point())

