#################################################
# CloudTrail Trail
#################################################

resource "aws_cloudtrail" "main" {


  name = local.trail_name



  s3_bucket_name = aws_s3_bucket.audit.id



  kms_key_id = var.kms_key_arn



  include_global_service_events = true



  is_multi_region_trail = var.enable_multi_region



  enable_log_file_validation = true



  event_selector {


    read_write_type = "All"



    include_management_events = true



  }



  tags = merge(

    var.common_tags,

    {

      Name = local.trail_name


      Component = local.component_name

    }

  )

}

