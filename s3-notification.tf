resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "backend-terra"

  lambda_function {
    lambda_function_arn = aws_lambda_function.ses_lambda.arn
    events              = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*", "s3:ObjectRestore:*"]
  }

  depends_on = [aws_lambda_permission.allow_bucket]
}
resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket1"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ses_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::backend-terra"
}