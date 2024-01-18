########################################################################
############## Add Serial Number #######################################
########################################################################
########################################################################

####################################################
# Adds Serial Number if one is not provided ----
####################################################

# This is for ensuring that Serial number can be stored for checks
Serial_Num <- reactiveValues(data=NULL)
    
    # Ensure that Serial number exists
    if (!is.null(App_data$values$SERIAL)){
      
        #Error Notification indicate that Serial Number has not been removed
      Notification_Messages$values[2] <- NA
      
        
      } else {
        

      #Notification indicating that Serial Number has been added.
        Notification_Messages$values[2] <- "Serial Added"
        
        
      # Add Serial - use row number
      App_data$values <- App_data$values %>%
        mutate(SERIAL = row_number()) %>%
        select(SERIAL,everything())
      
    }

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################