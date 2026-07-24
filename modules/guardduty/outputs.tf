#################################################
# GuardDuty Detector ID
#################################################

output "detector_id" {


  description = "GuardDuty detector ID."


  value = var.enable_guardduty ? aws_guardduty_detector.main[0].id : null

}





#################################################
# GuardDuty Detector ARN
#################################################

output "detector_arn" {


  description = "GuardDuty detector ARN."


  value = var.enable_guardduty ? aws_guardduty_detector.main[0].arn : null

}





#################################################
# GuardDuty Enabled Status
#################################################

output "enabled" {


  description = "Whether GuardDuty is enabled."


  value = var.enable_guardduty

}

