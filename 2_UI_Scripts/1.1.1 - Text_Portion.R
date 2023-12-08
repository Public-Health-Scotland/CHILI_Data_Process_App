########################################################################
############## App Instruction Text ####################################
########################################################################
########################################################################

###### Main panel for displaying all text ---- ######
mainPanel(
  
####################################################
# Main Page Title ----
####################################################
  h1("CHILLI App Instructions"),
  
  br(),
  
####################################################
# File Upload Section
####################################################

  h2("Step 1 - File Upload"),
  
  p("For a file upload, click the ", strong("Browse...") , "button within the ", strong("File Upload") ,"sub-tab 
    and choose a file. Three tables will then appear in this sub-tab, which are:-"),

  br(),

  p("\U2022 ", strong("Data Summary"), " - Gives a summary of each variable"),
  p("\U2022 ", strong("Variable Completeness"), " - Give the number of missing values & the percentage of completeness for each variable."),
  p("\U2022 ", strong("Variable Uniqueness"), " - Give the number of unique observations & the percentage of uniqueness for each variable."),

  br(),

  p("Tick the ", strong("Select Non-Seeding option"), "box if the job is for Non-Seeding"),

####################################################
# Input Date Analysis Section
####################################################

  h2("Step 2 - Input Date Analysis"),

  p("Go to the ", strong("Input Date Analysis") , "sub-tab to analysis the ", strong("DOB") ,
  "and ", strong("DOD") ,"variables to see what the potential input formats are. Go to Step 3 if both date variables are missing."),

  h3("Step 2a - DOB Analysis"),

  p("Go to the ", strong("Select Date of Birth Variable") , "selectbox, select the ", strong("DOB") , "variable 
     and press the ", strong("DOB QA Check") , "button. If successful, a prompt box will appear to say that the chosen 
     variable has been checked. A table will then appear showing the number of observations in a given date format. Skip this step if ",
     strong("DOB") , "variable is missing."),

  h3("Step 2b - DOD Analysis"),

  p("Go to the ", strong("Select Date of Death Variable") , "selectbox, select the ", strong("DOD") , "variable 
     and press the ", strong("DOD QA Check") , "button. If successful, a prompt box will appear to say that the chosen 
     variable has been checked. A table will then appear showing the number of observations in a given date format. Skip this step if ",
     strong("DOD") , "variable is missing."),

  
####################################################
# Data Process Subsection
####################################################

  h2("Step 3 - Data Processing"),
  
  p("Go to the ", strong("Pre Processing - Data Visualisation") , "sub-tab to see what variables
    exist as well as the ", strong("Sex") ,"options if the ", strong("Sex") ,"variable is given. Then go to the ",
    strong("Data Processing") ,"sub-tab to clean the data."),

  p("This sub-tab contain a list of valid indexer names with checkboxes.
     Tick all variables that exist in the input file so that renaming can occur. A list of input variables names should appear 
     below each checkbox as soon as it is ticked. Select the variables that are to be renamed."),

  p("For the ", strong("Sex") , "variable, three additional selectboxes will appear after input variable has been selected. This allows for the selection of male/female
     options as well as other options to be processed. Press the ", strong("Process") ,"button to process the data when all variables have been selected."),


  
##############################
# List of process
##############################

  h3("Step 3a - List of Data Processes"),
  
  p("The list of variable processes is as follows:-"),
  
  br(),
  
  p("\U2022 Variable Rename - Rename all variables as chosen in the checkbox"),
  p("\U2022 Serial Number - Add serial number if not provided"),
  p("\U2022 Variable Removal - Remove all variables that are not valid for the indexing system."),
  p("\U2022 Variable Reorder - Reorder variables so that the entry order is the same as the default order in the indexing system"),
  p("\U2022 CHI Number - Add a lead zero to all nine-digit CHI numbers given"),
  p("\U2022 Names - Replaces accented characters and remove non-alphabetical characters from name variables.
     If initial name contains no alphabetic characters, then it is converted to an NA value."),
  p("\U2022 Sex - Convert male, female, and other options to the correct numbers for the indexer"),
  p("\U2022 Dates - Convert Date of Birth & Date of Death into a ymd format."),
  p("\U2022 Postcode - Convert all postcodes into a pc7 format."),
  p("\U2022 Address - Merge address variables if more than one is given. If one address variable is given, it is renamed as address."),
  

####################################################
# Processed Data Analysis Subsection
####################################################

  h3("Step 4 - Processed Data Analysis"),

  p("Go to the ", strong("Data Summary after Processing") , "sub-tab. This sub-tab contains three tables, 
     which are :-"),

  br(),

  p("\U2022 ", strong("Data Summary"), " - Gives a summary of each variable"),
  p("\U2022 ", strong("Variable Completeness"), " - Give the number of missing values & the percentage of completeness for each variable."),
  p("\U2022 ", strong("Variable Uniqueness"), " - Give the number of unique observations & the percentage of uniqueness for each variable."),

  br(),

  p("All three tables given should be compared to the equivalent tables in the ", strong("File Upload") , "sub-tab. This is
     to ensure that the results of the data processing are as expected."),

  p("The ", strong("Data Visualisation - Post Processing") , "sub-tab contains the processed data frame and should be compared to the input
    data frame within the", strong("Data Visualisation - Pre Processing") , "sub-tab to ensure the data has been processed correctly."),

  p("If any mistakes have been made in the ", strong("Data Processing"), "sub-tab, then press the ", strong("Reset"), "button within the " ,
    strong("Data Visualisation - Post Processing"), "sub-tab. This resets the processed data back to the initial uploaded data. Once this has been
    done, then go back to Step 2."),


####################################################
# CHI/SERIAL Duplication check Subsection
####################################################

  h3("Step 5 - CHI/Serial Duplication Checks"),
  
  p("Go to the ", strong("Serial & CHI Number Summary Tables"), "sub-tab. There will be a table with 
     information on Serial Duplicates."),

  p("If the input file contained a CHI Number, there will be two other summary tables.
     These summary tables are for CHI Number duplication and CHI Number Validity."),

  p("If the Serial number has any duplicate entries,
     press the ", strong("Serial Duplicate Removal"), "button. This will remove the duplicate serials and replace the serial number with the row
     number of each observation."),

  p("To remove invalid CHI numbers as well as duplicate CHI numbers, press the ", strong("Invalid CHI Removal"), "button.
     Please note that CHI numbers will only be removed if the ", strong("Select Non-Seeding option"), "checkbox in the File Upload Sub-Tab has been selected."),

####################################################
# Block Check Subsection
####################################################
  
h3("Step 6 - Block Check"),

p("Go to the ", strong("Data Visualisation - Possible Blocks"), "sub-tab and press the " , strong("Block Check"),
  "button. A data visualisation and summary table will then appear. The data visualisation gives information about what block
  the input record could be in with regards to comparison with the CHI records. The summary table gives a count of the potential 
  blocks for the dataset. Additional information about the indexing system and the blocks used can be found in the ", strong("Indexer Procedure") , 
  "sub-tab"),


####################################################
# File Download Subsection
####################################################

  h3("Step 7 - File Download"),
  
  p("Press the ", strong("Download Data"), "button. If the ", strong("Select Non-Seeding option"), "checkbox has been
    selected, then press the ", strong("Download Invalid CHI Data"), "button, which allows the download of
    invalid CHI numbers and duplicate CHI numbers. All download files will appear in the download folder within File Explorer.")
  
  
  )

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################
