########################################################################
############## DOB Format Table #######################################
########################################################################
########################################################################

####################################################
# Update SelectBox for DOB choice
####################################################

# This updates variable select options 
observe({
  
  # Store all variable name of pre-processed data
  cb_options <- SelectBox_Update(data())
  
  
  # Update Selectbox ----
  updateSelectInput(session, "DOB_Names",
                    label = NULL,
                    choices = cb_options,
                    selected = "")
  
})

####################################################
# Create Table for DOB
####################################################

# Data Initilisation
Temp_DOB_Data <- reactiveValues(values = NULL)
DOB_checks_tab <- reactiveValues(values = NULL)
DOB_check_table <- reactiveValues(values = NULL)

# Temporary Data Storage for DOB Checks
observe({
  
  Temp_DOB_Data$values <- data()
  
})


# Press button for DOB check
observeEvent(input$DOB_chk,{
  
  ##############################
  # Ensures that DOB variable is selected
  ##############################
  
  if(input$DOB_Names != "") {
    
    shinyalert("DOB check performed successfully", glue("Check performed on {input$DOB_Names} variable") ,type = "success")
    
    ##############################
    # Date Format Check
    ##############################
    
    colnames(Temp_DOB_Data$values)[colnames(Temp_DOB_Data$values) == input$DOB_Names] <- "DATE_OF_BIRTH"
    
    suppressWarnings(DOB_checks_tab$values <- Temp_DOB_Data$values %>%
                       select(DATE_OF_BIRTH) %>%
                       mutate(ymd = format(ymd(DATE_OF_BIRTH), format = "%Y%m%d")) %>%
                       mutate(ydm = format(ydm(DATE_OF_BIRTH), format = "%Y%m%d")) %>%
                       mutate(dmy = format(dmy(DATE_OF_BIRTH), format = "%Y%m%d")) %>%
                       mutate(mdy = format(mdy(DATE_OF_BIRTH), format = "%Y%m%d")) %>%
                       select(ymd,ydm,dmy,mdy)
    )
    
    ##############################
    # Process DOB Table
    ##############################
    
    DOB_formats <- data.frame(colnames(DOB_checks_tab$values)) %>%
      rename(`DOB_Format` = `colnames.DOB_checks_tab.values.`)
    
    
    DOB_check_table$values <- data.frame((colSums(is.na(DOB_checks_tab$values)) / nrow(DOB_checks_tab$values))*100) %>%
      rename(`Rates for Date not in given format (%)` = `X.colSums.is.na.DOB_checks_tab.values...nrow.DOB_checks_tab.values.....`) %>%
      cbind(DOB_formats) %>%
      mutate(`Number of Observations not in Date format given` = ((`Rates for Date not in given format (%)`/100)*nrow(DOB_checks_tab$values))) %>%
      mutate(`Number of Observations in Date format given` = nrow(DOB_checks_tab$values) - `Number of Observations not in Date format given`) %>%
      select(`DOB_Format`,`Number of Observations in Date format given`,`Number of Observations not in Date format given`) %>%
      mutate(`Number of Observations within Dataset` = nrow(DOB_checks_tab$values)) %>%
      mutate(`Number of Observations not in Date format given` = round(`Number of Observations not in Date format given`, digits = 0)) %>%
      mutate(`Number of Observations in Date format given` = round(`Number of Observations in Date format given`, digits = 0)) %>%
      arrange(desc(`Number of Observations in Date format given`))
    
    ##############################
    ##############################
    
    # Clear Data
    Temp_DOB_Data$values <- data()
    DOB_checks_tab$values <- NULL
    updateSelectInput(session, "DOB_Names", selected = "")
    
    
    
  } else{
    
    shinyalert("No Variable Chosen",type = "error")
  }
  
  
})

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################