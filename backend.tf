terraform {
  backend "s3" {
    bucket         = "my-github-actions-terraform-state-bucket" 
    key            = "actions/terraform.tfstate"    # Path to the state file in S3
    region         = "ap-south-1"                 # AWS region
    dynamodb_table = "terraform-github-actions-locks"            # Name of DynamoDB table for locking
    encrypt        = true                         # Enable encryption
  }
}
