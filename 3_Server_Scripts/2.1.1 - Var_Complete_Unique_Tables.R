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
    

    input_data_comp_check$values <- completeness_table(App_data$values)
    
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