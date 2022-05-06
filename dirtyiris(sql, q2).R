library(sqldf)
library(editrules)
library(dplyr)
dirtyiris<-read.csv(file = "dirty_iris.csv")
print(dirtyiris)
ruleset2<-editfile(file="rulesq2.txt")
plot(ruleset2)
viol2<-violatedEdits(ruleset2, dirtyiris)
summary(viol2)
plot(viol2)

boxplot(dirtyiris$Sepal.Length, horizontal = TRUE)
boxplot.stats(dirtyiris$Sepal.Length)

dirtyir2<-select(dirtyiris, -Species)
lapply(dirtyir2,  function(dirtyir2) sum(is.na(dirtyir2)))

na_per_row<-rowSums(is.na(dirtyiris))
comp<-0
for(i in na_per_row)
{
  if(i==0)
    comp<-comp+1
}
print(paste("No. of complete observations : ", comp, sep = ""), quote = FALSE)
percen<-(comp/(nrow(dirtyiris)))*100
paste("percentage of complete observations : ", percen, sep = "")

diris2<-select(dirtyiris, 1:4)
na.omit(diris2)
