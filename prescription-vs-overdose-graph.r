prescrip_vs_overdose_table <- read.table("prescription-vs-overdose.txt", header = TRUE)
print(ggplot(prescrip_vs_overdose_table, aes(Prescription.Rate.Per.100.People, Opioid.Overdoses, color = Region)) + geom_point())
