############################################################
############################################################
#Data Summary Post Processing Section


####################################################
# Prepares tables for variable completeness and uniqueness
####################################################

source(glue("3_Server_Scripts/2.5.1 - Var_Complete_Unique_Tables.R"),  local = TRUE)$value


############################################################
# Table Visualisation
############################################################

# Generate a summary of the App data
output$process_summary_dist <- renderPrint({
  
  # Ensures input data is provided
  shiny::validate(
    need(!is.null(App_data$values), "")
  )
  
  # Data Summary ----
  summary(App_data$values)
  
})

# Generate completeness table
output$output_var_completeness <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  output_var_completeness <- Table_Render(output_data_comp_check$values,cb)
  
})

# Generate uniqueness table
output$output_var_uniqueness <- DT::renderDataTable({
  
  cb <- htmlwidgets::JS('function(){debugger;HTMLWidgets.staticRender();}')
  
  # Data visualisation is achieved via a function inside a external script.
  output_var_uniqueness <- Table_Render(output_data_unique_check$values,cb)
  
})