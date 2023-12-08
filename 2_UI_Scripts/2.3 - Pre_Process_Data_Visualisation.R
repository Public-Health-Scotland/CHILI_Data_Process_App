########################################################################
############## Data Visualisation - Pre Processing ####################
########################################################################
########################################################################

# Sub Tab
tabPanel("Data Visualisation - Pre Processing",
         
         # Contains Input and output Definitions ----
         fluidRow(
           
           # Main panel for displaying outputs ----
           mainPanel(
             
             # Section Title
             h1(strong("Data Visualisation")),
             
             # File Input Data Viz
             DT::dataTableOutput("Initial_data")
             
             )
           
           )
         
         )

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################