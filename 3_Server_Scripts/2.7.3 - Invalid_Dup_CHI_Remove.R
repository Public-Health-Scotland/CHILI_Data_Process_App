########################################################################
############## Remove invalid & Duplicate CHIs #########################
########################################################################
########################################################################

# Initilise Datasets
invalid_CHI <- reactiveValues(values=NULL)
duplicate_CHI <- reactiveValues(values=NULL)


####################################################
# Removes invalid and duplicate CHI
####################################################

observeEvent(input$CHI_Rem,{
  
  # suppress warnings
  options (warn = - 1) 
  
  # Ensures that the CHI Number is available
  if(!is.null(App_data$values$CHI_NUMBER)){
    
    ##############################
    # Remove invalid CHI numbers
    ##############################
    
    if(input$NS_select == TRUE){
      
      # Stores Invalid CHI Numbers
      invalid_CHI$values <- App_data$values %>%
        mutate(CHI_Valid = chi_check(CHI_NUMBER))%>%
        filter(CHI_Valid != "Valid CHI") %>%
        select(SERIAL,CHI_NUMBER,CHI_Valid)
      
      # Removal invalid CHIs
      App_data$values <- App_data$values %>%
        filter(CHI_NUMBER %notin% invalid_CHI$values$CHI_NUMBER)
      
      # Checks if CHIs have been removed
      if(nrow(invalid_CHI$values) != 0){
        
        #Notification indicating CHI removal
        shinyalert("Invalid CHIs Removed", type = "success")
        
        } else {
        
        #Notification indicating no Invalid CHIs
        shinyalert("No invalid CHIs Removed", type = "success")
          
          }
      
      ##############################
      # Remove duplicate CHI numbers
      ##############################
      
      # Duplicate Storage Dataframe
      duplicate_CHI$values <- App_data$values
      
      # Remove Duplicates
      App_data$values <- App_data$values %>%
        distinct(CHI_NUMBER, .keep_all = TRUE)
      
      # Store Duplicates
      duplicate_CHI$values <- duplicate_CHI$values %>%
        filter(SERIAL %notin% App_data$values$SERIAL)
      
      # Checks if CHIs have been removed
      if(nrow(duplicate_CHI$values != 0)){
        
        #Notification indicating CHI removal
        shinyalert("Duplicate CHIs Removed", type = "success")
        
        } else {
        
        #Notification indicating no Invalid CHIs
        shinyalert("No Duplicate CHIs Removed", type = "success")
          
          }
      
      ##############################
      ##############################
      
      } else {
      
      ##############################
      # NS option not selected - no CHIs removed
      ##############################
      
      #Notification indicating NS option must be selected for CHI removal
      shinyalert("For CHI removal, select non-seeding option", type = "error")
      
      App_data$values <- App_data$values
      
      invalid_CHI$values <- NULL
      duplicate_CHI$values <- NULL
      
      }
    
    ##############################
    # No CHI numbers given
    ##############################
    
    } else {
    
    shinyalert("No CHI Numbers given", type = "error")
      
    }
  
  }
  
  )

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################