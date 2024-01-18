########################################################################
############## UI Selectbox Generation #################################
########################################################################
########################################################################

####################################################
# Create Serial Variable Selectbox if checkbox is ticked ----
####################################################

if(input$SerialId == TRUE){

  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())

  # Create Selectbox
  output$Rename_Serial <- renderUI({
    selectInput("Serial_Rename", "Choose Value to rename", choices = cb_options)
  })

} else {

  # Remove UI if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Serial_Rename')
  )
  
  # Ensure Rename option is Null
  Serial_Rename <- NULL
  
}

####################################################
# Create CHI Number Data Variable Selectbox if checkbox is ticked ----
####################################################

if(input$CHI_Number_Id == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())

  # Update Selectbox
  output$Rename_CHI_Number <- renderUI({
    selectInput("CHI_Number_Rename", "Choose Value to rename", choices = cb_options)
  })


} else {

  # Remove UI if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','CHI_Number_Rename')
  )

  # Ensure Rename option is Null
  CHI_Number_Rename <- NULL

}

####################################################
# Create Surname Variable Selectbox if checkbox is ticked ----
####################################################

if(input$SurnameId == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())
  
  # Update Selectbox
  output$Rename_Surname <- renderUI({
    selectInput("Surname_Rename", "Choose Value to rename", choices = cb_options)
  })
  
  
} else {
  
  # Remove UI if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Surname_Rename')
  )
  
  # Ensure Rename option is Null
  Surname_Rename <- NULL
  
}

####################################################
# Create Previous Surname Variable Selectbox if checkbox is ticked ----
####################################################

if(input$Previous_SurnameId == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())
  
  # Update Selectbox
  output$Rename_Previous_Surname <- renderUI({
    selectInput("Previous_Surname_Rename", "Choose Value to rename", choices = cb_options)
  })
  
  
} else {
  
  # Remove UI if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Previous_Surname_Rename')
  )
  
  # Ensure Rename option is Null
  Previous_Surname_Rename <- NULL
  
}

####################################################
# Create First Forename Variable Selectbox if checkbox is ticked ----
####################################################

if(input$First_ForenameId == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())
  
  # Update Selectbox
  output$Rename_First_Forename <- renderUI({
    selectInput("First_Forename_Rename", "Choose Value to rename", choices = cb_options)
  })
  
  
} else {
  
  # Remove UI if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','First_Forename_Rename')
  )
  
  # Ensure Rename option is Null
  First_Forename_Rename <- NULL
  
}

####################################################
# Create Second Forename Variable Selectbox if checkbox is ticked ----
####################################################

if(input$Second_ForenameId == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())
  
  # Update Selectbox
  output$Rename_Second_Forename <- renderUI({
    selectInput("Second_Forename_Rename", "Choose Value to rename", choices = cb_options)
  })
  
  
} else {
  
  # Remove UI if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Second_Forename_Rename')
  )
  
  # Ensure Rename option is Null
  Second_Forename_Rename <- NULL
  
}

####################################################
# Create Sex Variable Selectbox if checkbox is ticked ----
####################################################

if(input$SexId == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())
  
  # Update Selectbox
  output$Rename_Sex <- renderUI({
    selectInput("Sex_Rename", "Choose Value to rename", choices = cb_options)
  })
  
  output$Male_Sex_Option <- renderUI({
    selectInput("Male_Option", "Choose male values", choices = unique(App_data$values[input$Sex_Rename]) %>%
                  rbind(" ") %>%
                  pull(input$Sex_Rename),
                multiple = TRUE)
  })
  
  output$Female_Sex_Option <- renderUI({
    selectInput("Female_Option", "Choose female values", choices = unique(App_data$values[input$Sex_Rename]) %>%
                  rbind(" ") %>%
                  pull(input$Sex_Rename),
                multiple = TRUE
    )
  })
  
  
  output$Other_Sex_Option <- renderUI({
    selectInput("Other_Option", "Choose other values", choices = unique(App_data$values[input$Sex_Rename]) %>%
                  rbind(" ") %>%
                  pull(input$Sex_Rename),
                multiple = TRUE
    )
  })
  
  
} else {
  
  # Remove UIs if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Sex_Rename')
  )
  
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Male_Option')
  )
  
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Female_Option')
  )
  
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Other_Option')
  )
  
  # Ensure Rename option as well as Sex Options are Null
  Sex_Rename <- NULL
  Male_Option <- NULL
  Female_Option <- NULL
  Other_Option <- NULL
  
}

