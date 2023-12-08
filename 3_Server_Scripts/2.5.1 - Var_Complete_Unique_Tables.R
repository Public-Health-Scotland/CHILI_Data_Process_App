########################################################################
############## Table Prep for completeness/uniqueness ##################
########################################################################
########################################################################

####################################################
# Table data initialisation
####################################################

output_data_comp_check <- reactiveValues(values = NULL)
output_data_unique_check <- reactiveValues(values = NULL)

####################################################
# Process Data Tables
####################################################

observe({
  
  if(!is.null(App_data$values)) {
    
    
    # Get initial data column names to bind to tables
    variable_names <-  data.frame(colnames(App_data$values)) %>%
      rename(`Variable Names` = `colnames.App_data.values.`)
    
    ##############################
    # Variable Completeness Check Table 
    ##############################
    
    output_data_comp_check$values <- data.frame((colSums(!is.na(App_data$values)) / nrow(App_data$values))*100) %>%
      rename(`Variable Completion Rate (%)` = `X.colSums..is.na.App_data.values...nrow.App_data.values.....100`) %>%
      cbind(variable_names) %>%
      mutate(`Number of missing Values per variable` = (nrow(App_data$values) - (`Variable Completion Rate (%)`/100)*nrow(App_data$values))) %>%
      mutate(`Variable Completion Rate (%)` = round(`Variable Completion Rate (%)`, digits = 2)) %>%
      select(`Variable Names`, `Number of missing Values per variable`,`Variable Completion Rate (%)`)
    
    ##############################
    # Variable Uniqueness Check Table
    ##############################
    
    output_data_unique_check$values <- data.frame(sapply(App_data$values, n_distinct)) %>%
      rename(`Number of unique Observations per variable` = `sapply.App_data.values..n_distinct.`) %>%
      cbind(variable_names) %>%
      mutate(`Variable Uniqueness (%)` = (`Number of unique Observations per variable`/nrow(App_data$values))*100) %>%
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