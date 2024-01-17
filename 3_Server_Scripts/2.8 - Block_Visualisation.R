########################################################################
############## Data Visualisation - Possible Blocks ####################
########################################################################
########################################################################


###################################################
# Data Initilisation ----
###################################################

block_data <- reactiveValues(values = NULL)
block_table_chk <- reactiveValues(values = NULL)


###################################################
# Block Checks ----
###################################################

source(glue("3_Server_Scripts/2.8.1 - Possible_Block_Type_Setup.R"),  local = TRUE)$value

###################################################
# Visualize Processed Data ----
###################################################

# Potential Block Type for each input record
output$Block_data <- DT::renderDataTable({

  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')

  # Data visualisation is achieved via a function inside a external script.
  Block_data <- Table_Render(block_data$values,cb)

})

# Counts for potential blocks for input dataset.
output$Block_table <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  Block_table <- Table_Render(block_table_chk$values,cb)
  
})


###################################################
###################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################
