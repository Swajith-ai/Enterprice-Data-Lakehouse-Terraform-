#################################################
# Glue Outputs
#################################################

output "database_name" {

  description = "Glue database name"

  value = aws_glue_catalog_database.lakehouse.name

}


output "database_arn" {

  description = "Glue database ARN"

  value = aws_glue_catalog_database.lakehouse.arn

}


#################################################
# Glue Jobs
#################################################

output "job_names" {

  description = "Glue ETL job names"

  value = []

}


#################################################
# Glue Crawlers
#################################################

output "crawler_names" {

  description = "Glue crawler names"

  value = []

}