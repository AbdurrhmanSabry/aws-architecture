# resource "aws_iam_role" "iam_for_lambda" {
#   name = "iam_for_lambda"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "lambda.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
#  tags = {
#     Name = "sendmail-lambda-role"
#   }
# }


# resource "aws_iam_role_policy_attachment" "test-attach" {
#   role       = aws_iam_role.iam_for_lambda.name
#   policy_arn = aws_iam_policy.lambda_policy.arn
# }