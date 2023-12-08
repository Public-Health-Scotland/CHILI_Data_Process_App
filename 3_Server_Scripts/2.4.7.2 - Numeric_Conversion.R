########################################################################
############## Convert to numeric variable #############################
########################################################################
########################################################################

# Check if Sex variable is given
if(!is.null(App_data$values$SEX)){
  
  # Convert Sex into numeric Variable ---- 
  App_data$values <- App_data$values %>%
    mutate(SEX = recode(SEX, "F" = 2,"M" = 1, "O" = 9))
  
  Notification_Messages$values[7] <- "Sex Processed"
  
  } else{
  
  # shinyalert("No Sex variable to process", type = "error")
  Notification_Messages$values[7] <- NA
  
  }

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################