########################################################################
############## Indexer Procedure Text ##################################
########################################################################
########################################################################

###### Main panel for displaying all text ---- ######
mainPanel(
  
####################################################
# Main Page Title ----
####################################################
  h1("Information about Indexer Procedure"),
  
####################################################
# Introduction
####################################################

  h2("Introduction"),
  
  p("In the Indexing system, used for CHI Seeding, the input records are compared to CHI records within five different
    blocks, which are:-"),

  br(),

  p("\U2022 ", strong("Exact Block")),
  p("\U2022 ", strong("Block A")),
  p("\U2022 ", strong("Block B")),
  p("\U2022 ", strong("Block C")),
  p("\U2022 ", strong("Block D")),

  p("A flowchart of the indexing process is given below:"),

  br(),

# Flowchart Image
tags$figure(
  class = "centerFigure",
  tags$img(
    src = "Index_Proc_Diagram.png",
    width = 600,
    alt = "Indexing System Process Flowchart"
  ),
),

####################################################
# Exact Match Linkage Procedure
####################################################

  h2("Exact Match Linkage Procedure"),

  br(),

  p("For an input record to match a CHI record exactly, the following variable conditions 
    must be met:-"),

  br(),

  p("\U2022 ", strong("Surname Soundex Match.")),
  p("\U2022 ", strong("First Forename Initial & First Forename Soundex Match.")),
  p("\U2022 ", strong("Sex Match.")),
  p("\U2022 ", strong("Date of Birth Match.")),
  
  br(),

  p("If the above conditions are satisfied, then one of the following variable conditions
     must be met:-"),

  br(),

  p("\U2022 ", strong("Second Forename Initial Match.")),
  p("\U2022 ", strong("Previous Surname Match.")),
  p("\U2022 ", strong("Postcode Match.")),
  p("\U2022 ", strong("CHI Number Match.")),

  br(),

####################################################
# Block A Linkage Procedure
####################################################

  h2("Block A Linkage Procedure"),

  br(),
  
  p("For an input record to match a CHI record, the following variable conditions must be met:-"),

  br(),

  p("\U2022 ", strong("Surname Soundex matches CHI Surname Soundex or CHI Previous Surname Soundex.")),
  p("\U2022 ", strong("First Forename Initial Match.")),
  p("\U2022 ", strong("Sex Match.")),
  p("\U2022 ", strong("Date of Birth must match on at least one date element (year, month, day) if present. Otherwise Date of Birth can be a", strong("NULL") ,  "value.")),

  br(),

####################################################
# Block B Linkage Procedure
####################################################

  h2("Block B Linkage Procedure"),

  br(),

  p("For an input record to match a CHI record, the following variable conditions must be met:-"),

  br(),

  p("\U2022 ", strong("Previous Surname matches CHI Previous Surname Soundex or CHI Surname Soundex.")),
  p("\U2022 ", strong("First Forename Initial Match.")),
  p("\U2022 ", strong("Sex Match.")),
  p("\U2022 ", strong("Date of Birth must match on at least one date element (year, month, day) if present. Otherwise Date of Birth can be a", strong("NULL") ,  "value.")),

  br(),


####################################################
# Block C Linkage Procedure
####################################################
  
  h2("Block C Linkage Procedure"),

  br(),

  p("For an input record to match a CHI record, one of the following variable conditions must be met:-"),

  br(),

  p("\U2022 ", strong("Date of Birth Match")),
  p("\U2022 ", strong("CHI Number Match")),
  p("\U2022 ", strong("First Forename Initial and Surname Soundex Match while Sex is Missing.")),

  br(),
 
  p("The final variable condition that must be met if ", strong("Date of Birth") ,  "doesn't match is:-"),

  br(),
  
 p("\U2022 ", strong("Date of Birth must match on at least one date element (year, month, day) if present. Otherwise Date of Birth can be a", strong("NULL") ,  "value.")),

####################################################
# Block D Linkage Procedure
####################################################

  h2("Block D Linkage Procedure"),

  br(),

  p("For an input record to match a CHI record, the following variable conditions must be met:-"),

  br(),

  p("\U2022 ", strong("Surname Soundex Match.")),
  p("\U2022 ", strong("First Forename Initial Match.")),
  p("\U2022 ", strong("Sex Match.")),
  p("\U2022 ", strong("Postcode Match.")),
  p("\U2022 ", strong("Date of Birth must not Match.")),

  br(),

  p("Finally, a CHI record must match the following variable conditions in a sub-query:- "),

  br(),

  p("\U2022 ", strong("Surname Soundex Match.")),
  p("\U2022 ", strong("First Forename Initial Match.")),
  p("\U2022 ", strong("Sex must not Match.")),
  p("\U2022 ", strong("Postcode Match.")),
  p("\U2022 ", strong("Date of Birth Match."))


####################################################
# Data Visualisation - Possible Block Tab (Category Definition)
####################################################

  h2("Data Visualisation - Possible Blocks Sub-Tab (Category Definition)"),

  p("In the ", strong("Data Visualisation - Possible Blocks") ,"sub-tab, each input record is assigned a block category indicated potential blocks
  that record might be matched to as well as a summary giving a count for each block category. A definition of each block category is given below:-"),

  br(),

  p("\U2022 ", strong("Possible Exact Match (A_B_C)") , "- If it is not an exact match, potential matches may 
    be found in Block A, Block B & Block C"),

  p("\U2022 ", strong("Possible Exact Match (A_C)") , "- If it is not an exact match, potential matches may 
    be found in Block A & Block C."),

  p("\U2022 ", strong("Possible Block A_B_C Match") , "- Potential matches may be found in Block A, Block B & Block C"),

  p("\U2022 ", strong("Possible Block A_C Match") , "- Potential matches may be found in Block A & Block C."),

  p("\U2022 ", strong("Possible Block A Match") , "- This record will only have potential matches in Block A."),

  p("\U2022 ", strong("Possible Block B_C Match") , "- Potential matches may be found in Block B & Block C."),

  p("\U2022 ", strong("Possible Block B Match") , "- This record will only have potential matches in Block B."),

  p("\U2022 ", strong("Possible Block C Match") , "- This record will only have potential matches in Block C."),

  p("\U2022 ", strong("No block assigned") , "- This record has no matches."),

  )

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################
