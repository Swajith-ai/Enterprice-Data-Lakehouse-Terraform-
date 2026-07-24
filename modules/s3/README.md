# AWS S3 Data Lake Module

## Overview

The S3 module creates the storage layer for the Enterprise Data Lakehouse architecture.

This module provisions three separate Amazon S3 buckets representing the different stages of the data lifecycle:

- Raw Layer
- Processed Layer
- Curated Layer

The module follows enterprise cloud architecture practices including:

- Server-side encryption using AWS KMS
- Public access prevention
- Secure transport enforcement
- Lifecycle-based storage optimization
- Resource tagging
- Modular Terraform design

---

# Architecture

```
                 Enterprise Data Lake

                         S3

                          |
        ----------------------------------
        |                |               |
        ▼                ▼               ▼


    Raw Bucket     Processed Bucket   Curated Bucket


        |                |               |
        |                |               |
        ▼                ▼               ▼


  Source Data     Cleaned Data     Analytics Data


        |
        |
        ▼


    AWS Glue


        |
        |
        ▼


    Athena


        |
        |
        ▼


  QuickSight
```

---

# Data Lake Layers

## 1. Raw Bucket

The Raw bucket is the landing zone for incoming data.

Purpose:

- Store original source data
- Preserve historical data
- Maintain an immutable data source

Examples:

```
customers.csv

transactions.json

application_logs
```

Characteristics:

- Minimal modification
- Long retention period
- Archived using lifecycle policies

---

## 2. Processed Bucket

The Processed bucket stores transformed data.

AWS Glue jobs will:

- Clean data
- Remove duplicates
- Standardize formats
- Convert files into analytics-friendly formats

Examples:

```
customers.parquet

sales_cleaned.parquet
```

Characteristics:

- Intermediate processing layer
- Optimized for analytics pipelines

---

## 3. Curated Bucket

The Curated bucket contains business-ready datasets.

Used by:

- Amazon Athena
- Amazon QuickSight
- Data analysts

Examples:

```
customer_summary.parquet

monthly_sales_report.parquet
```

Characteristics:

- High-quality datasets
- Optimized for querying
- Business consumption layer

---

# Files

```
s3/

├── variables.tf
├── locals.tf
├── buckets.tf
├── encryption.tf
├── lifecycle.tf
├── policies.tf
├── outputs.tf
└── README.md
```

---

# Resources Created

## S3 Buckets

This module creates:

| Resource | Purpose |
|---|---|
| Raw Bucket | Original source data |
| Processed Bucket | Cleaned and transformed data |
| Curated Bucket | Analytics-ready data |

---

# Security Features

## Encryption

All buckets use:

```
SSE-KMS
```

Encryption is performed using the customer-managed KMS key created by the KMS module.

Benefits:

- Encryption at rest
- Central key management
- CloudTrail auditing
- Compliance support

---

## Public Access Protection

All buckets have:

```
Block Public ACLs

Ignore Public ACLs

Block Public Policies

Restrict Public Buckets
```

This prevents accidental data exposure.

---

## Secure Transport

Bucket policies enforce:

```
HTTPS Only
```

Any insecure HTTP request is denied.

---

# Lifecycle Management

## Raw Bucket

Lifecycle:

```
90 Days
    |
    ▼
STANDARD_IA


365 Days
    |
    ▼
GLACIER
```

Purpose:

Reduce storage cost while keeping historical data.

---

## Processed Bucket

Lifecycle:

```
60 Days
    |
    ▼
STANDARD_IA
```

Purpose:

Optimize intermediate storage.

---

## Curated Bucket

Old object versions are automatically removed.

Purpose:

Prevent unnecessary storage growth.

---

# Module Inputs

| Variable | Description |
|---|---|
| naming_prefix | Common naming prefix |
| aws_region | AWS deployment region |
| kms_key_arn | KMS encryption key ARN |
| common_tags | Resource tags |

---

# Module Outputs

| Output | Description |
|---|---|
| raw_bucket_name | Raw bucket name |
| raw_bucket_arn | Raw bucket ARN |
| processed_bucket_name | Processed bucket name |
| processed_bucket_arn | Processed bucket ARN |
| curated_bucket_name | Curated bucket name |
| curated_bucket_arn | Curated bucket ARN |

---

# Module Dependencies

## Depends On

```
KMS Module
```

The S3 module requires:

- Customer-managed KMS key
- Encryption key ARN


---

## Used By

```
IAM Module

Glue Module

Lambda Module

Athena Module
```

---

# Security Architecture

```
                 User/Application


                         |
                         |
                         ▼


                    IAM Policy


                         |
                         |
                         ▼


                  S3 Bucket Policy


                         |
                         |
                         ▼


                   S3 Bucket


                         |
                         |
                         ▼


                    AWS KMS


```

Access requires both IAM permission and bucket permission.

---

# Enterprise Best Practices Implemented

✅ Separate data layers  
✅ Encryption by default  
✅ Customer-managed KMS keys  
✅ Public access blocked  
✅ HTTPS-only communication  
✅ Lifecycle cost optimization  
✅ Modular Terraform architecture  
✅ Environment-independent naming  
✅ Consistent resource tagging  

---

# Future Enhancements

Possible improvements:

- S3 Access Logging
- S3 Inventory Reports
- Object Lock for compliance
- Cross-region replication
- Intelligent Tiering
- Data classification tags
- AWS Lake Formation integration

---

# Notes

This module only manages storage.

It does not create:

- Glue jobs
- Crawlers
- Databases
- Athena workgroups
- Lambda functions

Those are handled by their own Terraform modules.

---

# Swajith

Enterprise Data Lakehouse Terraform Project

Purpose:

Building a production-style AWS Data Lakehouse infrastructure using Terraform modules.