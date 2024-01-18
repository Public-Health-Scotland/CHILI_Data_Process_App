########################################################################
############## Finalise Data ###########################################
########################################################################
########################################################################


####################################################
# Process Non-Seeding Input ----
####################################################

if(input$NS_select == TRUE){
  
  App_data$values <- App_data$values %>%
    rowwise() %>%
    #Any missing variables from Indexer input list missing created and set to NA. 
    mutate(SERIAL = ifelse("SERIAL" %in% names(.), SERIAL, NA),
           CHI_NUMBER = ifelse("CHI_NUMBER" %in% names(.), CHI_NUMBER, NA)) %>%
    # Convert all NAs to "NULLs" for Indexer.
    mutate(across(everything(), ~ifelse(.x=='',NA,.x))) %>%
    mutate(across(everything(), ~tidyr::replace_na (as.character(.x),''))) %>%
    # Check variables are in the correct order for the Indexer
    select(SERIAL,CHI_NUMBER)

} else {
  
####################################################
# Data Processing ----
####################################################
  
  #Empty Column List
  Data_Columns$values <- NULL
  
  # Check for valid variable names and put in correct order.
  for (i in 1:length(valid_names)) {
    
    if(valid_names[i] %in% colnames(App_data$values)){
      
      # Add Variable name to list
      Data_Columns$values[i] <- valid_names[i]
      
    }
    
  }
  
  # Remove NA from list
  Data_Columns$values <- Data_Columns$values[!is.na(Data_Columns$values)]
  
  # Reorder Variables
  App_data$values <- App_data$values %>%
    select(Data_Columns$values)
  
  # Notification indicate that postcode has been processed
  Notification_Messages$values[4] <- "Variables Reordered"
  
  # Clear List
  Data_Columns$values <- NULL
  }

############################################################
############################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################