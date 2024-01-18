########################################################################
############## Process CHI Number #####################################
########################################################################
########################################################################

####################################################
# Processes CHI number to ensure they contain leading zeros if nine digits in length ----
####################################################

# Check if CHI number variable is given
  if(is.null(App_data$values$CHI_NUMBER)){
    
    #Error Notification indicate that no CHI Number variable exists
    Notification_Messages$values[5] <- NA
    
  } else {
    
    # All nine digit CHIs given a leading zero
    App_data$values <- App_data$values %>%
      mutate(CHI_NUMBER = chi_pad(as.character(CHI_NUMBER)))
    
    # Notification indicate that CHI Number has been processed
    Notification_Messages$values[5] <- "CHIs Processed"
    
  }
  
####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################