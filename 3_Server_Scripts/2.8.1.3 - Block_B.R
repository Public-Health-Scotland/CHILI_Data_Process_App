########################################################################
############## Block B Check ##########################################
########################################################################
########################################################################

###################################################
# Block B_C Check ----
###################################################

if(!is.null(App_data$values$PREVIOUS_SURNAME) & !is.null(App_data$values$FIRST_FORENAME) & !is.null(App_data$values$SEX)) {
  
  
##############################
# DOB Check ----
##############################
  
  # If DOB present in record, potential match may be found in Block C.
  if(!is.null(App_data$values$DATE_OF_BIRTH)){
    
    block_data$values <- block_data$values |>
      mutate(Block_Type_B_C = ifelse(!is.na(PREVIOUS_SURNAME) & !is.na(FIRST_FORENAME) & !is.na(SEX) & !is.na(DATE_OF_BIRTH) 
                                     & is.na(Block_Type), "Possible Block B_C Match", NA)) |>
      mutate(Block_Type = ifelse(is.na(Block_Type) & !is.na(Block_Type_B_C),Block_Type_B_C,Block_Type)) |>
      select(-Block_Type_B_C)
    
##############################
# CHI Number Check ----
##############################
    
    # If CHI present in record, potential match may be found in Block C.
  } else if(!is.null(App_data$values$CHI_NUMBER)) {
    
    block_data$values <- block_data$values |>
      mutate(CHI_Valid = chi_check(chi_pad(as.character(CHI_NUMBER)))) |>
      mutate(Block_Type_B_C = ifelse(!is.na(Surname) & !is.na(FIRST_FORENAME) & !is.na(SEX) & CHI_Valid == "Valid CHI"
                                     & is.na(Block_Type), "Possible Block B_C Match", NA)) |>
      mutate(Block_Type = ifelse(is.na(Block_Type) & !is.na(Block_Type_B_C),Block_Type_B_C,Block_Type)) |>
      select(-Block_Type_B_C,-CHI_Valid)
    
###################################################
# Block B Check ----
###################################################
    
  } else {
    
    block_data$values <- block_data$values |>
      mutate(Block_Type_B = ifelse(!is.na(PREVIOUS_SURNAME) & !is.na(FIRST_FORENAME) & !is.na(SEX)
                                   & is.na(Block_Type), "Possible Block B Match", NA)) |>
      mutate(Block_Type = ifelse(is.na(Block_Type) & !is.na(Block_Type_B),Block_Type_B,Block_Type)) |>
      select(-Block_Type_B)
  }
  
##############################
# No record has a possible match in Block B ----
##############################
  
} else {
  
  shinyalert("No record has a possible match in Block B", type = "warning")
  
}

##############################
##############################

###################################################
###################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################