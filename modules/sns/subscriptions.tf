#################################################
# Email Subscription
#################################################

resource "aws_sns_topic_subscription" "email" {


  count = var.notification_email != null ? 1 : 0



  topic_arn = aws_sns_topic.alerts.arn



  protocol = "email"



  endpoint = var.notification_email

}

