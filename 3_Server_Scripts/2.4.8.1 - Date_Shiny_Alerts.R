########################################################################
############## Shiny Alert #############################################
########################################################################
########################################################################

####################################################
# Shiny Alert for no DOB or DOD
####################################################

if(is.null(App_data$values$DATE_OF_BIRTH) & is.null(App_data$values$DATE_OF_DEATH)) {
  
  # shinyalert("No Date of Birth or Date of Death provided", type = "error")
  Notification_Messages$values[8] <- NA
  
####################################################
# Shiny Alert for no DOB and when DOD is given
####################################################
  
} else if(!is.null(App_data$values$DATE_OF_BIRTH) & is.null(App_data$values$DATE_OF_DEATH)) {
  
  # shinyalert("Date of Birth now in ymd format", type = "success")
  Notification_Messages$values[8] <- "Date of Birth Converted into ymd"
  
####################################################
# Shiny Alert for no DOD and when DOB is given
####################################################
  
} else if(!is.null(App_data$values$DATE_OF_BIRTH) & !is.null(App_data$values$DATE_OF_DEATH)) {
  
  # shinyalert("Date of Death now in ymd format", type = "success")
  Notification_Messages$values[8] <- "Date of Death Converted into ymd"
  
####################################################
# Shiny Alert for when both DOB and DOD is given
####################################################
  
} else {
  
  # shinyalert("Both Date of Birth & Date of Death now in ymd format", type = "success")
  Notification_Messages$values[8] <- "Date of Birth & Date of Death Converted into ymd"
  
  
}

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################