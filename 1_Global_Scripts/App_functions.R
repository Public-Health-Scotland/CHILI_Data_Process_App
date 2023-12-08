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
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################
