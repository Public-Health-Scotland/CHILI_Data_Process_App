########################################################################
############## Invalid Variable Removal ################################
########################################################################
########################################################################

####################################################
# This removes variables that can't be used in indexer.
####################################################
    
    # All invalid names renamed to "rename"
    for (i in 1:length(App_data$values)) {
      
      # Checks if name is in list of valid names
      if(colnames(App_data$values[i]) %notin% valid_names) {
        
        # All invalid names are called rename
        colnames(App_data$values)[colnames(App_data$values) == colnames(App_data$values[i])] <- "RENAME"
        
      }
      
      }
    
    # Checks if invalid column names exist
    if(is.null(App_data$values$RENAME)){
      
      # Error Notification indicating that all column names are valid
      Notification_Messages$values[3] <- NA
      
      } else {
      
      # Error Notification indicating that invalid column names have been removed
      Notification_Messages$values[3] <- "Invalid Variables Removed"
      
      # Removes all invalid column names
      App_data$values <- App_data$values %>%
        select(-RENAME)
      
      }
    
####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################
  
