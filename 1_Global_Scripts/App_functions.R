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
# Variable Completeness Table Function ----
####################################################

# Function to create completeness table
completeness_table <- function(CHILI_data) {
  
  total_rows <- nrow(CHILI_data) # number of records
  variable_names <- names(CHILI_data) # variable names
  num_complete <- complete.cases(CHILI_data) # Indicates completeness
  completeness <- sapply(CHILI_data, function(x) sum(!is.na(x))) # Number of non-NA values for each variable
  missingness <- total_rows - completeness
  percent_complete <- completeness / total_rows * 100 # percentage completeness
  
  # create completion table
  out <- data.frame(Variable = variable_names, Missingness  = missingness, Completeness = completeness, Percent_Complete = percent_complete) %>%
    mutate(Percent_Complete = round(Percent_Complete, digits = 2))
  
  # remove rownames as variable
  rownames(out) <- NULL
  
  # return output
  return(out)
}

####################################################
# Variable Uniqueness Table Function ----
####################################################

# Function to create completeness table
uniqueness_table <- function(CHILI_data) {
  
  total_rows <- nrow(CHILI_data) # number of records
  variable_names <- names(CHILI_data) # variable names
  uniqueness = sapply(CHILI_data, function(x) length(unique(x))) # Number of Unique Values
  percent_unique <- uniqueness / total_rows * 100 # percentage completeness
  
  # create completion table
  out <- data.frame(Variable = variable_names, Uniqueness = uniqueness, Percent_Uniqueness = percent_unique) %>%
    mutate(Percent_Uniqueness = round(Percent_Uniqueness, digits = 2))
  
  # remove rownames as variable
  rownames(out) <- NULL
  
  # return output
  return(out)
}

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################
