# KMS Module

## Overview

The **KMS (Key Management Service)** module provisions a centralized **Customer Managed Key (CMK)** that provides encryption for the Enterprise Data Lakehouse infrastructure.

This module creates an AWS KMS key with automatic key rotation enabled and associates a friendly alias with the key. The resulting key is used by multiple AWS services to encrypt data at rest and to satisfy enterprise security and compliance requirements.

By centralizing encryption into a dedicated module, other Terraform modules can securely consume the KMS key without needing to manage encryption resources themselves.

---

# Architecture

```text
                        AWS KMS

              +------------------------+
              | Customer Managed Key   |
              |                        |
              | Key Rotation Enabled   |
              | 30-Day Deletion Window |
              | Tagged                 |
              +-----------+------------+
                          |
                          ▼
                 +----------------+
                 |   KMS Alias    |
                 +----------------+
                          |
                          ▼
       +-------------------------------------------+
       | Enterprise AWS Services                   |
       |-------------------------------------------|
       | Amazon S3                                |
       | AWS Glue                                 |
       | AWS Secrets Manager                      |
       | AWS CloudTrail                           |
       | Amazon Athena                            |
       | Future Enterprise Workloads              |
       +-------------------------------------------+
```

---

# Resources Created

This module provisions the following AWS resources:

| Resource                     | Purpose                                  |
| ---------------------------- | ---------------------------------------- |
| AWS KMS Customer Managed Key | Encrypts enterprise resources            |
| AWS KMS Alias                | Provides a friendly name for the KMS key |

---

# Module Features

* Creates a Customer Managed KMS Key (CMK)
* Enables automatic annual key rotation
* Supports configurable deletion window (7–30 days)
* Creates a human-readable alias
* Applies consistent enterprise resource tagging
* Designed for reuse across multiple Terraform modules
* Follows AWS security best practices
* Supports Infrastructure as Code (IaC)

---

# Directory Structure

```text
kms/
│
├── variables.tf
├── main.tf
├── outputs.tf
└── README.md
```

---

# File Descriptions

## variables.tf

Defines all configurable inputs for the KMS module, including descriptions, aliases, deletion window, naming prefix, and common tags.

---

## main.tf

Creates:

* Customer Managed KMS Key
* KMS Alias

Configures:

* Automatic key rotation
* Deletion window
* Resource tags

---

## outputs.tf

Exports:

* KMS Key ID
* KMS Key ARN
* KMS Alias

These outputs are consumed by downstream modules.

---

# Input Variables

| Variable                | Type        | Description                                  |
| ----------------------- | ----------- | -------------------------------------------- |
| kms_key_description     | string      | Description of the KMS key                   |
| kms_alias               | string      | Alias assigned to the KMS key                |
| deletion_window_in_days | number      | Number of days before scheduled key deletion |
| enable_key_rotation     | bool        | Enables automatic key rotation               |
| naming_prefix           | string      | Prefix used for naming resources             |
| common_tags             | map(string) | Common tags applied to all resources         |

---

# Outputs

| Output      | Description                       |
| ----------- | --------------------------------- |
| kms_key_id  | Unique ID of the KMS key          |
| kms_key_arn | ARN of the KMS key                |
| kms_alias   | Alias associated with the KMS key |

---

# Example Usage

```terraform
module "kms" {

  source = "./modules/kms"

  kms_key_description     = "Enterprise Data Lakehouse Encryption Key"

  kms_alias               = "alias/enterprise-data-lakehouse-dev"

  deletion_window_in_days = 30

  enable_key_rotation     = true

  naming_prefix           = local.naming_prefix

  common_tags             = local.common_tags

}
```

---

# Example Integration

The KMS module is intended to provide encryption for other infrastructure modules.

### Amazon S3

```terraform
server_side_encryption_configuration {

  rule {

    apply_server_side_encryption_by_default {

      kms_master_key_id = module.kms.kms_key_arn

      sse_algorithm = "aws:kms"

    }

  }

}
```

---

### AWS Secrets Manager

```terraform
kms_key_id = module.kms.kms_key_arn
```

---

### AWS CloudTrail

```terraform
kms_key_id = module.kms.kms_key_arn
```

---

### Future AWS Services

The same KMS key can be used by:

* Amazon Athena
* AWS Glue
* Amazon EBS
* AWS Lambda (environment variable encryption)
* Amazon RDS
* AWS Backup
* Amazon SQS
* Amazon SNS

---

# Security Best Practices

This module follows AWS security recommendations by:

* Using a Customer Managed Key instead of AWS-managed keys.
* Enabling automatic annual key rotation.
* Providing a configurable deletion window to prevent accidental key loss.
* Applying consistent resource tagging for governance.
* Exposing only the required outputs for downstream modules.
* Keeping encryption management centralized.

---

# Design Principles

The KMS module is designed with the following goals:

* Reusability
* Security
* Simplicity
* Maintainability
* Enterprise Naming Standards
* Infrastructure as Code
* Modular Architecture

---

# Integration with the Enterprise Data Lakehouse

The KMS module serves as the **encryption foundation** for the Enterprise Data Lakehouse.

All storage, logging, and secret-management components rely on this module to provide customer-managed encryption keys.

By centralizing encryption management, the infrastructure becomes easier to audit, maintain, and extend while ensuring consistent encryption standards across environments.

---

# Module Status

**Status:** Complete

This module provides the centralized encryption capability required by the Enterprise Data Lakehouse and is intended to be consumed by higher-level infrastructure modules without modification.
