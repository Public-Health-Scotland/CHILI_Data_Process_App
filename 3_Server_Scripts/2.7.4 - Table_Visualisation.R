########################################################################
############## Table Visualisation #####################################
########################################################################
########################################################################

####################################################
# Serial Duplicate Table
####################################################

output$Serial_Duplicates <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  Serial_Duplicates <- Table_Render(Serial_Chk$values,cb)
  
})

####################################################
# CHI Duplicate Table
####################################################

output$CHI_Duplicates <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  CHI_Duplicates <- Table_Render(CHI_Number_Dup_Chk$values,cb)
  
})

####################################################
# CHI Validity Table
####################################################

output$CHI_Validity <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  CHI_Validity <- Table_Render(CHI_Number_Validity_Chk$values,cb)
  
})

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################



