########################################################################
############## Process Data download ###################################
########################################################################
########################################################################

### Download Processed Uploaded Data ----
output$downloadData <- downloadHandler(
  
############################################################
# Store Filename
############################################################

  filename = function(){
    
    paste0(input$upload)
    
  },
  
############################################################
# Allow download for different file types
############################################################

  content = function(fname){
    
    # Ensures that this only works when data is provided
    shiny::validate(
      need(App_data$values, "There is no input data")
    )
    
    # Data frame for download
    Final <- App_data$values 
    
##############################
# Final Data - csv input file
##############################
    
    if (input$upload$type == "text/csv") {
      
      # Download as .csv file
      write.csv(Final, fname, row.names = FALSE)
      
##############################
# Final Data - xlsx input file
##############################
      
    } else if (input$upload$type == "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
      
      # For writeing xlsx, data must be stored in dataframe ----
      Final <- as.data.frame(Final)
      
      # Download as .xlsx file
      write.xlsx(Final, fname, row.names = FALSE)
      
##############################
# Final Data - xls input file
##############################
      
    } else if (input$upload$type == "application/vnd.ms-excel") {
      
      # For writing xls, data must be stored in dataframe ----
      Final <- as.data.frame(Final)
      
      # Download as .xls file
      write.xlsx(Final, fname, row.names = FALSE)
      
##############################
# Final Data - other files (download as .csv file)
##############################
      
    } else {
      
      write.csv(Final, fname, row.names = FALSE)
      
    }

##############################
##############################
    
  }

############################################################
############################################################
  
)

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################