########################################################################
############## Process Postcode Variable ###############################
########################################################################
########################################################################

####################################################
# Format Postcode in pc7 format
####################################################

# Check if postcode variable is given
  if(is.null(App_data$values$POSTCODE)){
    
    #Error Notification indicate that no postcode exists
    Notification_Messages$values[9] <- NA
    
    } else {
      
      # Convert postcodes into PC7 format
      # If postcode is given in partial format, keep value
      App_data$values <- App_data$values %>% 
      mutate(POSTCODE = toupper(POSTCODE)) %>%
      mutate(POSTCODE1 = postcode(POSTCODE, "pc7")) %>%
      mutate(POSTCODE2 = ifelse(is.na(POSTCODE1), POSTCODE, POSTCODE1)) %>%
      select(-POSTCODE,-POSTCODE1) %>%
      rename(POSTCODE = POSTCODE2)

    Notification_Messages$values[9] <- "Postcode Processed"
    
    }
  
####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################