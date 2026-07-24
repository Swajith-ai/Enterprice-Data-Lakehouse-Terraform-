#################################################
# QuickSight Data Source ARN
#################################################

output "datasource_arn" {


  description = "QuickSight Athena data source ARN."


  value = var.enable_quicksight ? aws_quicksight_data_source.athena[0].arn : null

}





#################################################
# QuickSight Dataset ARN
#################################################

output "dataset_arn" {


  description = "QuickSight dataset ARN."


  value = var.enable_quicksight ? aws_quicksight_data_set.main[0].arn : null

}





#################################################
# QuickSight Dataset ID
#################################################

output "dataset_id" {


  description = "QuickSight dataset identifier."


  value = var.enable_quicksight ? aws_quicksight_data_set.main[0].data_set_id : null

}

