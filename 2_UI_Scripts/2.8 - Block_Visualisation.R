########################################################################
############## Data Visualisation - Possible Blocks ####################
########################################################################
########################################################################

# Sub Tab
tabPanel("Data Visualisation - Possible Blocks",
         
         # Contains Input and output Definitions ----
         fluidRow(
           
           ####################################################
           # Sidebar panel for inputs ----
           ####################################################
           
           column(3,
                  
                  # Block Check button
                  h4(strong("Block Check")),
                  actionButton("blk_chk", "Block Check")
                  
           ),
           
           ####################################################
           # Main panel for displaying outputs ----
           ####################################################
           
           mainPanel(
             

             # Section Title
             h1(strong("Data Visualisation - Possible Blocks")),
             
             # Processed Output Visualisation
             DT::dataTableOutput("Block_data"),
             
             # Section Title
             h1(strong("Block Table Breakdown")),
             
             # Processed Output Visualisation
             DT::dataTableOutput("Block_table")
             
           )
           
           ####################################################
           ####################################################
           
         )
         
)

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################