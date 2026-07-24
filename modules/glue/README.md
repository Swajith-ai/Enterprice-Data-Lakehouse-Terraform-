# AWS Glue Module

## Overview

The AWS Glue module creates the serverless data processing layer of the Enterprise Data Lakehouse architecture.

AWS Glue is responsible for:

- Data discovery
- Metadata management
- Schema detection
- ETL processing
- Data catalog management

This module connects Amazon S3 storage with analytics services such as Amazon Athena and Amazon QuickSight.

---

# Architecture

```
                  Enterprise Data Lakehouse


                         Data Sources

                              |
                              |
                              ▼


                        Raw S3 Layer


                              |
                              |
                              ▼


                       Glue Crawler


                              |
                              |
                              ▼


                  Glue Data Catalog Database


                              |
                              |
                              ▼


                      Glue ETL Job


                              |
                 -------------------------
                 |                       |
                 ▼                       ▼


          Processed Layer          Curated Layer


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

# What AWS Glue Provides

AWS Glue has three major responsibilities.

---

# 1. Glue Data Catalog

The Glue Data Catalog stores metadata about data stored in Amazon S3.

It contains:

- Database information
- Table definitions
- Column names
- Data types
- Partitions
- Storage locations

Example:

S3 file:

```
s3://enterprise-data-lakehouse-dev-raw/customers/customers.csv
```

Glue Catalog:

```
Database:

enterprise-data-lakehouse-dev-catalog


Table:

customers


Columns:

customer_id
name
email
country
```

---

# 2. Glue Crawlers

Glue Crawlers automatically discover schemas.

A crawler:

1. Reads S3 locations
2. Detects file formats
3. Identifies columns
4. Creates catalog tables

Example:

```
S3 Bucket

customers.csv


       |
       |
       ▼


Glue Crawler


       |
       |
       ▼


Glue Table

customers
```

---

# 3. Glue ETL Jobs

Glue ETL Jobs transform raw data into analytics-ready data.

Example:

Raw:

```
customer_name

JOHN SMITH
```

Transformation:

```
john smith
        |
        ▼
John Smith
```

Output:

```
customers.parquet
```

---

# Module Structure

```
glue/

├── variables.tf
├── locals.tf
├── database.tf
├── crawlers.tf
├── jobs.tf
├── security.tf
├── outputs.tf
└── README.md
```

---

# Files Explanation

---

## variables.tf

Defines module inputs.

Contains:

- AWS region
- Resource naming
- IAM role ARN
- S3 bucket names
- KMS key ARN
- Common tags

---

## locals.tf

Creates standardized resource names.

Example:

Input:

```
enterprise-data-lakehouse-dev
```

Creates:

```
enterprise-data-lakehouse-dev-catalog

enterprise-data-lakehouse-dev-raw-crawler

enterprise-data-lakehouse-dev-etl-job
```

---

## database.tf

Creates:

```
AWS Glue Catalog Database
```

The database stores metadata information.

It does not store actual files.

---

## crawlers.tf

Creates:

```
Raw Crawler

Processed Crawler
```

Responsibilities:

- Discover schemas
- Create tables
- Update metadata

---

## jobs.tf

Creates:

```
AWS Glue Spark ETL Job
```

Responsibilities:

- Read raw data
- Transform data
- Write processed data

---

## security.tf

Creates:

```
Glue Security Configuration
```

Provides:

- KMS encryption
- CloudWatch log encryption
- Secure processing

---

## outputs.tf

Exports:

- Database name
- Crawler names
- ETL job name
- Security configuration name

---

# Data Pipeline

## Step 1: Data Ingestion

Data arrives:

```
External Sources

       |
       |
       ▼

Raw S3 Bucket
```

---

## Step 2: Data Discovery

Crawler runs:

```
Raw S3

   |
   |
   ▼

Glue Crawler

   |
   |
   ▼

Glue Catalog Table
```

---

## Step 3: Data Processing

Glue ETL Job runs:

```
Raw Data

   |
   |
   ▼

Spark Transformation

   |
   |
   ▼

Processed Data
```

---

## Step 4: Analytics

Athena queries:

```
Glue Catalog

      |
      |
      ▼

Athena SQL

      |
      |
      ▼

Business Reports
```

---

# Security Architecture

```
                 AWS Glue


                    |
                    |
                    ▼


             IAM Glue Role


                    |
          --------------------
          |                  |
          ▼                  ▼


          S3              KMS


          |
          |
          ▼


    Encrypted Data Lake
```

---

# Encryption

The module uses:

```
SSE-KMS
```

for:

- CloudWatch logs
- Temporary Glue storage

Benefits:

- Data protection
- Compliance support
- Central key management

---

# Job Features

The ETL job includes:

## Glue Version

```
AWS Glue 4.0
```

Provides:

- Apache Spark 3.3
- Python 3.10
- Modern libraries

---

## Job Bookmark

Enabled:

```
--enable-job-bookmark=true
```

Purpose:

Process only new data.

Example:

First run:

```
1 million files
```

Second run:

```
Only new files
```

Benefits:

- Faster execution
- Lower cost

---

# Module Inputs

| Variable | Purpose |
|-|-|
| naming_prefix | Resource naming |
| aws_region | AWS region |
| glue_role_arn | Glue IAM permissions |
| raw_bucket_name | Raw storage |
| processed_bucket_name | Processed storage |
| curated_bucket_name | Curated storage |
| kms_key_arn | Encryption key |
| common_tags | Resource tags |

---

# Module Outputs

| Output | Purpose |
|-|-|
| database_name | Glue catalog database |
| raw_crawler_name | Raw crawler |
| processed_crawler_name | Processed crawler |
| etl_job_name | Glue ETL job |
| security_configuration_name | Glue security profile |

---

# Module Dependencies

## Requires

```
IAM Module

S3 Module

KMS Module
```

---

## Used By

```
Athena Module

Step Functions Module

CloudWatch Module
```

---

# Enterprise Best Practices Implemented

✅ Serverless ETL architecture  
✅ Separate data layers  
✅ Metadata-driven analytics  
✅ Automated schema discovery  
✅ Spark-based processing  
✅ KMS encryption  
✅ CloudWatch integration  
✅ Modular Terraform design  
✅ Environment-based deployment  
✅ Infrastructure as Code  

---

# Future Enhancements

Possible improvements:

- Glue Workflows
- Glue Data Quality Rules
- Lake Formation permissions
- Partition optimization
- Data lineage tracking
- Streaming ingestion
- Machine learning pipelines

---

# Conclusion

The AWS Glue module provides the intelligence layer of the Enterprise Data Lakehouse.

It transforms:

```
Raw Data
```

into:

```
Trusted Analytics Data
```

by combining:

- Amazon S3
- AWS Glue Catalog
- Glue Crawlers
- Glue ETL Jobs
- KMS Security

This module forms the foundation for Athena analytics and business intelligence workloads.