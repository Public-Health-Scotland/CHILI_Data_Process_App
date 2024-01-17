########################################################################
############## Data Visualisation - Possible Blocks ####################
########################################################################
########################################################################

# Press button for block check
observeEvent(input$blk_chk,{
  
  # Check if data exists and has Serial Number
  if(!is.null(App_data$values$SERIAL)) {
    
    # Dataset with block details for each record
    block_data$values <- App_data$values
    
###################################################
# Exact Block Check ----
###################################################
    
    source(glue("3_Server_Scripts/2.8.1.1 - Exact Match Block.R"),  local = TRUE)$value

###################################################
# Block A Check ----
###################################################

    source(glue("3_Server_Scripts/2.8.1.2 - Block_A.R"),  local = TRUE)$value
    
###################################################
# Block B Check ----
###################################################
    
    source(glue("3_Server_Scripts/2.8.1.3 - Block_B.R"),  local = TRUE)$value
    
###################################################
# Block C Check ----
###################################################
    
    source(glue("3_Server_Scripts/2.8.1.4 - Block_C.R"),  local = TRUE)$value
    
###################################################
# Block Table Creation ----
###################################################
    
    source(glue("3_Server_Scripts/2.8.1.5 - Block_Table_Setup.R"),  local = TRUE)$value
    
###################################################
# Block Check Notification Message ----
###################################################
    
    shinyalert("Block Checks made", type = "success")
    
###################################################
# Notification Message indicating data processing hasn't occured ----
###################################################
    
  } else {
    
    shinyalert("Data hasn't been processed", "Please process Data", type = "error")
    
  }
  
###################################################
###################################################
  
})


########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################