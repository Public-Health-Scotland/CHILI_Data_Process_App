########################################################################
############## Renaming Variables ######################################
########################################################################
########################################################################

####################################################
# Serial Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$Serial_Rename] <- "SERIAL"
updateCheckboxInput(session, "SerialId", value = FALSE)

####################################################
# CHI Number Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$CHI_Number_Rename] <- "CHI_NUMBER"
updateCheckboxInput(session, "CHI_Number_Id", value = FALSE)

####################################################
# Surname Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$Surname_Rename] <- "SURNAME"
updateCheckboxInput(session, "SurnameId", value = FALSE)

####################################################
# Previous Surname Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$Previous_Surname_Rename] <- "PREVIOUS_SURNAME"
updateCheckboxInput(session, "Previous_SurnameId", value = FALSE)

####################################################
# First Forename Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$First_Forename_Rename] <- "FIRST_FORENAME"
updateCheckboxInput(session, "First_ForenameId", value = FALSE)

####################################################
# Second Forename Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$Second_Forename_Rename] <- "SECOND_FORENAME"
updateCheckboxInput(session, "Second_ForenameId", value = FALSE)

####################################################
# Sex Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$Sex_Rename] <- "SEX"
updateCheckboxInput(session, "SexId", value = FALSE)

####################################################
# Date of Birth Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$Date_of_Birth_Rename] <- "DATE_OF_BIRTH"
updateCheckboxInput(session, "Date_of_Birth_Id", value = FALSE)

####################################################
# Date of Death Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$Date_of_Death_Rename] <- "DATE_OF_DEATH"
updateCheckboxInput(session, "Date_of_Death_Id", value = FALSE)

####################################################
# Postcode Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$Postcode_Rename] <- "POSTCODE"
updateCheckboxInput(session, "Postcode_Id", value = FALSE)

####################################################
# NHS Number Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$NHS_Number_Rename] <- "NHS_NUMBER"
updateCheckboxInput(session, "NHS_Number_Id", value = FALSE)

####################################################
# Address 1 Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$Address_Rename1] <- "ADDRESS1"
updateCheckboxInput(session, "Address1_Id", value = FALSE)

####################################################
# Address 2 Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$Address_Rename2] <- "ADDRESS2"
updateCheckboxInput(session, "Address2_Id", value = FALSE)

####################################################
# Address 3 Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$Address_Rename3] <- "ADDRESS3"
updateCheckboxInput(session, "Address3_Id", value = FALSE)

####################################################
# Address Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$Address_Rename] <- "ADDRESS"
updateCheckboxInput(session, "Address_Id", value = FALSE)

####################################################
# User Data Rename
####################################################

colnames(App_data$values)[colnames(App_data$values) == input$User_Data_Rename] <- "USER_DATA"
updateCheckboxInput(session, "User_Data_Id", value = FALSE)

####################################################
# Notification rename message
####################################################

Notification_Messages$values[1] <- "Variables Renamed"

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################