########################################################################
############## Invalid CHI download ####################################
########################################################################
########################################################################

### Download Invalid CHI Data ----
output$downloadInvalidCHI <- downloadHandler(
  
############################################################
# Store Filename
############################################################
  
  filename = function(){
    
    paste0("invalid_chi.csv")
    
  },
  
############################################################
# Download of all invalid CHI number in dataset - separated from main dataset
############################################################

  content = function(fname){
    
    # Ensures that this only works when invalid CHI number dataset is provided
    shiny::validate(
      need(invalid_CHI$values, "There is no dataset containing invalid CHI numbers")
    )
    
    # Final Data
    incorrect_CHI <- invalid_CHI$values 
    write.csv(incorrect_CHI, fname, row.names = FALSE)
    
  }
  
)

############################################################
############################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################