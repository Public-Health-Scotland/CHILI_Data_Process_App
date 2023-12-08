########################################################################
############## Duplicate CHI download ##################################
########################################################################
########################################################################

### Download Duplicate CHI Data ----
output$downloadDuplicateCHI <- downloadHandler(
  
############################################################
# Store Filename
############################################################
  
  filename = function(){
    
    paste0("duplicate_chi.csv")
    
  },
  
############################################################
# Download of  duplicate CHI numbers in dataset - separated from main dataset
############################################################  

content = function(fname){
    
  # Ensures that this only works when duplicate CHI number dataset is provided
    shiny::validate(
      need(duplicate_CHI$values, "There is no dataset containing duplicate CHI numbers")
    )
    
    # Final Data
    CHI_Duplicates <- duplicate_CHI$values
    write.csv(CHI_Duplicates, fname, row.names = FALSE)
    
  }
  
)

############################################################
############################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################