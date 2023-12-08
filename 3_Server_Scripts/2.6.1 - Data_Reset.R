########################################################################
############## Data Reset ##############################################
########################################################################
########################################################################

# Reset processed data to original state with button press ----
observeEvent(
  
  input$Data_Reset, {
    
    # Ensures that this only works when data is provided
    shiny::validate(
      need(data(), "There is no input data")
    )
    
    shinyalert("Input data reset to initial state.", type = "success")
    
    
    #Temp Data Storage ----
    isolate({
      
      App_data$values <- data() 
      
    })
    
    output$Serial_Duplicates <- NULL
    output$CHI_Duplicates <- NULL
    output$CHI_Validity <- NULL
    
  })
    
########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################