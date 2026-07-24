#################################################
# Glue ETL Job
#################################################

resource "aws_glue_job" "etl" {


  name = local.etl_job_name



  role_arn = var.glue_role_arn



  description = "Enterprise Data Lakehouse ETL processing job"



  command {


    name = "glueetl"


    python_version = "3"


    script_location = "s3://${var.processed_bucket_name}/scripts/etl.py"


  }



  default_arguments = {


    "--job-language" = "python"


    "--enable-glue-datacatalog" = "true"


    "--enable-job-bookmark" = "true"


    "--raw_bucket" = var.raw_bucket_name


    "--processed_bucket" = var.processed_bucket_name


    "--curated_bucket" = var.curated_bucket_name


  }



  glue_version = "4.0"



  worker_type = "G.1X"



  number_of_workers = 2



  timeout = 60



  max_retries = 1



  tags = merge(

    var.common_tags,

    {

      Name = local.etl_job_name

      Component = "Glue ETL"

    }

  )

}

