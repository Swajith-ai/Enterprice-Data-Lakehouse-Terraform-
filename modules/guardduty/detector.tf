#################################################
# GuardDuty Detector
#################################################

resource "aws_guardduty_detector" "main" {


  count = var.enable_guardduty ? 1 : 0



  enable = true



  finding_publishing_frequency = "FIFTEEN_MINUTES"

}

