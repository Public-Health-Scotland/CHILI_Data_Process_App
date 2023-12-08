########################################################################
############## File Upload #############################################
########################################################################
########################################################################

# Sub Tab
tabPanel("File Upload",
         
         
         # Contains Input and output Definitions ----
         fluidRow(
           
####################################################
# Sidebar panel for inputs ----
####################################################
           
           column(3,
                  
                  # Input: Select a file ----
                  h4(strong("File Upload (This accepts .csv and .xlsx/.xls files)")),
                  fileInput("upload", NULL, accept = c(".csv", ".tsv", ".xlsx",".xls")),

                  # Input: Checkbox Option for NS
                  h4(strong("Select Non-Seeding option")),
                  checkboxInput("NS_select",label = NULL)
                  
                  ),
           
####################################################
# Main panel for displaying outputs ----
####################################################
           
           mainPanel(
             
             # Section Title
             h1(strong("Data Information")),
             br(),
             
             # Output: Summary of distribution for File Input ----
             h2(strong("Data Summary")),
             verbatimTextOutput("upload_summary_dist"),
             
             # Output - Variable Completeness Table
             h2(strong("Variable Completeness")),
             DT::dataTableOutput("input_var_completeness"),
             
             # Output - Variable Uniqueness Table
             h2(strong("Variable Uniqueness")),
             DT::dataTableOutput("input_var_uniqueness")

             
####################################################
####################################################
             
             )
           
           )
         
         )

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################