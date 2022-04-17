resource "aws_ses_email_identity" "email-notify" {
  email = "example@example.com"
}
resource "aws_ses_email_identity" "email-sender" {
  email = "example@gmaexampleil.com"
}