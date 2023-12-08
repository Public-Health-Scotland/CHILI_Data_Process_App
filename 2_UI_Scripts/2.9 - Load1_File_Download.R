########################################################################
############## Data Download ###########################################
########################################################################
########################################################################

# Sub Tab
tabPanel("Load 1 - Data Download", fluid = TRUE,
         
         # Sidebar layout with input and output definitions ----
         fluidRow(
           
           ####################################################
           # Sidebar panel for inputs ----
           ####################################################
           
           sidebarPanel(
             
             # Section Title
             h4(strong("File Download/Data Reset")),
             
             # Download Processed Data
             h5(strong("Download Data")),
             downloadButton("downloadData", label = "Download"),
             
             br(),
             
             # Download invalid CHI NUmbers
             h5(strong("Download Invalid CHI Data")),
             downloadButton("downloadInvalidCHI", label = "Download"),
             
             # Download Duplicate CHI Number
             h5(strong("Download Duplicate CHI Data")),
             downloadButton("downloadDuplicateCHI", label = "Download"),
             
             br(),
             br(),
             
             # Invalid/Duplicate CHI Instructions
             h6("Please note that Invalid CHIs and Duplicate CHIs can only be downloaded if the ", strong("Invalid CHI Removal & Duplicate CHI Removal"), 
                "button has been pressed in the ", strong("Serial & CHI Number Summary Tables"), "sub-tab.")
             
             ),
           
           ####################################################
           ####################################################
           
           # Main panel for displaying outputs ----
           mainPanel()
           
           )
         
         )

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################