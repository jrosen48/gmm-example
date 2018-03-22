library(MplusAutomation)
library(tidyverse)

d <- read_csv("gmm-ex.csv")

# mydat <- read.table("http://statmodel.com/usersguide/chap8/ex8.2.dat", header = FALSE)[,-6]
createMixtures(classes = 1:3, filename_stem = "ex8.2",
               model_overall = "i s | t1@0 t2@1 t3@2 t4@3 t5@4;  i s on t6;",
               rdata = d,
               OUTPUT = "tech11 tech14;", usevariables = paste0("t", 1:6))
runModels(replaceOutfile = "modifiedDate")
mplus_output <- readModels(filefilter = "ex8.2")
plotGrowthMixtures(mplus_output, estimated = TRUE, rawdata = FALSE)

dd <- mplus_output[[2]]$savedata