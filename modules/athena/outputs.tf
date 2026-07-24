#################################################
# Athena Workgroup Output
#################################################

output "workgroup_name" {

  description = "Name of the Athena analytics workgroup."

  value = aws_athena_workgroup.lakehouse.name

}



#################################################
# Athena Catalog Output
#################################################

output "catalog_name" {

  description = "Name of the Athena data catalog."

  value = aws_athena_data_catalog.glue.name

}



#################################################
# Query Result Location Output
#################################################

output "query_results_location" {

  description = "S3 location where Athena stores query results."

  value = local.query_results_location

}

