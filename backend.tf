/*
===========================================================
Terraform Backend Configuration
=========================================================== This project is designed for learning purposes.

Normally, an enterprise deployment would store the
Terraform state remotely in an Amazon S3 bucket with
state locking using DynamoDB.

Since this project does not provision AWS resources,
the backend configuration is intentionally omitted.

Example configuration:

terraform {

  backend "s3" {

    bucket         = "enterprise-data-lakehouse-tf-state"

    key            = "terraform.tfstate"

    region         = "ap-south-1"

    dynamodb_table = "terraform-lock"

    encrypt        = true

  }

}

*/

