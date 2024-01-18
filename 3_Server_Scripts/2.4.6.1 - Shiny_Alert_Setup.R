########################################################################
############## Shiny Alert Setup #######################################
########################################################################
########################################################################

####################################################
# Clean all Name Variables ----
####################################################

if(!is.null(App_data$values$SURNAME) & !is.null(App_data$values$PREVIOUS_SURNAME) 
   & !is.null(App_data$values$FIRST_FORENAME) & !is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# Clean all Name Variables apart from Previous Surname ----
####################################################
  
} else if(!is.null(App_data$values$SURNAME) & is.null(App_data$values$PREVIOUS_SURNAME) 
          & !is.null(App_data$values$FIRST_FORENAME) & !is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# Clean all Name Variables apart from 2nd Forename ----
####################################################
  
} else if(!is.null(App_data$values$SURNAME) & !is.null(App_data$values$PREVIOUS_SURNAME) 
          & !is.null(App_data$values$FIRST_FORENAME) & is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# Clean all Name Variables apart from 1st Forename ----
####################################################
  
} else if(!is.null(App_data$values$SURNAME) & !is.null(App_data$values$PREVIOUS_SURNAME) 
          & is.null(App_data$values$FIRST_FORENAME) & !is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# Clean all Name Variables apart from Surname ----
####################################################
  
} else if(is.null(App_data$values$SURNAME) & !is.null(App_data$values$PREVIOUS_SURNAME) 
          & !is.null(App_data$values$FIRST_FORENAME) & !is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# Clean both forenames when no surname is provided ----
####################################################
  
} else if(is.null(App_data$values$SURNAME) & is.null(App_data$values$PREVIOUS_SURNAME) 
          & !is.null(App_data$values$FIRST_FORENAME) & !is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# Clean both surnames when no forenames is provided ----
####################################################
  
} else if(!is.null(App_data$values$SURNAME) & !is.null(App_data$values$PREVIOUS_SURNAME) 
          & is.null(App_data$values$FIRST_FORENAME) & is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# Clean both 1st Forename and Surname ----
####################################################
  
} else if(!is.null(App_data$values$SURNAME) & is.null(App_data$values$PREVIOUS_SURNAME) 
          & !is.null(App_data$values$FIRST_FORENAME) & is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# Clean both 1st Forename and Previous Surname ----
####################################################
  
} else if(is.null(App_data$values$SURNAME) & !is.null(App_data$values$PREVIOUS_SURNAME) 
          & !is.null(App_data$values$FIRST_FORENAME) & is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# Clean both 2nd Forename and Surname ----
####################################################
  
} else if(!is.null(App_data$values$SURNAME) & is.null(App_data$values$PREVIOUS_SURNAME) 
          & is.null(App_data$values$FIRST_FORENAME) & !is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# Clean both 2nd Forename and Previous Surname ----
####################################################
  
} else if(is.null(App_data$values$SURNAME) & !is.null(App_data$values$PREVIOUS_SURNAME) 
          & is.null(App_data$values$FIRST_FORENAME) & !is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# Clean 1st Forename ----
####################################################
  
} else if(is.null(App_data$values$SURNAME) & is.null(App_data$values$PREVIOUS_SURNAME) 
          & !is.null(App_data$values$FIRST_FORENAME) & is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# Clean 2nd Forename ----
####################################################
  
} else if(is.null(App_data$values$SURNAME) & is.null(App_data$values$PREVIOUS_SURNAME) 
          & is.null(App_data$values$FIRST_FORENAME) & !is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# Clean Surname ----
####################################################
  
} else if(!is.null(App_data$values$SURNAME) & is.null(App_data$values$PREVIOUS_SURNAME) 
          & is.null(App_data$values$FIRST_FORENAME) & is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# Clean Previous Surname ----
####################################################
  
} else if(is.null(App_data$values$SURNAME) & !is.null(App_data$values$PREVIOUS_SURNAME) 
          & is.null(App_data$values$FIRST_FORENAME) & is.null(App_data$values$SECOND_FORENAME)) {
  
  Notification_Messages$values[6] <- "Names Cleaned"
  
####################################################
# No Names Given ----
####################################################
  
} else {
  
  Notification_Messages$values[6] <- NA
  
}

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################