########################################################################
############## Table Visualisation #####################################
########################################################################
########################################################################

####################################################
# Generate DOB table
####################################################

output$DOB_quality <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  DOB_quality <- Table_Render(DOB_check_table$values,cb)
  
})

####################################################
# Generate DOD table
####################################################

output$DOD_quality <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  DOD_quality <- Table_Render(DOD_check_table$values,cb)
  
})

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################