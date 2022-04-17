resource "aws_lambda_function" "ses_lambda" {
  filename      = "lambda.zip"
  function_name = "send_ses_for_change_statefile"
  role          = aws_iam_role.iam_for_lambda.arn
  handler = "lambdacode.lambda_handler"
  runtime = "python3.6"
  tags = {
    NAME = "ses-send-notification"
  }
}
