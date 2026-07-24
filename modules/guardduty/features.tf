#################################################
# GuardDuty S3 Protection
#################################################

resource "aws_guardduty_detector_feature" "s3_protection" {


  count = var.enable_guardduty && var.enable_s3_protection ? 1 : 0



  detector_id = aws_guardduty_detector.main[0].id



  name = "S3_DATA_EVENTS"



  status = "ENABLED"

}





#################################################
# GuardDuty Malware Protection
#################################################

resource "aws_guardduty_detector_feature" "malware_protection" {


  count = var.enable_guardduty && var.enable_malware_protection ? 1 : 0



  detector_id = aws_guardduty_detector.main[0].id



  name = "EBS_MALWARE_PROTECTION"



  status = "ENABLED"

}





#################################################
# GuardDuty Kubernetes Protection
#################################################

resource "aws_guardduty_detector_feature" "kubernetes_protection" {


  count = var.enable_guardduty && var.enable_kubernetes_protection ? 1 : 0



  detector_id = aws_guardduty_detector.main[0].id



  name = "EKS_AUDIT_LOGS"



  status = "ENABLED"

}

