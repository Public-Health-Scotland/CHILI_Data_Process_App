########################################################################
############## CHILI Home Page #########################################
########################################################################
########################################################################

# Main Tab
tabPanel(tags$head(tags$style(HTML(".selectize-input {border: 1px solid #3F3685;}"))), #controls SelectInput boxes border color
  
  title = "Home",
  
  navlistPanel( 
    
    id = "tabset",
    
    widths = sb_width,
    
####################################################
# App Instruction Sub-Tab ----
####################################################
    
    # Stores SDC App Instructions
    source(glue("2_UI_Scripts/1.1 - App_Instructions.R"),  local = TRUE)$value,
    
####################################################
# Indexer Procedure Information
####################################################

  # Stores Block Information
  source(glue("2_UI_Scripts/1.2 - Indexer_Procedure_Information.R"),  local = TRUE)$value,

####################################################
# Missing Data Information
####################################################

# Stores Information about Missing Data
source(glue("2_UI_Scripts/1.3 - Missing_Data_Information.R"),  local = TRUE)$value,


####################################################
####################################################

  )
  
)

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################