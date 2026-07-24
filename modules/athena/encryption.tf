#################################################
# Athena Encryption Configuration
#################################################

resource "aws_athena_workgroup" "encryption" {


  name = "${var.naming_prefix}-athena-encryption"



  configuration {


    result_configuration {


      encryption_configuration {


        encryption_option = "SSE_KMS"


        kms_key_arn = var.kms_key_arn


      }


    }


  }



  tags = merge(

    var.common_tags,

    {

      Name = "${var.naming_prefix}-athena-encryption"

      Component = "Athena Encryption"

    }

  )

}

