########################################################################
############## File Upload #############################################
########################################################################
########################################################################


####################################################
# Create empty vector to store column names
####################################################

dsnames <- c()

####################################################
# This is for the file upload
####################################################

# Reactive Statement to store input data
data <- reactive({
  
  # Store Input File
  inFile <- input$upload
  
  # Check if data is given
  req(inFile)
  
  # Ensures valid file Upload
  ext <- tools::file_ext(inFile$name)
  
  # Upload File
  switch(ext,
         csv = as_tibble(read.csv(input$upload$datapath, sep = ",",
                        quote = '"',na.strings = c("", " ", "NA"))),
         xlsx = read_excel(input$upload$datapath,
                           na = c("", " ", "NA")),
         xls = read_xls(input$upload$datapath,
                        na = c("", " ", "NA")),
         validate("Invalid file; Please upload a .csv or .xlsx/xls file")
         
         )
  
  })

####################################################
# This sets up the uploaded data for the App
####################################################

# Allows data to be stored as reactive values for processing
App_data <- reactiveValues(values=NULL)

# Uploaded Data
observe({

  App_data$values <- data()
  
})


####################################################
# Prepares tables for variable completeness and uniqueness
####################################################

source(glue("3_Server_Scripts/2.1.1 - Var_Complete_Unique_Tables.R"),  local = TRUE)$value

####################################################
# Table Visualisation
####################################################

source(glue("3_Server_Scripts/2.1.2 - Table_Visualisation.R"),  local = TRUE)$value

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################