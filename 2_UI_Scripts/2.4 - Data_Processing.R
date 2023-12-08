########################################################################
############## Data Processing #########################################
########################################################################
########################################################################

# Sub Tab
tabPanel("Data Processing",
         
         # Contains Input and output Definitions ----
         fluidRow(
           
####################################################
# Sidebar panel for inputs ----
####################################################
           
           column(3,
                  
                  # Section Title
                  h4(strong("Variable choice for renaming")),
                  br(),
                  
                  ##############################
                  ## Serial Number Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("SerialId", strong("Serial")),
                  uiOutput("Rename_Serial"),
                  
                  ##############################
                  ## CHI Number Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("CHI_Number_Id", strong("CHI Number")),
                  uiOutput("Rename_CHI_Number"),
                  
                  ##############################
                  ## Surname Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("SurnameId", strong("Surname")),
                  uiOutput("Rename_Surname"),
                  
                  ##############################
                  ## Previous Surname Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("Previous_SurnameId", strong("Previous Surname")),
                  uiOutput("Rename_Previous_Surname"),
                  
                  ##############################
                  ## First Forename Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("First_ForenameId", strong("First Forename")),
                  uiOutput("Rename_First_Forename"),
                  
                  ##############################
                  ## Second Forename Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("Second_ForenameId", strong("Second Forename")),
                  uiOutput("Rename_Second_Forename"),
                  
                  ##############################
                  ## Sex Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("SexId", strong("Sex")),
                  uiOutput("Rename_Sex"),
                  
                  #################
                  # Sex Variable Options
                  #################
                  
                  uiOutput("Male_Sex_Option"),
                  uiOutput("Female_Sex_Option"),
                  uiOutput("Other_Sex_Option"),
                  
                  #################
                  #################
                  
                  ##############################
                  ## Date of Birth Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("Date_of_Birth_Id", strong("Date of Birth")),
                  uiOutput("Rename_Date_of_Birth"),
                  

                  ##############################
                  ## Date of Death Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("Date_of_Death_Id", strong("Date of Death")),
                  uiOutput("Rename_Date_of_Death"),
                  
                  
                  ##############################
                  ## Postcode Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("Postcode_Id", strong("Postcode")),
                  uiOutput("Rename_Postcode"),
                  
                  ##############################
                  ## NHS Number Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("NHS_Number_Id", strong("NHS Number")),
                  uiOutput("Rename_NHS_Number"),
                  
                  ##############################
                  ## Address 1 Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("Address1_Id", strong("Address Line 1")),
                  uiOutput("Rename_Address1"),
                  
                  ##############################
                  ## Address 2 Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("Address2_Id", strong("Address Line 2")),
                  uiOutput("Rename_Address2"),
                  
                  ##############################
                  ## Address 3 Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("Address3_Id", strong("Address Line 3")),
                  uiOutput("Rename_Address3"),
                  
                  ##############################
                  ## Address Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("Address_Id", strong("Address")),
                  uiOutput("Rename_Address"),
                  
                  ##############################
                  ## User Data Rename and selectbox box generation
                  ##############################
                  
                  checkboxInput("User_Data_Id", strong("User Data")),
                  uiOutput("Rename_User_Data"),
                  
                  ##############################
                  ##############################
                  
####################################################
####################################################
                  
                  br(),
                  
                  # Rename & Process Data Buttion
                  actionButton("process", "Process Button")
                  
                  ),
           
           # Main panel for displaying outputs ----
           mainPanel()
           
           )
         
         )

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################