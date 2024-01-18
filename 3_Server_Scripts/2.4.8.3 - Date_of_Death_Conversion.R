########################################################################
############## Convert DOD into ymd format #############################
########################################################################
########################################################################

####################################################
#Check if Date of Death is provided ----
####################################################

if(is.null(App_data$values$DATE_OF_DEATH)){
  
} else {
  
  App_data$values <- App_data$values %>%
    mutate(dmy = format(dmy(DATE_OF_DEATH), format = "%Y%m%d")) %>%
    mutate(mdy = format(mdy(DATE_OF_DEATH), format = "%Y%m%d")) %>%
    mutate(ymd = format(ymd(DATE_OF_DEATH), format = "%Y%m%d")) %>%
    mutate(ydm = format(ydm(DATE_OF_DEATH), format = "%Y%m%d")) %>%
    mutate(DATE_OF_DEATH = case_when(!is.na(dmy) & !is.na(mdy) & is.na(ymd) & is.na(ydm)  ~ dmy,
                                     !is.na(dmy) & is.na(mdy) & is.na(ymd) & is.na(ydm) ~ dmy,
                                     is.na(dmy) & !is.na(mdy) & is.na(ymd) & is.na(ydm) ~ mdy,
                                     is.na(dmy) & is.na(mdy) & !is.na(ymd) & !is.na(ydm) ~ ymd,
                                     is.na(dmy) & is.na(mdy) & !is.na(ymd) & is.na(ydm) ~ ymd,
                                     is.na(dmy) & is.na(mdy) & is.na(ymd) & !is.na(ydm) ~ ydm))
  
}

####################################################
####################################################

############################################################
############################################################