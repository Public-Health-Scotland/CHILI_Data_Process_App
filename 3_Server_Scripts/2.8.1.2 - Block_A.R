########################################################################
############## Block A Check ##########################################
########################################################################
########################################################################


###################################################
# Block A_B_C Check
###################################################

if(!is.null(App_data$values$SURNAME) & !is.null(App_data$values$PREVIOUS_SURNAME) & !is.null(App_data$values$FIRST_FORENAME) & !is.null(App_data$values$SEX)) {
  
##############################
# DOB Check
##############################
  
  if(!is.null(App_data$values$Date_of_Birth)){
    
    block_data$values <- block_data$values %>%
      mutate(Block_Type_A_B_C = ifelse(!is.na(SURNAME) & !is.na(PREVIOUS_SURNAME) & !is.na(FIRST_FORENAME) & !is.na(SEX) & !is.na(Date_of_Birth) 
                                       & is.na(Block_Type), "Possible Block A_B_C Match", NA)) %>%
      mutate(Block_Type = ifelse(is.na(Block_Type) & !is.na(Block_Type_A_B_C),Block_Type_A_B_C,Block_Type)) %>%
      select(-Block_Type_A_B_C)
    
##############################
# CHI Number Check
##############################
    
  } else if(!is.null(App_data$values$CHI_NUMBER)) {
    
    block_data$values <- block_data$values %>%
      mutate(CHI_Valid = chi_check(chi_pad(as.character(CHI_NUMBER)))) %>%
      mutate(Block_Type_A_B_C = ifelse(!is.na(SURNAME) & !is.na(PREVIOUS_SURNAME) & !is.na(FIRST_FORENAME) & !is.na(SEX) 
                                       & CHI_Valid == "Valid CHI" & is.na(Block_Type), "Possible Block A_B_C Match", NA)) %>%
      mutate(Block_Type = ifelse(is.na(Block_Type) & !is.na(Block_Type_A_B_C),Block_Type_A_B_C,Block_Type)) %>%
      select(-Block_Type_A_B_C,-CHI_Valid)
    
##############################
# No record has a possible match in Block C
##############################
    
  } else {
    
  }
  
##############################
# No record has a possible match in all three blocks
##############################
  
} else{
  

}

###################################################
# Block A_C Check
###################################################

if(!is.null(App_data$values$SURNAME) & !is.null(App_data$values$FIRST_FORENAME) & !is.null(App_data$values$SEX)) {
  
##############################
# DOB Check
##############################
  
  if(!is.null(App_data$values$DATE_OF_BIRTH)){
    
    block_data$values <- block_data$values |>
      mutate(Block_Type_A_C = ifelse(!is.na(SURNAME) & !is.na(FIRST_FORENAME) & !is.na(SEX) & !is.na(DATE_OF_BIRTH) 
                                     & is.na(Block_Type), "Possible Block A_C Match", NA)) |>
      mutate(Block_Type = ifelse(is.na(Block_Type) & !is.na(Block_Type_A_C),Block_Type_A_C,Block_Type)) |>
      select(-Block_Type_A_C)
    
##############################
# CHI Number Check
##############################
    
  } else if(!is.null(App_data$values$CHI_NUMBER)) {
    
    block_data$values <- block_data$values |>
      mutate(CHI_Valid = chi_check(chi_pad(as.character(CHI_NUMBER)))) |>
      mutate(Block_Type_A_C = ifelse(!is.na(SURNAME) & !is.na(FIRST_FORENAME) & !is.na(SEX) & CHI_Valid == "Valid CHI" 
                                     & is.na(Block_Type), "Possible Block A_C Match", NA)) |>
      mutate(Block_Type = ifelse(is.na(Block_Type) & !is.na(Block_Type_A_C),Block_Type_A_C,Block_Type)) |>
      select(-Block_Type_A_C,-CHI_Valid)
    
###################################################
# Block A check
###################################################
    
  } else {
    
    block_data$values <- block_data$values |>
      mutate(Block_Type_A = ifelse(!is.na(SURNAME) & !is.na(FIRST_FORENAME) & !is.na(SEX)
                                   & is.na(Block_Type), "Possible Block A Match", NA)) |>
      mutate(Block_Type = ifelse(is.na(Block_Type) & !is.na(Block_Type_A),Block_Type_A,Block_Type)) |>
      select(-Block_Type_A)
    
  }
  
##############################
# No record has a possible match in Block A
##############################
  
} else {
  
  shinyalert("No record has a possible match in Block A", type = "warning")
  
}

##############################
##############################

###################################################
###################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################