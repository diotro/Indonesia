# CrossVA & openVA

## Tells R where to find Java
Sys.setenv("JAVA_HOME" = "C:/Program Files/Java/jdk-11.0.1")

## syntax for installing packages
install.packages(c("openVA", "wash_the_dishes"))

## look at help file for InSilicoVA package
help(package = "InSilicoVA")

## load InSilicoVA package
library(InSilicoVA)

help(package = "InterVA5")

# Load data from InterVA5 package
data(probbaseV5) ## SCI for InterVA5 & InSilicoVA
data(RandomVA5)  ## an example WHO 2016 data.frame

## Sensitivity Analysis
library(openVA)
dim(RandomVA5)

#### results for all 200 deaths
results200 <- codeVA(data = RandomVA5,
                     data.type = "WHO2016",
                     model = "InSilicoVA")
results180 <- codeVA(data = RandomVA5[1:180,],
                     data.type = "WHO2016",
                     model = "InSilicoVA")

## Create new data without columns 2, 3, 4, 5, & 9
newData <- RandomVA5[ , -c(2, 3, 4, 5, 9)]

## replace ID column with integers 1:200
dim(newData)
newData$ID
newData$ID <- 1:200
newData$ID