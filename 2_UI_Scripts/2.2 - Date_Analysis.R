########################################################################
############## Input Date Analysis #####################################
########################################################################
########################################################################

# Sub Tab
tabPanel("Input Date Analysis",
         
         
         # Contains Input and output Definitions ----
         fluidRow(
           
           ####################################################
           # Sidebar panel for inputs ----
           ####################################################
           
           column(3,

                  # Input: Date of Birth QA Checks
                  h4(strong("Select Date of Birth Variable")),
                  selectInput("DOB_Names", label = NULL, choices = "", multiple = FALSE),
                  actionButton("DOB_chk", "DOB QA Check"), # DOB Process Button
                  
                  # Input: Date of Death QA Checks
                  h4(strong("Select Date of Death Variable")),
                  selectInput("DOD_Names", label = NULL, choices = "", multiple = FALSE),
                  actionButton("DOD_chk", "DOD QA Check"), # DOD Process Button
    
           ),
           
           ####################################################
           # Main panel for displaying outputs ----
           ####################################################
           
           mainPanel(
             
             # Output - Date of Birth Format Checks
             h2(strong("DOB Format Checks")),
             DT::dataTableOutput("DOB_quality"),

             # Output - Date of Death Format Checks
             h2(strong("DOD Format Checks")),
             DT::dataTableOutput("DOD_quality")
             
             ####################################################
             ####################################################
             
           )
           
         )
         
)

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################