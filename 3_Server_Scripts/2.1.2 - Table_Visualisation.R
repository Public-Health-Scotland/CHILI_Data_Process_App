########################################################################
############## Table Visualisation #####################################
########################################################################
########################################################################

####################################################
# Generate a summary table of the dataset ----
####################################################

output$upload_summary_dist <- renderPrint({
  
  summary(data())
  
})

####################################################
# Generate completeness table
####################################################

output$input_var_completeness <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  input_var_completeness <- Table_Render(input_data_comp_check$values,cb)
  
})

####################################################
# Generate uniqueness table
####################################################

output$input_var_uniqueness <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  input_var_uniqueness <- Table_Render(input_data_unique_check$values,cb)
  
})

####################################################
####################################################

########################################################################
############ End of Sub-Script #########################################
########################################################################
########################################################################