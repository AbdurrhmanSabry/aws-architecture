terraform {
  backend "s3" {
    bucket         = "backend-terra"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-lock"
  }
}
