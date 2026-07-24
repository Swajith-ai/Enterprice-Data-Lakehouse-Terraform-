#################################################
# Secret ID
#################################################

output "secret_id" {


  description = "Secrets Manager secret ID."


  value = var.enable_secret ? aws_secretsmanager_secret.main[0].id : null

}





#################################################
# Secret ARN
#################################################

output "secret_arn" {


  description = "Secrets Manager secret ARN."


  value = var.enable_secret ? aws_secretsmanager_secret.main[0].arn : null

}





#################################################
# Secret Name
#################################################

output "secret_name" {


  description = "Secrets Manager secret name."


  value = var.enable_secret ? aws_secretsmanager_secret.main[0].name : null

}

