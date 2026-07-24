# AWS CloudTrail Audit Module

## Overview

The CloudTrail module provides audit logging and compliance visibility for the Enterprise Data Lakehouse AWS environment.

This module creates:

- CloudTrail Trail
- Dedicated S3 Audit Bucket
- Encryption configuration
- Bucket security policy
- Audit log lifecycle management

It captures AWS account activity for:

- Security investigations
- Compliance audits
- Operational troubleshooting
- Change tracking

---

# Architecture

```
                     AWS Account


 IAM Changes
 S3 Actions
 Lambda Updates
 Glue Changes
 Network Changes
 Resource Modifications


              |
              |
              ▼


          CloudTrail


              |
              |
              ▼


       KMS Encryption


              |
              |
              ▼


       S3 Audit Bucket


              |
              |
              ▼


     Security / Compliance Team

```

---

# Module Structure

```
cloudtrail/

├── variables.tf
├── locals.tf
├── s3.tf
├── trail.tf
├── outputs.tf
└── README.md

```

---

# File Description

---

## variables.tf

Defines CloudTrail configuration inputs.

Inputs:

| Variable | Purpose |
|---|---|
| naming_prefix | Resource naming standard |
| audit_bucket_name | S3 destination for logs |
| kms_key_arn | Encryption key |
| retention_days | Log retention period |
| enable_multi_region | Enable regional auditing |
| common_tags | Resource metadata |

---

# locals.tf

Creates standardized resource names.

Example:

Input:

```
enterprise-data-lakehouse-prod

```

Generated:

```
enterprise-data-lakehouse-prod-audit-trail

```

Benefits:

- Consistent naming
- Environment support
- Easier operations

---

# s3.tf

Creates the CloudTrail audit storage layer.

Resources:

```
S3 Bucket

Bucket Versioning

Encryption

Public Access Block

Lifecycle Policy

Bucket Policy

```

---

# Audit Bucket Security

The audit bucket provides:

## Encryption

Uses:

```
AWS KMS Encryption

```

Flow:

```
CloudTrail Log

       |
       ▼

KMS Key

       |
       ▼

Encrypted S3 Object

```

---

## Public Access Protection

Enabled:

```
Block Public ACLs

Block Public Policies

Ignore Public ACLs

Restrict Public Buckets

```

Audit logs remain private.

---

## Versioning

Enabled to protect records.

Example:

```
Audit Log Version 1

Audit Log Version 2

Audit Log Version 3

```

Useful for:

- Investigation
- Evidence preservation
- Recovery

---

# trail.tf

Creates the CloudTrail trail.

Resource:

```
aws_cloudtrail

```

---

# Captured Events

The trail records:

## Management Events

Examples:

```
Create IAM User

Delete S3 Bucket

Update Lambda Function

Modify Security Group

```

---

## Global Service Events

Captured services:

```
IAM

STS

CloudFront

Route53

```

---

# Multi Region Logging

Enabled by default.

Benefits:

- Centralized auditing
- Regional visibility
- Better compliance coverage

Example:

```
ap-south-1

us-east-1

eu-west-1

```

All activities are recorded.

---

# Log File Validation

Enabled:

```
enable_log_file_validation = true

```

Provides integrity verification.

Purpose:

Ensures:

```
Audit Records

      |
      ▼

Not Modified

      |
      ▼

Trusted Evidence

```

---

# Complete Audit Flow

```
AWS User Action


        |
        ▼


AWS API Request


        |
        ▼


CloudTrail


        |
        ▼


KMS Encryption


        |
        ▼


S3 Audit Storage


        |
        ▼


Security Investigation

```

---

# Integration With Other Modules

---

# KMS Module

CloudTrail uses:

```
KMS Key ARN

```

Purpose:

- Encrypt audit records
- Protect sensitive logs

---

# S3 Module

Uses similar security standards:

- Encryption
- Lifecycle management
- Public access blocking

---

# IAM Module

CloudTrail supports visibility into:

- Role usage
- Policy changes
- Permission modifications

---

# Security Use Cases

---

## Unauthorized Access Investigation

Example:

```
Unknown API Call

        |
        ▼

CloudTrail Event

        |
        ▼

Identify User / Role

        |
        ▼

Security Review

```

---

## Resource Change Tracking

Example:

```
Production S3 Bucket Changed

        |
        ▼

CloudTrail Records Event

        |
        ▼

Audit Review

```

---

## Compliance Evidence

CloudTrail provides:

- User activity history
- Resource changes
- Security records

Useful for:

- Internal audits
- Compliance reviews
- Governance

---

# Operational Workflow

```
AWS Environment


        |
        ▼


CloudTrail Captures Events


        |
        ▼


Logs Stored in S3


        |
        ▼


Security Team Reviews Events


        |
        ▼


Incident Response

```

---

# Security Controls Implemented

✅ Multi-region audit logging  
✅ Encrypted audit storage  
✅ KMS integration  
✅ Log integrity validation  
✅ Private S3 bucket  
✅ Lifecycle management  
✅ Secure CloudTrail policy  

---

# Future Enhancements

Possible improvements:

- CloudTrail Lake integration
- Athena queries on audit logs
- Security Hub integration
- Automated compliance reports
- EventBridge alerting
- Automated remediation workflows

---

# Conclusion

The CloudTrail module provides the audit foundation for the Enterprise Data Lakehouse platform.

Together with:

- IAM controls
- KMS encryption
- CloudWatch monitoring
- GuardDuty detection

it establishes a secure, traceable, and production-ready AWS environment.