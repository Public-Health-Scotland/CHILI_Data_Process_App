############################################################
############################################################

##############################
# Serial Number Duplicate Table Set-up

Serial_Chk <- reactiveValues(values = NULL)


observe({
  
  if(!is.null(App_data$values$SERIAL)) {
    
    Serial_Chk$values <- App_data$values %>%
      select(SERIAL) %>%
      mutate(SERIAL = as.character(SERIAL)) %>%
      group_by(SERIAL) %>%
      summarise(Serial_Number_count = n()) %>%
      ungroup()%>%
      group_by(Serial_Number_count) %>%
      summarise(Frequency = n()) %>%
      ungroup() %>%
      mutate(`Total Number of Serials` = Serial_Number_count * Frequency) %>%
      adorn_totals("row")
    
  }
}) 

##############################
# CHI Number Duplicate and validity Table Set-up

CHI_Number_Dup_Chk <- reactiveValues(values = NULL)
CHI_Number_Validity_Chk <- reactiveValues(values = NULL)

observe({
  
  if(!is.null(App_data$values$CHI_NUMBER)) {
    
    # CHI Number Duplication Check
    CHI_Number_Dup_Chk$values <- App_data$values %>%
      select(CHI_NUMBER) %>%
      mutate(CHI_NUMBER = as.character(CHI_NUMBER)) %>%
      group_by(CHI_NUMBER) %>%
      summarise(CHI_Number_count = n()) %>%
      ungroup()%>%
      group_by(CHI_Number_count) %>%
      summarise(Frequency = n()) %>%
      ungroup() %>%
      mutate(`Total Number of CHI Numbers` = CHI_Number_count * Frequency) %>%
      adorn_totals("row")
    
    # CHI Number Validity Check
    CHI_Number_Validity_Chk$values <- App_data$values %>%
      select(CHI_NUMBER) %>%
      mutate(CHI_NUMBER = chi_pad(as.character(CHI_NUMBER))) %>% 
      mutate(valid_chi = chi_check(CHI_NUMBER)) %>%
      mutate(valid_chi = ifelse(CHI_NUMBER == "","No CHI Given",valid_chi)) %>%
      group_by(valid_chi) %>%
      summarise(valid_chi_count = n()) %>%
      ungroup() %>%
      adorn_totals("row")
    
  }
})

##############################

############################################################
############################################################