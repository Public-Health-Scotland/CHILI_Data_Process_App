########################################################################
############## Ensure each sex option has one value ####################
########################################################################
########################################################################

####################################################
# Process Female Option
####################################################

# Female Option to convert ----
isolate(
  Female <- input$Female_Option
)

# Ensure all female values are given as "F"
if(length(Female) != 0) {
  
  for(i in 1:length(Female)){
    
    App_data$values <- App_data$values %>%
      mutate(SEX = str_replace(SEX, Female[i], "F"))
    
  }
  
  }

####################################################
# Process Male Option
####################################################

# Male Option to convert ----
isolate(
  Male <- input$Male_Option
)

# Ensure all male values are given as "M"
if(length(Male) != 0) {
  
  for(i in 1:length(Male)){
    App_data$values <- App_data$values %>%
      mutate(SEX = str_replace(SEX, Male[i], "M"))
    
  }
  
  }

####################################################
# Process Other Option
####################################################

# Other Option to convert ---- 
isolate(
  Other <- input$Other_Option
)

# Ensure all other values are given as "O"
if(length(Other) != 0) {
  
  for(i in 1:length(Other)){
    
    App_data$values <- App_data$values %>%
      mutate(SEX = str_replace(SEX, Other[i], "O"))
    
  }
  
  }

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################