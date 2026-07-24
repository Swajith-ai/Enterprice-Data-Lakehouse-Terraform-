#################################################
# Local Bucket Names
#################################################

locals {

  #################################################
  # Data Lake Buckets
  #################################################

  raw_bucket_name = "${var.naming_prefix}-raw"

  processed_bucket_name = "${var.naming_prefix}-processed"

  curated_bucket_name = "${var.naming_prefix}-curated"

}

