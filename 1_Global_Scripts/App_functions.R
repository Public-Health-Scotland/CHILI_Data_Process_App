########################################################################
############## App Functions ###########################################
########################################################################
########################################################################

####################################################
# Not in function
####################################################

`%notin%` <- Negate(`%in%`)

####################################################
# New Datatable Function - ensures consistency of tables within App
####################################################

# Renders data table for App data
Table_Render <- function(dataset,cb){
  
  output_data <- datatable(data = dataset,
                     escape = FALSE,
                     rownames = FALSE,
                     class="compact stripe hover",
                     selection = 'none',
                     options = list(
                       rowsGroup = list(0),
                       drawCallback =  cb,
                       columnDefs = list(
                         list(className = 'dt-center', targets = "_all")
                       ),
                       pageLength = 10,
                       dom = 'Bfrtip'
                     ))%>%
    spk_add_deps()
  
  return(output_data)
  
}

####################################################
# New SelectBox Update Function - updates all selectboxes with variable names
####################################################

# Updates selectbox to include all variable names of App data
SelectBox_Update <- function(CHILI_data){
  
  # Check if data is given ----
  req(CHILI_data)
  
  # Extracts Column Names
  dsnames <- names(CHILI_data) 

  # Select column names as options for checkbox ----
  cb_options <- list()
  cb_options[1] <- " "
  cb_options[ dsnames] <- dsnames
  
  return(cb_options)
  
}

####################################################
# Function to create completeness table
####################################################

# Function to create completeness table
completeness_table <- function(df) {
  
  total_rows <- nrow(df) # number of records
  variable_names <- names(df) # variable names
  num_complete <- complete.cases(df) # Indicates completeness
  completeness <- sapply(df, function(x) sum(!is.na(x))) # Number of non-NA values for each variable
  percent_complete <- completeness / total_rows * 100 # percentage completeness
  
  # create completion table
  out <- data.frame(Variable = variable_names, Completeness = completeness, Percent_Complete = percent_complete) %>%
    mutate(Percent_Complete = round(Percent_Complete, digits = 2))
  
  # remove rownames as variable
  rownames(out) <- NULL
  
  # return output
  return(out)
}

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################
