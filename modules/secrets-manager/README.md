# AWS Secrets Manager Module

## Overview

The Secrets Manager module provides secure storage and controlled access for sensitive application configuration values within the Enterprise Data Lakehouse AWS environment.

This module creates:

- AWS Secrets Manager Secret
- Secret Version
- KMS encryption integration
- Recovery protection
- Secure Terraform outputs

Secrets are protected from exposure in application code, configuration files, and Terraform outputs.

---

# Security Architecture

```
                 Application


                     |
                     ▼


              IAM Authorization


                     |
                     ▼


          AWS Secrets Manager


                     |
                     ▼


              KMS Encryption


                     |
                     ▼


          Encrypted Secret Value


```

---

# Module Structure

```
secrets-manager/

├── variables.tf
├── locals.tf
├── secrets.tf
├── outputs.tf
└── README.md

```

---

# File Description

---

## variables.tf

Defines secret configuration inputs.

Inputs:

| Variable | Purpose |
|---|---|
| secret_name | Secret identifier |
| secret_description | Secret purpose |
| secret_value | Sensitive value |
| kms_key_arn | Encryption key |
| recovery_window_days | Delete recovery period |
| enable_secret | Enable creation |
| common_tags | Resource metadata |

---

# locals.tf

Defines module metadata.

Example:

```
Component = Secrets Management

```

Used for:

- Resource organization
- Governance
- Cost allocation

---

# secrets.tf

Creates the Secrets Manager resources.

Resources:

```
aws_secretsmanager_secret

aws_secretsmanager_secret_version

```

---

# Secret Storage Flow

```
Secret Value


      |
      ▼


Secrets Manager


      |
      ▼


KMS Encryption


      |
      ▼


Encrypted Storage

```

---

# Encryption

Secrets are encrypted using a customer-managed KMS key.

Flow:

```
Application Secret


       |
       ▼


AWS KMS


       |
       ▼


Encrypted Secret Object

```

Benefits:

- Centralized key control
- Audit visibility
- Strong encryption protection

---

# Secret Version Management

Secrets Manager stores values as versions.

Example:

```
Secret

 |
 +-- Version 1

 |
 +-- Version 2

 |
 +-- Version 3

```

Benefits:

- Controlled updates
- Version history
- Safer credential rotation

---

# Recovery Protection

Configured using:

```
recovery_window_in_days

```

Default:

```
30 days

```

Deletion workflow:

```
Delete Request


      |
      ▼


Recovery Period


      |
      ▼


Permanent Removal

```

Protects against accidental deletion.

---

# Access Architecture

```
Application


      |
      ▼


IAM Role


      |
      ▼


Secrets Manager


      |
      ▼


KMS Permission


      |
      ▼


Secret Retrieval

```

---

# IAM Integration

Applications should access secrets using IAM permissions.

Example permissions:

```
secretsmanager:GetSecretValue

kms:Decrypt

```

Best practice:

- Grant least privilege
- Restrict secret access
- Avoid hardcoded credentials

---

# Security Best Practices

---

## Never Store Secrets In Code

Avoid:

```
password = "example123"

```

Use:

```
Secrets Manager Reference

```

---

## Encrypt Everything

Secrets are protected using:

```
AWS KMS Customer Managed Key

```

---

## Audit Secret Access

Secret usage can be monitored through:

```
CloudTrail

```

Example:

```
Secret Retrieved

       |
       ▼

CloudTrail Event

       |
       ▼

Security Review

```

---

## Rotate Sensitive Credentials

Future enhancements:

- Automatic rotation
- Lambda rotation functions
- Credential lifecycle management

---

# Integration With Existing Modules

---

# KMS Module

Provides:

```
Encryption Key

```

Used for:

```
Secrets Manager Encryption

```

---

# IAM Module

Controls:

```
Who can access secrets

```

---

# CloudTrail Module

Provides:

```
Secret Access Audit History

```

---

# GuardDuty Module

Provides:

```
Threat Detection

```

---

# Operational Workflow

```
Secret Created


      |
      ▼


Encrypted By KMS


      |
      ▼


Stored In Secrets Manager


      |
      ▼


Application Requests Secret


      |
      ▼


IAM Authorization


      |
      ▼


Secret Retrieved Securely

```

---

# Security Controls Implemented

✅ Encrypted secret storage  
✅ Customer-managed KMS integration  
✅ Sensitive Terraform handling  
✅ Recovery protection  
✅ IAM-controlled access  
✅ Audit-ready architecture  

---

# Future Enhancements

Possible improvements:

- Automatic secret rotation
- Lambda rotation workflows
- Cross-account secret sharing
- Secret replication
- AWS Config compliance checks
- Security Hub integration

---

# Conclusion

The Secrets Manager module provides secure credential management for the Enterprise Data Lakehouse platform.

Together with:

- IAM access control
- KMS encryption
- CloudTrail auditing
- GuardDuty monitoring

it establishes a secure foundation for production AWS workloads.