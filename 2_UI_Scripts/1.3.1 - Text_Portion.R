########################################################################
############## Soundex and missing data ################################
########################################################################
########################################################################

###### Main panel for displaying all text ---- ######
mainPanel(
  
  ####################################################
  # Main Page Title ----
  ####################################################
  h1("Information about Soundex & Missing Data"),
  
  ####################################################
  # Soundex Information
  ####################################################
  
  h2("Soundex"),
  
  h3("NYSIIS System"),
  
  p("Firstly, the indexing system creates a phonetic representation of a name using the NYSIIS system.
     This helps to ensure a more appropriate Phonetic representation of a name is given before it is 
     transformed into a Soundex Code. The following" ,
    a("link", href="https://en.wikipedia.org/wiki/New_York_State_Identification_and_Intelligence_System"),
    "gives more details about the NYSIIS system."),
  
  h3("Soundex Code"),
  
  p("Soundex is a phonetic algorithm which indexes names based on the sound of an English pronouncation. For the indexer, the
    NYSIIS code for the name is transformed into a Soundex Code. A soundex code is always given in the following structure:-"),
  
  br(),
  
  p("\U2022 " , strong("ADDD") , "- where:-"),
  
  tags$ol(
    tags$li(strong("A"), "- Letter (1st Letter of Name)"), 
    tags$li(strong("D"), "- Numeric Digit (0-6)")
  ),
  
  br(),
  
  p("If an name value such as a Surname/Forename is missing, then the Soundex Code given by the indexing system is ", strong("X999"),"."),
  
  
  ####################################################
  # First Forename Information
  ####################################################
  
  h2("First Forename Initial"),
  
  p("If the value of the First Forename is missing, then the First Forename initial used by the indexing system is " , strong("X"), "."),
  
  
  ####################################################
  # Sex Information
  ####################################################
  h2("Sex"),
  
  p("If the value of the Sex is missing or an invalid value, then the sex value used by the indexing system is " , strong("9"), "."),
  
  ####################################################
  # Date Information
  ####################################################
  h2("Date of Birth and Date of Death"),
  
  p("If either variable has a missing value or an invalid date format, then the values for the dates given by the indexing system are:-"),
  
  br(),
  
  p("\U2022 ", strong("NULL") , "value - used if input date is NULL."),
  p("\U2022 ", strong("00000000") , " - used if input date is given as an invalid date format."),
  
  ####################################################
  # Postcode/Address Information
  ####################################################
  h2("Postcode & Address Variables"),
  
  h3("Postcode"),
  
  p("The App will keep all partial postcodes. If a postcode format is invalid, then small corrections can be made to it via the Indexing System."),
  
  br(),
  
  p("It should also be noted that if a non-Scottish postcode is used for any records, then a Postcode match of any kind is more unlikely. For 
    missing postcodes, a value of ", strong("NK") , "is used by the indexing system."),
  
  h3("Address"),
  
  p("The indexing system will alawys convert the address variable into a compressed format."),
  
  ####################################################
  # CHI Number Information
  ####################################################
  h2("CHI Number"),
  
  p("For a valid CHI format, the following conditions must be met"),
  
  br(),
  
  p("\U2022 Must only consist of ten digits."),
  p("\U2022 The first six digits must be in a valid ddmmyy date format."),
  p("\U2022 The tenth digit is a checksum digit of the previous nine digits"),
  
  p("If an old CHI number is used, the indexing system will always update it to the UPI (most recent CHI).")
  
)

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################
