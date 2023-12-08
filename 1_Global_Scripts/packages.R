########################################################################
############## Package Setup ###########################################
########################################################################
########################################################################

####################################################
# Load all Required Packages for shiny app
####################################################

library(tidyr)
library(data.table)
library(glue)
library(plyr)
library(phsmethods)
library(rstudioapi)
library(stringi)
library(stringr)
library(readxl)
library(haven)
library(shiny)
library(DT)
library(lubridate)
library(base64enc)
library(sparkline)
library(shinyalert)
library(janitor)
library(openxlsx)
library(dplyr)

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