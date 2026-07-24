# AWS IAM Module

## Overview

The IAM module creates and manages Identity and Access Management (IAM) resources required for the Enterprise Data Lakehouse project.

It provisions dedicated IAM roles and customer-managed IAM policies for AWS services while following the Principle of Least Privilege (PoLP).

This module is designed to be reusable, secure, and environment-independent.

---

# Architecture

```
                    IAM Module

                  +------------------+
                  |   IAM Roles      |
                  +------------------+
                           |
        +------------------+------------------+
        |                  |                  |
        ▼                  ▼                  ▼
   Glue Role          Lambda Role      Athena Role
        |                  |                  |
        ▼                  ▼                  ▼
   Glue Policy      Lambda Policy     Athena Policy
        |                  |                  |
        +------------------+------------------+
                           |
                           ▼
                  AWS Resources
```

---

# Resources Created

## IAM Roles

This module creates the following IAM roles:

| Role | Purpose |
|------|----------|
| Glue Role | Used by AWS Glue Crawlers and Glue Jobs |
| Lambda Role | Used by AWS Lambda Functions |
| Athena Role | Used by Amazon Athena |

---

## IAM Policies

This module creates the following customer-managed IAM policies.

### Glue Policy

Allows Glue to:

- Read data from Raw Bucket
- Write data to Processed Bucket
- Read Curated Bucket
- Encrypt and decrypt data using AWS KMS

---

### Lambda Policy

Allows Lambda to:

- Create CloudWatch Log Groups
- Create Log Streams
- Publish Logs
- Decrypt data using AWS KMS

---

### Athena Policy

Allows Athena to:

- Read Curated Data
- List S3 Bucket Contents
- Decrypt encrypted data using AWS KMS

---

# Files

```
iam/
├── variables.tf
├── locals.tf
├── roles.tf
├── policies.tf
├── attachments.tf
├── outputs.tf
└── README.md
```

---

# Module Inputs

| Variable | Description |
|----------|-------------|
| naming_prefix | Prefix used for naming AWS resources |
| common_tags | Common tags applied to resources |
| kms_key_arn | ARN of the KMS Key |
| raw_bucket_arn | ARN of Raw S3 Bucket |
| processed_bucket_arn | ARN of Processed S3 Bucket |
| curated_bucket_arn | ARN of Curated S3 Bucket |

---

# Module Outputs

| Output | Description |
|---------|-------------|
| glue_role_name | Glue IAM Role Name |
| glue_role_arn | Glue IAM Role ARN |
| lambda_role_name | Lambda IAM Role Name |
| lambda_role_arn | Lambda IAM Role ARN |
| athena_role_name | Athena IAM Role Name |
| athena_role_arn | Athena IAM Role ARN |

---

# Resource Flow

```
Terraform Root Module
        |
        ▼
IAM Module
        |
        +----------------------------+
        |                            |
        ▼                            ▼
Create IAM Roles             Create IAM Policies
        |                            |
        +------------+---------------+
                     |
                     ▼
          Attach Policies to Roles
                     |
                     ▼
             Export Role Outputs
                     |
                     ▼
 Glue Module | Lambda Module | Athena Module
```

---

# Security Best Practices

This module follows AWS security best practices.

- Principle of Least Privilege (PoLP)
- Customer-managed IAM policies
- Dedicated IAM role for each AWS service
- Reusable Terraform module
- Environment-independent naming
- Consistent resource tagging
- No hardcoded AWS Account IDs
- No wildcard (`*`) permissions unless required
- KMS-based encryption permissions
- Modular architecture

---

# Module Dependencies

This module depends on:

- Networking Module
- KMS Module
- S3 Module

This module is used by:

- Glue Module
- Lambda Module
- Athena Module
- Step Functions Module (future)
- CloudTrail Module (future)

---

# Future Enhancements

Possible future improvements include:

- IAM permissions boundaries
- Cross-account IAM roles
- IAM condition keys
- IAM Access Analyzer integration
- Service Control Policies (AWS Organizations)
- Fine-grained S3 access controls

---

# Notes

This module creates IAM identities and permissions only.

It does not create:

- S3 Buckets
- KMS Keys
- Glue Jobs
- Lambda Functions
- Athena Workgroups

Those resources are provisioned by their respective Terraform modules.

---

# Swajith

Enterprise Data Lakehouse Terraform Project

Developed for learning enterprise Terraform module design and AWS infrastructure best practices.