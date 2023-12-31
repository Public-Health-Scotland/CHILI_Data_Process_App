########################################################################
############## Exact Match Block #######################################
########################################################################
########################################################################


if(!is.null(App_data$values$SURNAME) & !is.null(App_data$values$FIRST_FORENAME) & !is.null(App_data$values$SEX) & 
   !is.null(App_data$values$DATE_OF_BIRTH)) {
  
###################################################
# Postcode Check
###################################################
  
  if(!is.null(App_data$values$POSTCODE)) {
    
    # Postcode Pattern - for exact match, full Pcode must be given
    pcode_pattern <- "\\b(?:([G][I][R] 0[A]{2})|((([BEGLMNSW][0-9])|([A-Z][0-9]{1,2})|(([A-Z][A-HJ-Y][0-9]{1,2})|(([A-Z][0-9][A-Z])|([A-Z][A-HJ-Y][0-9]?[A-Z]))))\\s?[0-9][A-Z]{2}))\\b"
    
    # Check for Valid Postcode and then possible Exact Match
    block_data$values <- block_data$values %>%
      mutate(POSTCODE = str_squish(POSTCODE)) %>%
      mutate(Pcode_Valid = grepl(pcode_pattern,POSTCODE)) %>%
      mutate(PCode_Block = ifelse(!is.na(SURNAME) & !is.na(FIRST_FORENAME) & !is.na(SEX) & !is.na(DATE_OF_BIRTH)
                                  & Pcode_Valid == TRUE, "Possible Exact Match (A_C)", NA)) %>%
      select(-Pcode_Valid)
    
  } else{
    
    block_data$values <- block_data$values %>%
      mutate(PCode_Block =  NA)
    
  }
  
###################################################
# Second Forename Check
###################################################
  
  if(!is.null(App_data$values$SECOND_FORENAME)) {
    
    block_data$values <- block_data$values %>%
      mutate(Second_Fore_Block = ifelse(!is.na(SURNAME) & !is.na(FIRST_FORENAME) & !is.na(SEX) & !is.na(DATE_OF_BIRTH)
                                        & !is.na(SECOND_FORENAME), "Possible Exact Match (A_C)", NA))
    
  } else{
    
    block_data$values <- block_data$values %>%
      mutate(Second_Fore_Block =  NA)
    
  }
  
###################################################
# Previous Surname Check
###################################################
  if(!is.null(App_data$values$PREVIOUS_SURNAME)) {
    
    block_data$values <- block_data$values %>%
      mutate(Prev_Sur_Block = ifelse(!is.na(SURNAME) & !is.na(FIRST_FORENAME) & !is.na(SEX) & !is.na(DATE_OF_BIRTH)
                                     & !is.na(PREVIOUS_SURNAME), "Possible Exact Match (A_B_C)", NA))
    
  } else{
    
    block_data$values <- block_data$values %>%
      mutate(Prev_Sur_Block =  NA)
    
  }
  
###################################################
# CHI Number Check
###################################################
  
  if(!is.null(App_data$values$CHI_NUMBER)) {
    
    block_data$values <- block_data$values %>%
      mutate(CHI_Valid = chi_check(chi_pad(as.character(CHI_NUMBER)))) %>%
      mutate(CHI_Block = ifelse(!is.na(SURNAME) & !is.na(FIRST_FORENAME) & !is.na(SEX) & !is.na(DATE_OF_BIRTH)
                                & CHI_Valid == "Valid CHI", "Possible Exact Match (A_C)", NA)) %>%
      select(-CHI_Valid)
    
  } else{
    
    block_data$values <- block_data$values %>%
      mutate(CHI_Block =  NA)
    
  }
  
###################################################
# Exact Block Organisation
###################################################
  
  block_data$values <- block_data$values %>%
    mutate(Block_Type = case_when(!is.na(Prev_Sur_Block) ~ Prev_Sur_Block,
                                  is.na(Prev_Sur_Block) & (!is.na(PCode_Block) | !is.na(Second_Fore_Block) | !is.na(CHI_Block)) ~ "Possible Exact Match (A_C)",
                                  is.na(PCode_Block) & is.na(Second_Fore_Block) & is.na(Prev_Sur_Block) & is.na(CHI_Block) ~ NA)) %>%
        select(-PCode_Block,-Second_Fore_Block,-Prev_Sur_Block,-CHI_Block)
  
###################################################
# No record is an exact match
###################################################
  
} else {
  
  shinyalert("No record given is an exact match", type = "warning")
  
}

###################################################
###################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################