########################################################################
############## Table Prep for completeness/uniqueness ##################
########################################################################
########################################################################

####################################################
# Table data initialisation
####################################################

input_data_comp_check <- reactiveValues(values = NULL)
input_data_unique_check <- reactiveValues(values = NULL)

####################################################
# Process Data Tables
####################################################

observe({
  
  if(!is.null(App_data$values)) {
    

    # Get initial data column names to bind to tables
    variable_names <-  data.frame(colnames(data())) %>%
      rename(`Variable Names` = `colnames.data...`)
    
    ##############################
    # Variable Completeness Check Table 
    ##############################
    
    input_data_comp_check$values <- data.frame((colSums(!is.na(data())) / nrow(data()))*100) %>%
      rename(`Variable Completion Rate (%)` = `X.colSums..is.na.data.....nrow.data.......100`) %>%
      cbind(variable_names) %>%
      mutate(`Number of missing Values per variable` = (nrow(data()) - (`Variable Completion Rate (%)`/100)*nrow(data()))) %>%
      mutate(`Variable Completion Rate (%)` = round(`Variable Completion Rate (%)`, digits = 2)) %>%
      select(`Variable Names`, `Number of missing Values per variable`,`Variable Completion Rate (%)`)
    
    ##############################
    # Variable Uniqueness Check Table
    ##############################
    
    input_data_unique_check$values <- data.frame(sapply(data(), n_distinct)) %>%
      rename(`Number of unique Observations per variable` = `sapply.data....n_distinct.`) %>%
      cbind(variable_names) %>%
      mutate(`Variable Uniqueness (%)` = (`Number of unique Observations per variable`/nrow(data()))*100) %>%
      mutate(`Variable Uniqueness (%)` = round(`Variable Uniqueness (%)`, digits = 2)) %>%
      select(`Variable Names`, `Number of unique Observations per variable`,`Variable Uniqueness (%)`)
    
    ##############################
    ##############################
    
  }
  
})

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################