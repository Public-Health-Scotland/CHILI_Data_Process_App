########################################################################
############## Data Summary - Post Processing ##########################
########################################################################
########################################################################

# Sub Tab
tabPanel("Data Summary after processing",
         
         # Contains Input and output Definitions ----
         fluidRow(
           
####################################################
# Main panel for displaying outputs ----
####################################################
           
           mainPanel(
             
             # Section Title
             h1(strong("Data Information")),
             br(),
             
             # Output: Summary of distribution for App data ----
             h2(strong("Data Summary")),
             verbatimTextOutput("process_summary_dist"),
             br(),
             
             # Output - Variable Completeness Table
             h2(strong("Variable Completeness")),
             DT::dataTableOutput("output_var_completeness"),
             
             
             # Output - Variable Uniqueness Table
             h2(strong("Variable Uniqueness")),
             DT::dataTableOutput("output_var_uniqueness")
        
             
             )
           
####################################################
####################################################
           
           )
         
         )

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################