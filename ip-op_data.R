ihds2_names <- names(ihds2_hh)
head(ihds2_names)

library(rio)

export(ihds2_names, "variable_1.csv")

test1 <- "saurabh"
as.integer(test1)
as.numeric(test1)

export(as.data.frame(ihds2_names), "variable_2.csv")

ihds1_hh <- import("22626-0002-Data.rda")

ihds1_names <- names(ihds1_hh)

export(as.data.frame(ihds1_names), "variable_1.csv")

head(cbind(ihds1_names, ihds2_names))

intersect(ihds1_names, ihds2_names)

export(as.data.frame(setdiff(ihds2_names, ihds1_names)), "variable_2_diff.csv")

export(ihds1_hh, "hh1.rda") ##New Data
export(ihds2_hh, "hh2.rda") ##New Data

export(hhx[1,], "xnames.rda")
export(hhy[1,], "ynames.rda")

export(hh_long, "hh_long.rda")

export(hhx_small2, "hhx_small2.csv")
export(hhy_small2, "hhy_small2.csv")

export(hhx_small2, "hhx_small2.rda")
export(hhy_small2, "hhy_small2.rda")

export(hhy_small3, "hhy_small3.rda")

export(hh_long, "hh_long.rda")
export(hh_long2, "hh_long2.rda")

export(hh_long, "hh_long.csv")
export(hh_long2, "hh_long2.csv")

#Clean final
export(hhx_new, "hh1_new.rda")
export(hhy_new, "hh2_new.rda")

##Final long data!!!!!
library(rio)
export(hh_non, "hh_non_nrega.rda")
export(hh_nrega, "hh_nrega.rda")

#Dt 13/02/18
#Clean final with more variables and intact30k filtered data
export(hhx_new1, "hh_new1.rda")
export(hhy_new1, "hh_new2.rda")


##Final long data, but now previous hh_non and hh_nrega has 
#been replaced by new data with more obs (NAs are tackled)
library(rio)
export(hh_non, "hh_non_long.rda")
export(hh_nrega, "hh_nrega_long.rda")

##The Success data
export(success, "success.rda")
export(success, "success.csv")
export(hhx_new1, "hh_new1_1.rda")
export(hhy_new1, "hh_new2_1.rda")
hh_nrega <- success %>%
  filter(nrega == TRUE) %>%
  select(code, qty_success) %>%
  right_join(hh_nrega, by = 'code')
export(hh_nrega, "hh_nrega.rda")
export(hh_nrega, "hh_nrega2.rda")
export(hh_nrega3, "hh_nrega3.rda")
