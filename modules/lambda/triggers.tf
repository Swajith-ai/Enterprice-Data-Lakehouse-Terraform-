#################################################
# Allow S3 To Invoke Lambda
#################################################

resource "aws_lambda_permission" "s3" {


  statement_id = "AllowS3Invoke"



  action = "lambda:InvokeFunction"



  function_name = aws_lambda_function.validation.function_name



  principal = "s3.amazonaws.com"



  source_arn = "arn:aws:s3:::${var.source_bucket_name}"

}





#################################################
# S3 Event Notification
#################################################

resource "aws_s3_bucket_notification" "lambda" {


  bucket = var.source_bucket_name



  lambda_function {


    lambda_function_arn = aws_lambda_function.validation.arn



    events = [

      "s3:ObjectCreated:*"

    ]



  }


}

