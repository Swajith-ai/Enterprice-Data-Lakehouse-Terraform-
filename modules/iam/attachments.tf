#################################################
# Glue Role Policy Attachment
#################################################

resource "aws_iam_role_policy_attachment" "glue" {

  role = aws_iam_role.glue.name

  policy_arn = aws_iam_policy.glue.arn

}

#################################################
# Lambda Role Policy Attachment
#################################################

resource "aws_iam_role_policy_attachment" "lambda" {

  role = aws_iam_role.lambda.name

  policy_arn = aws_iam_policy.lambda.arn

}

#################################################
# Athena Role Policy Attachment
#################################################

resource "aws_iam_role_policy_attachment" "athena" {

  role = aws_iam_role.athena.name

  policy_arn = aws_iam_policy.athena.arn

}

