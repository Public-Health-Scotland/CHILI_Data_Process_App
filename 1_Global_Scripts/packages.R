########################################################################
############## Package Setup ###########################################
########################################################################
########################################################################

####################################################
# Load all Required Packages for shiny app
####################################################

library(tidyr) # For Data Processing
library(data.table) # For fwrite/fread function
library(glue) # For joining strings
library(phsmethods) # For processing/checking CHI Numbers & Formatting Postcodes
library(rstudioapi) # For safe access to RStudio API
library(stringr) # For string manipulation
library(stringi) # For more complex string manipulation
library(readxl) # Read xlsx files
library(haven) # For reading SPSS data
library(shiny) # For designing interactive Shiny App
library(DT) # For designing tables within a Shiny App
library(lubridate) # For processing/manipulation of dates
library(base64enc) # For the PHS logo within the App
library(sparkline) # For adding Sparkline Dependcies to Table
library(shinyalert) # For Shiny Notification used within the App
library(janitor) # For Data cleaning
library(openxlsx) # Read xls files
library(dplyr) # For Data Processing

####################################################
# Allows for the use of shiny alerts for notifications
####################################################

useShinyalert(force = TRUE)

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################