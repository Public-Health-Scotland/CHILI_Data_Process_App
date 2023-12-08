########################################################################
########################################################################
########################################################################

server <- function(input, output, session) {
  
  
############################################################
# This is where the external scripts get uploaded for the server function for the different App tabs
############################################################
  
  # Home Section - there is no script required as the home section has no active functions.

############################################################
# File Upload, Data Processing Section and File Download
############################################################
  
  # File Upload Side Panel Script
  source(glue("3_Server_Scripts/2.1 - File_Upload.R"),  local = TRUE)$value
  
  # Input Date Analysis
  source(glue("3_Server_Scripts/2.2 - Date_Analysis.R"),  local = TRUE)$value
  
  # Initial Data Visualisation Script
  source(glue("3_Server_Scripts/2.3 - Pre_Process_Data_Visualisation.R"),  local = TRUE)$value
  
  # Variable Rename/Selection Script
  source(glue("3_Server_Scripts/2.4 - Data_Processing.R"),  local = TRUE)$value
  
  # Data Summary after processing Side Panel script
  source(glue("3_Server_Scripts/2.5 - Data_Summary_post_process.R"),  local = TRUE)$value

  # Post Processed Data Visualisation Script
  source(glue("3_Server_Scripts/2.6 - Post_Process_Data_Visualisation.R"),  local = TRUE)$value
  
  # Serial & CHI Number Summary
  source(glue("3_Server_Scripts/2.7 - Serial_CHI_Summaries.R"),  local = TRUE)$value
  
  # Possible Block Visualisation  Script
  source(glue("3_Server_Scripts/2.8 - Block_Visualisation.R"),  local = TRUE)$value

  # Post Processed Data Visualisation Script
  source(glue("3_Server_Scripts/2.9 - Load1_File_Download.R"),  local = TRUE)$value
  
############################################################
############################################################
  
  # Shut App when browser is closed
  session$onSessionEnded(stopApp)
  
}

########################################################################
########################################################################
########################################################################