########################################################################
############## Block C Check ##########################################
########################################################################
########################################################################

###################################################
# DOB Check ----
###################################################

# If DOB present in record, potential match may be found in Block C.
if(!is.null(App_data$values$DATE_OF_BIRTH)) {
  
  block_data$values <- block_data$values %>%
    mutate(Block_Type_C = ifelse(!is.na(DATE_OF_BIRTH) & (!is.na(SURNAME) | !is.na(FIRST_FORENAME) | !is.na(SEX))
                                 & is.na(Block_Type), "Possible Block C Match", NA)) %>%
    mutate(Block_Type = ifelse(is.na(Block_Type) & !is.na(Block_Type_C),Block_Type_C,Block_Type)) %>%
    select(-Block_Type_C)
  
###################################################
# CHI Number Check ----
###################################################
  
  # If CHI present in record, potential match may be found in Block C.
} else if(!is.null(App_data$values$CHI_NUMBER)) {
  
  block_data$values <- block_data$values %>%
    mutate(CHI_Valid = chi_check(chi_pad(as.character(CHI_NUMBER)))) %>%
    mutate(Block_Type_C = ifelse(CHI_Valid == "Valid CHI" & (!is.na(SURNAME) | !is.na(FIRST_FORENAME) | !is.na(SEX))
                                 & is.na(Block_Type), "Possible Block C Match", NA)) %>%
    mutate(Block_Type = ifelse(is.na(Block_Type) & !is.na(Block_Type_C),Block_Type_C,Block_Type)) %>%
    select(-Block_Type_C,-CHI_Valid)
  
###################################################
# Check for missing sex with 1st Forename and SURNAME Present ----
###################################################
  
  # If 1st Forename and Surname is present but Sex is missing in record, potential match may be found in Block C.
} else if(!is.null(App_data$values$SURNAME) & !is.null(App_data$values$FIRST_FORENAME)) {
  
  block_data$values <- block_data$values %>%
    mutate(Block_Type_C = ifelse(!is.na(SURNAME) & !is.na(FIRST_FORENAME) & is.na(SEX)
                                 & is.na(Block_Type), "Possible Block C Match", NA)) %>%
    mutate(Block_Type = ifelse(is.na(Block_Type) & !is.na(Block_Type_C),Block_Type_C,Block_Type)) %>%
    select(-Block_Type_C)
  
###################################################
# Record has no assigned block ----
###################################################
  
} else {
  
  block_data$values <- block_data$values %>%
    mutate(Block_Type_no = ifelse(is.na(Block_Type), "No block assigned", NA)) %>%
    mutate(Block_Type = ifelse(is.na(Block_Type) & !is.na(Block_Type_no),Block_Type_no,Block_Type)) %>%
    select(-Block_Type_no)
  
}

###################################################
###################################################


########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################