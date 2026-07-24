#################################################
# Glue Resource Naming
#################################################

locals {


  #################################################
  # Glue Database
  #################################################

  glue_database_name = "${var.naming_prefix}-catalog"



  #################################################
  # Glue Crawlers
  #################################################

  raw_crawler_name = "${var.naming_prefix}-raw-crawler"



  processed_crawler_name = "${var.naming_prefix}-processed-crawler"



  #################################################
  # Glue ETL Job
  #################################################

  etl_job_name = "${var.naming_prefix}-etl-job"



  #################################################
  # S3 Locations
  #################################################

  raw_s3_location = "s3://${var.raw_bucket_name}"



  processed_s3_location = "s3://${var.processed_bucket_name}"



  curated_s3_location = "s3://${var.curated_bucket_name}"

}

