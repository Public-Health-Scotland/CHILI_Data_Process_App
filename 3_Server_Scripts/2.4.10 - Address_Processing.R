########################################################################
############## Process Address Variable ################################
########################################################################
########################################################################

# Replaces all accented character with non-accented equivalents

####################################################
# Only use address variable if that is given (remove all address line variables)  ----
####################################################

  if(!is.null(App_data$values$ADDRESS)) {
    
    App_data$values <- App_data$values %>%
      mutate(ADDRESS = stri_trans_general(ADDRESS, id = "Latin-ASCII"))
 
    ##############################
    # Remove Address1 variable if Address variable is given ----
    ##############################
    
    if(valid_names[12] %in% colnames(App_data$values)) {
      
      App_data$values <- App_data$values %>%
        select(-ADDRESS1)
      
      } else {}
    
    ##############################
    # Remove Address2 variable if Address variable is given ----
    ##############################
    
    if(valid_names[13] %in% colnames(App_data$values)) {
      
      App_data$values <- App_data$values %>%
        select(-ADDRESS2)
      
    } else{}
      
    ##############################
    # Remove Address3 variable if Address variable is given ----
    ##############################
    
    if(valid_names[14] %in% colnames(App_data$values)) {
    
      App_data$values <- App_data$values %>%
        select(-ADDRESS3)
      
    } else {}
    
  } else {
    
####################################################
# Merge all 3 Address variables if given ----
####################################################
    
    if(valid_names[12] %in% colnames(App_data$values) & valid_names[13] %in% colnames(App_data$values) & valid_names[14] %in% colnames(App_data$values)) {
      
      App_data$values <- App_data$values %>%
        unite(ADDRESS,ADDRESS1,ADDRESS2,ADDRESS3, sep = " ", remove = TRUE, na.rm = TRUE) %>%
        mutate(ADDRESS = stri_trans_general(ADDRESS, id = "Latin-ASCII"))
      
      # shinyalert("All 3 address variables merged", type = "success")
      Notification_Messages$values[10] <- "Address variables merged"
      
    } 
    
####################################################
# Merge Address 1 and Address 2 ----
####################################################
    
    else if (valid_names[12] %in% colnames(App_data$values) & valid_names[13] %in% colnames(App_data$values) & valid_names[14] %notin% colnames(App_data$values)) {

      App_data$values <- App_data$values %>%
        unite(ADDRESS,ADDRESS1,ADDRESS2, sep = " ", remove = TRUE, na.rm = TRUE) %>%
        mutate(ADDRESS = stri_trans_general(ADDRESS, id = "Latin-ASCII"))

      # shinyalert("Address1 & Address2 merged", type = "success")
      Notification_Messages$values[10] <- "Address variables merged"
      
      
    }

####################################################
# Merge Address 1 and Address 3 ----
####################################################
    
    else if(valid_names[12] %in% colnames(App_data$values) & valid_names[13] %notin% colnames(App_data$values) & valid_names[14] %in% colnames(App_data$values)) {

      App_data$values <- App_data$values %>%
        unite(ADDRESS,ADDRESS1,ADDRESS3, sep = " ", remove = TRUE, na.rm = TRUE) %>%
        mutate(ADDRESS = stri_trans_general(ADDRESS, id = "Latin-ASCII"))

      # shinyalert("Address1 & Address3 merged", type = "success")
      Notification_Messages$values[10] <- "Address variables merged"
      

    }

####################################################
# Merge Address 2 and Address 3 ----
####################################################
    
    else if(valid_names[12] %notin% colnames(App_data$values) & valid_names[13] %in% colnames(App_data$values) & valid_names[14] %in% colnames(App_data$values)) {

      App_data$values <- App_data$values %>%
        unite(ADDRESS,ADDRESS2,ADDRESS3, sep = " ", remove = TRUE, na.rm = TRUE) %>%
        mutate(ADDRESS = stri_trans_general(ADDRESS, id = "Latin-ASCII"))

      # shinyalert("Address2 & Address3 merged", type = "success")
      Notification_Messages$values[10] <- "Address variables merged"
      
      
    }
    
####################################################
# Use Address 1 as Address ----
####################################################
    
    else if(valid_names[12] %in% colnames(App_data$values) & valid_names[13] %notin% colnames(App_data$values) & valid_names[14] %notin% colnames(App_data$values)) {

      App_data$values <- App_data$values %>%
        rename(ADDRESS = ADDRESS1) %>%
        mutate(ADDRESS = stri_trans_general(ADDRESS, id = "Latin-ASCII"))
      
      # shinyalert("Address1 renamed as Address", type = "success")
      Notification_Messages$values[10] <- "Address variable renamed"
      
      
    }

####################################################
# Use Address 2 as Address ----
####################################################
    
    else if(valid_names[12] %notin% colnames(App_data$values) & valid_names[13] %in% colnames(App_data$values) & valid_names[14] %notin% colnames(App_data$values)) {

      App_data$values <- App_data$values %>%
        rename(ADDRESS = ADDRESS2) %>%
        mutate(ADDRESS = stri_trans_general(ADDRESS, id = "Latin-ASCII"))

      # shinyalert("Address2 renamed as Address", type = "success")
      Notification_Messages$values[10] <- "Address variable renamed"
      
      
    }

####################################################
# Use Address 3 as Address ----
####################################################
    
    else if(valid_names[12] %notin% colnames(App_data$values) & valid_names[13] %notin% colnames(App_data$values) & valid_names[14] %in% colnames(App_data$values)) {

      App_data$values <- App_data$values %>%
        rename(ADDRESS = ADDRESS3) %>%
        mutate(ADDRESS = stri_trans_general(ADDRESS, id = "Latin-ASCII"))
      
      Notification_Messages$values[10] <- "Address variable renamed"
      
      
    } 
    
####################################################
# No Address Variables given ----
####################################################
    
    else {
      
      # shinyalert("No Address Variables given", type = "error")
    }
    
  }

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################