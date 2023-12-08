########################################################################
############## Summary - Serial number and CHI number ##################
########################################################################
########################################################################

# Sub Tab
tabPanel("Serial & CHI Number Summary Tables",
         
         # Contains Input and output Definitions ----
         fluidRow(
           
           ####################################################
           # Sidebar panel for inputs ----
           ####################################################
           
           column(3,
                  
                  ##############################
                  # Button to change Serial if duplicates are given
                  ##############################
                  
                  h4(strong("Serial Duplicate Removal")),
                  actionButton("Ser_Dup", "Remove"),
                  br(),
                  
                  ##############################
                  # Button to remove invalid CHI Numbers
                  ##############################
                  
                  h4(strong("Invalid CHI Removal & Duplicate CHI Removal")),
                  actionButton("CHI_Rem", "Remove"),
                  
                  br(),
                  br(),
                  
                  # Help Text on CHI removal
                  h6("Please note that Invalid CHIs and Duplicate CHIs can only be removed if the ", strong("Select Non-Seeding option"), 
                     "Checkbox has been ticked in the ", strong("File Upload"), "sub-tab.")
                  
                  ),
           
           ####################################################
           # Main panel for displaying outputs ----
           ####################################################
           
           mainPanel(
             
             # Serial Duplication Table
             h4(strong("Serial Number Duplicate Summary")),
             DT::dataTableOutput("Serial_Duplicates"),
             
             # CHI Number Duplication Table
             h4(strong("CHI Number Duplicate Summary")),
             DT::dataTableOutput("CHI_Duplicates"),
             
             # CHI Number Validity Table
             h4(strong("CHI Number Validity Summary")),
             DT::dataTableOutput("CHI_Validity")
             
             )
           
           ####################################################
           ####################################################
           
           )
         
         )

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################