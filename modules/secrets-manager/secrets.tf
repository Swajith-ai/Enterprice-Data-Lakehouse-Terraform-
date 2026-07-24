#################################################
# Secrets Manager Secret
#################################################

resource "aws_secretsmanager_secret" "main" {


  count = var.enable_secret ? 1 : 0



  name = var.secret_name



  description = var.secret_description



  kms_key_id = var.kms_key_arn



  recovery_window_in_days = var.recovery_window_days



  tags = merge(

    var.common_tags,

    {

      Name = var.secret_name


      Component = local.component_name

    }

  )

}





#################################################
# Secret Value Version
#################################################

resource "aws_secretsmanager_secret_version" "main" {


  count = var.enable_secret ? 1 : 0



  secret_id = aws_secretsmanager_secret.main[0].id



  secret_string = var.secret_value

}

