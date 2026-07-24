#################################################
# SNS Topic
#################################################

resource "aws_sns_topic" "alerts" {


  name = local.topic_name



  display_name = local.topic_name



  tags = merge(

    var.common_tags,

    {

      Name = local.topic_name


      Component = local.component_name

    }

  )

}





#################################################
# SNS Topic Policy
#################################################

resource "aws_sns_topic_policy" "alerts" {


  arn = aws_sns_topic.alerts.arn



  policy = jsonencode({


    Version = "2012-10-17"



    Statement = [



      {

        Sid = "AllowCloudWatchPublish"



        Effect = "Allow"



        Principal = {


          Service = "cloudwatch.amazonaws.com"


        }



        Action = [


          "sns:Publish"


        ]



        Resource = aws_sns_topic.alerts.arn

      }

    ]

  })

}