####################################################
# Create Date of Birth Variable Selectbox if checkbox is ticked ----
####################################################

if(input$Date_of_Birth_Id == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())
  
  # Update Selectbox
  output$Rename_Date_of_Birth <- renderUI({
    selectInput("Date_of_Birth_Rename", "Choose Value to rename", choices = cb_options)
    
  })
  
  
} else {
  
  # Remove UIs if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Date_of_Birth_Rename')
  )
  

  # Ensure Rename option
  Date_of_Birth_Rename <- NULL

}

####################################################
# Create Date of Death Variable Selectbox if checkbox is ticked ----
####################################################

if(input$Date_of_Death_Id == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())
  
  # Update Selectbox
  output$Rename_Date_of_Death <- renderUI({
    selectInput("Date_of_Death_Rename", "Choose Value to rename", choices = cb_options)
  })
  
} else {
  
  # Remove UIs if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Date_of_Death_Rename')
  )
  
  # Ensure Rename option as well as Format option is Null
  Date_of_Death_Rename <- NULL

}

####################################################
# Create Postcode Variable Selectbox if checkbox is ticked ----
####################################################

if(input$Postcode_Id == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())
  
  # Update Selectbox
  output$Rename_Postcode <- renderUI({
    selectInput("Postcode_Rename", "Choose Value to rename", choices = cb_options)
  })
  
  
} else {
  
  # Remove UI if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Postcode_Rename')
  )
  
  # Ensure Rename option is Null
  Postcode_Rename <- NULL
  
}

####################################################
# Create NHS Number Variable Selectbox if checkbox is ticked ----
####################################################

if(input$NHS_Number_Id == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())
  
  # Update Selectbox
  output$Rename_NHS_Number <- renderUI({
    selectInput("NHS_Number_Rename", "Choose Value to rename", choices = cb_options)
  })
  
  
} else {
  
  # Remove UI if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','NHS_Number_Rename')
  )
  
  # Ensure Rename option is Null
  NHS_Number_Rename <- NULL
  
}

####################################################
# Create Address Line 1 Variable Selectbox if checkbox is ticked ----
####################################################

if(input$Address1_Id == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())
  
  # Update Selectbox
  output$Rename_Address1 <- renderUI({
    selectInput("Address_Rename1", "Choose Value to rename", choices = cb_options)
  })
  
  
} else {
  
  # Remove UI if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Address_Rename1')
  )
  
  # Ensure Rename option is Null
  Address_Rename1 <- NULL
  
}

####################################################
# Create Address Line 2 Variable Selectbox if checkbox is ticked ----
####################################################
if(input$Address2_Id == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())
  
  # Update Selectbox
  output$Rename_Address2 <- renderUI({
    selectInput("Address_Rename2", "Choose Value to rename", choices = cb_options)
  })
  
  
} else {
  
  # Remove UI if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Address_Rename2')
  )
  
  # Ensure Rename option is Null
  Address_Rename2 <- NULL
  
  
}

####################################################
# Create Address Line 3 Variable Selectbox if checkbox is ticked ----
####################################################

if(input$Address3_Id == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())
  
  # Update Selectbox
  output$Rename_Address3 <- renderUI({
    selectInput("Address_Rename3", "Choose Value to rename", choices = cb_options)
  })
  
  
} else {
  
  # Remove UI if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Address_Rename3')
  )
  
  # Ensure Rename option is Null
  Address_Rename3 <- NULL
  
}

####################################################
# Create Address Variable Selectbox if checkbox is ticked ----
####################################################

if(input$Address_Id == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())
  
  # Update Selectbox
  output$Rename_Address <- renderUI({
    selectInput("Address_Rename", "Choose Value to rename", choices = cb_options)
  })
  
  
} else {
  
  # Remove UI if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','Address_Rename')
  )
  
  # Ensure Rename option is Null
  Address_Rename <- NULL
  
}

####################################################
# Create User Data Variable Selectbox if checkbox is ticked ----
####################################################

if(input$User_Data_Id == TRUE){
  
  # Stores all pre-processed data variable names
  cb_options <- SelectBox_Update(data())
  
  # Update Selectbox
  output$Rename_User_Data <- renderUI({
    selectInput("User_Data_Rename", "Choose Value to rename", choices = cb_options)
  })
  
  
} else {
  
  # Remove UI if checkbox is unticked
  removeUI(
    selector = sprintf('.shiny-input-container:has(#%s)','User_Data_Rename')
  )
  
  # Ensure Rename option is Null
  User_Data_Rename <- NULL
  
}

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################
