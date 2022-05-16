terraform {
  backend "s3" {
    bucket         = "backend-terrar"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-lock"
  }
}
