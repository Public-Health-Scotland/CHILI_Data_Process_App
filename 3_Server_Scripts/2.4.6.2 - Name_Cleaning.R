########################################################################
############## Name Cleaning ###########################################
########################################################################
########################################################################

####################################################
# Surname Cleaning ----
####################################################

if(is.null(App_data$values$SURNAME)) {
  
} else {
  
  App_data$values <- App_data$values %>%
    mutate(SURNAME = stri_trans_general(SURNAME, id = "Latin-ASCII"),
           SURNAME = gsub("[^[:alpha:] ]", "", SURNAME),
           SURNAME = ifelse(SURNAME %in% c(""," "), NA, SURNAME))
  
}

####################################################
# Previous Surname Cleaning ----
####################################################

if(is.null(App_data$values$PREVIOUS_SURNAME)) {
  
} else {
  
  App_data$values <- App_data$values %>%
    mutate(PREVIOUS_SURNAME = stri_trans_general(PREVIOUS_SURNAME, id = "Latin-ASCII"),
           PREVIOUS_SURNAME = gsub("[^[:alpha:] ]", "", PREVIOUS_SURNAME),
           PREVIOUS_SURNAME = ifelse(PREVIOUS_SURNAME %in% c(""," "), NA, PREVIOUS_SURNAME)) 
  
}

####################################################
# 1st Forename Cleaning ----
####################################################

if(is.null(App_data$values$FIRST_FORENAME)) {
  
} else {
  
  App_data$values <- App_data$values %>%
    mutate(FIRST_FORENAME = stri_trans_general(FIRST_FORENAME, id = "Latin-ASCII"),
           FIRST_FORENAME = gsub("[^[:alpha:] ]", "", FIRST_FORENAME),
           FIRST_FORENAME = ifelse(FIRST_FORENAME %in% c(""," "), NA, FIRST_FORENAME))
  
}

####################################################
# 2nd Forename Cleaning ----
####################################################

if(is.null(App_data$values$SECOND_FORENAME)) {
  
} else {
  
  App_data$values <- App_data$values %>%
    mutate(SECOND_FORENAME = stri_trans_general(SECOND_FORENAME, id = "Latin-ASCII"),
           SECOND_FORENAME = gsub("[^[:alpha:] ]", "", SECOND_FORENAME),
           FIRST_FORENAME = ifelse(FIRST_FORENAME %in% c(""," "), NA, FIRST_FORENAME))
  
}

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################
