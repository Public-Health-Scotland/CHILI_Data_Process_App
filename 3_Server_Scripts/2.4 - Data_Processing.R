########################################################################
############## Data Processing #########################################
########################################################################
########################################################################

####################################################
# This updates variable select options for Renaming
####################################################

# Ensures that data is available
observe({
  
  shiny::validate(
    need(App_data$values, "There is no Data provided")
  )
  
  ##############################
  # Generates UIs if checkboxes are ticked
  ##############################
  
  source(glue("3_Server_Scripts/2.4.1 - UI Name Generation.R"),  local = TRUE)$value
  
  ##############################
  ##############################
  })

####################################################
# Data Process
####################################################

# Allows data to be stored as reactive values for column reorder
Data_Columns <- reactiveValues(values=NULL)

# Allows notification text to be stored for final message
Notification_Messages <- reactiveValues(values=NULL)

observeEvent(input$process,{
  
  ##############################
  #Rename Variables
  ##############################
  
  source(glue("3_Server_Scripts/2.4.2 - Renaming.R"),  local = TRUE)$value
  
  ##############################
  # Check for Serial Number
  ##############################
  
  source(glue("3_Server_Scripts/2.4.3 - Add_Serial.R"),  local = TRUE)$value

  ##############################
  # Remove invalid column headers if given
  ##############################
  
  source(glue("3_Server_Scripts/2.4.4 - Invalid_Variable_Remove.R"),  local = TRUE)$value

  ##############################
  # Add leading zero to CHI Number if not added
  ##############################
  
  source(glue("3_Server_Scripts/2.4.5 - CHI_Number_Processing.R"),  local = TRUE)$value
  
  ##############################
  # Clean all given name variables
  ##############################
  
  source(glue("3_Server_Scripts/2.4.6 - Name_Cleaning.R"),  local = TRUE)$value
  
  ##############################
  # Process Sex Variable
  ##############################
  
  source(glue("3_Server_Scripts/2.4.7 - Sex_Processing.R"),  local = TRUE)$value
  
  ##############################
  # Process Dates
  ##############################
  
  source(glue("3_Server_Scripts/2.4.8 - Date_Processing.R"),  local = TRUE)$value
  
  ##############################
  # Process Postcodes
  ##############################
  
  source(glue("3_Server_Scripts/2.4.9 - Postcode_Processing.R"),  local = TRUE)$value
  
  ##############################
  # Process Addresses
  ##############################
  
  source(glue("3_Server_Scripts/2.4.10 - Address_Processing.R"),  local = TRUE)$value
  
  ##############################
  # Finalise Data
  ##############################
  
  source(glue("3_Server_Scripts/2.4.11 - Finalise Data.R"),  local = TRUE)$value
  
  ##############################
  # Notification Message Setup
  ##############################
  
  source(glue("3_Server_Scripts/2.4.12 - Data_Processing_Notification_Message.R"),  local = TRUE)$value

  ##############################
  ##############################
  
})


####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################
