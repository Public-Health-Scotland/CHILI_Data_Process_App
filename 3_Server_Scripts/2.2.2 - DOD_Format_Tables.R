########################################################################
############## DOD Format Table #######################################
########################################################################
########################################################################

####################################################
# Update SelectBox for DOD choice
####################################################

# This updates variable select options 
observe({
  
  # Store all variable name of pre-processed data
  cb_options <- SelectBox_Update(data())
  
  
  # Update Selectbox ----
  updateSelectInput(session, "DOD_Names",
                    label = NULL,
                    choices = cb_options,
                    selected = "")
  
})

####################################################
# Create Table for DOD
####################################################

# Data Initilisation
Temp_DOD_Data <- reactiveValues(values = NULL)
DOD_checks_tab <- reactiveValues(values = NULL)
DOD_check_table <- reactiveValues(values = NULL)

# Temporary Data Storage for DOD Checks
observe({
  
  Temp_DOD_Data$values <- data()
  
})


# Press button for DOD check
observeEvent(input$DOD_chk,{
  
  ##############################
  # Ensures that DOD variable is selected
  ##############################
  
  if(input$DOD_Names != "") {
    
    shinyalert("DOD check performed successfully", glue("Check performed on {input$DOD_Names} variable") ,type = "success")
    
    ##############################
    # Date Format Check
    ##############################
    
    colnames(Temp_DOD_Data$values)[colnames(Temp_DOD_Data$values) == input$DOD_Names] <- "DATE_OF_DEATH"
    
    suppressWarnings(DOD_checks_tab$values <- Temp_DOD_Data$values %>%
                       select(DATE_OF_DEATH) %>%
                       mutate(ymd = format(ymd(DATE_OF_DEATH), format = "%Y%m%d")) %>%
                       mutate(ydm = format(ydm(DATE_OF_DEATH), format = "%Y%m%d")) %>%
                       mutate(dmy = format(dmy(DATE_OF_DEATH), format = "%Y%m%d")) %>%
                       mutate(mdy = format(mdy(DATE_OF_DEATH), format = "%Y%m%d")) %>%
                       select(ymd,ydm,dmy,mdy)
    )
    
    ##############################
    # Process DOD Table
    ##############################
    
    DOD_formats <- data.frame(colnames(DOD_checks_tab$values)) %>%
      rename(`DOD_Format` = `colnames.DOD_checks_tab.values.`)
    
    
    DOD_check_table$values <- data.frame((colSums(is.na(DOD_checks_tab$values)) / nrow(DOD_checks_tab$values))*100) %>%
      rename(`Rates for Date not in given format (%)` = `X.colSums.is.na.DOD_checks_tab.values...nrow.DOD_checks_tab.values.....`) %>%
      cbind(DOD_formats) %>%
      mutate(`Number of Observations not in Date format given` = ((`Rates for Date not in given format (%)`/100)*nrow(DOD_checks_tab$values))) %>%
      mutate(`Number of Observations in Date format given` = nrow(DOD_checks_tab$values) - `Number of Observations not in Date format given`) %>%
      select(`DOD_Format`,`Number of Observations in Date format given`,`Number of Observations not in Date format given`) %>%
      mutate(`Number of Observations within Dataset` = nrow(DOD_checks_tab$values)) %>%
      mutate(`Number of Observations not in Date format given` = round(`Number of Observations not in Date format given`, digits = 0)) %>%
      mutate(`Number of Observations in Date format given` = round(`Number of Observations in Date format given`, digits = 0)) %>%
      arrange(desc(`Number of Observations in Date format given`))
    
    ##############################
    ##############################
    
    # Clear Data
    Temp_DOD_Data$values <- data()
    DOD_checks_tab$values <- NULL
    updateSelectInput(session, "DOD_Names", selected = "")
    
    
    
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