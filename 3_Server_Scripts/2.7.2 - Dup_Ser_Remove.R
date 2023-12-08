########################################################################
############## Remove Duplicate Serials ################################
########################################################################
########################################################################

observeEvent(input$Ser_Dup,{
  
  if(!is.null(App_data$values$SERIAL)){
    
    # Checks if no. of unique serial != data row count
    if(nrow(App_data$values) != length(unique(App_data$values$SERIAL))){
      
      shinyalert("Duplicates contained in Serial", "Duplicates Removed", type = "success")
      
      # Remove Duplicate Serial variable and replace with row number
      App_data$values <- App_data$values %>%
        select(-SERIAL) %>%
        mutate(SERIAL = row_number()) %>%
        select(SERIAL,everything())
      
      # No Duplicate Serial - no data processing required
    } else{
      
      shinyalert("Serial Contains no duplicates", type = "error")
      
    }
    
  }
  
  
})

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################