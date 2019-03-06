## print working directory
getwd()
dir()

## load the writeData() and writeTable() functions
source("writeData.R")

## load openVA and example data
library(openVA)
data(RandomVA5)

## run InSilicoVA
results <- codeVA(RandomVA5, data.type = "WHO2016")

## create plot of CSMF and save as PDF file called cmsf_plot.pdf
pdf("cmsf_plots.pdf")
plotVA(results)
dev.off()

## create CSV file called individual_results.csv with (top 3) assigned COD and data
writeData(openVA_obj = results, odk_data = RandomVA5, top = 3, file_name = "individual_results.csv")

## create CSV file called cmsf.csv with cause-specific mortality fraction for top 10 causes
writeTable(openVA_obj = results, top = 10, file_name = "csmf.csv")
