library(data.table)
ihds2_mini <- fread("Book2.csv", sep = ",")
mini_names <- names(ihds2_mini)
arrange_mnames <- mini_names[order(mini_names)]

library(rio)

ihds2_hh <- import("36151-0002-Data.rda")
class(ihds2_hh)
dim(ihds2_hh)



full_names2 <- names(ihds2_hh)
full_names2
arrange_mnames <- full_names2[order(full_names2)]
arrange_mnames


village_1 <- import("22626-0007-Data.tsv")
dim(village_1)
str(village_1)

ihds1_village <- names(village_1)
ihds1_village
arrange_vnames <- ihds1_village[order(ihds1_village)]
arrange_vnames
class(village_1)
psuid <- unique(village_1$psuid)
length(psuid)

##Unique District

unique(ihds2_hh$DISTID)

stateid <- unique(ihds2_hh$STATEID)
class(stateid)
#gsub("\\([0-9]\\)", "", stateid)
#\\& [A-Z|a-z] |[A-Z|a-z]\\+[A-Z|a-z]

gsub(".*[a-z|A-Z]\\s", "", stateid) #Testing with variable

ihds2_hh$STATEID <- gsub(".*[a-z|A-Z]\\s", "", ihds2_hh$STATEID) 
#Removing unneccessary charcters

head(ihds2_hh$STATEID)
ihds2_hh$STATEID <- as.factor(ihds2_hh$STATEID) #Coercing it back to factors
class(ihds2_hh$STATEID)

state_ref <- stateid  
state_ref

##SURVEY variable looks fishy
unique(ihds2_hh$SURVEY)

length(ihds2_hh$SURVEY == "(2) IHDS-II 2")

summary(ihds2_hh$SURVEY)

##Unnecessary Extra factor level when it is not present at all
##ACTION: Need to eliminate empty level and coerce this variable to Just "2"
head(ihds2_hh$SURVEY)

#Count
table(ihds2_hh$STATEID)
#Least amount of districts in States: 04, 25, 26, 14

set2 <- subset(ihds2_hh, STATEID %in% c("02", "03", "08", "21", "28"))
head(set2)

table(st = set2$STATEID, dst = set2$DISTID)
summary(set2$DISTID)
summary(ihds2_hh$DISTID)
