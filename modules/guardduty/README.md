# AWS GuardDuty Security Module

## Overview

The GuardDuty module provides intelligent threat detection and security monitoring for the Enterprise Data Lakehouse AWS environment.

This module creates:

- GuardDuty Detector
- Security monitoring configuration
- S3 threat protection
- Malware protection
- Optional Kubernetes protection

GuardDuty continuously analyzes AWS activity and generates security findings for suspicious behavior.

---

# Security Architecture

```
                    AWS Environment


 IAM Activity
 S3 Access
 Network Activity
 Compute Activity
 API Requests


          |
          |
          ▼


       GuardDuty


          |
          |
          ▼


   Threat Findings


          |
          |
          ▼


 Security Response Team

```

---

# Module Structure

```
guardduty/

├── variables.tf
├── locals.tf
├── detector.tf
├── features.tf
├── outputs.tf
└── README.md

```

---

# File Description

---

## variables.tf

Defines GuardDuty configuration.

Inputs:

| Variable | Purpose |
|---|---|
| enable_guardduty | Enable or disable GuardDuty |
| enable_s3_protection | Monitor S3 activity |
| enable_malware_protection | Detect malicious files |
| enable_kubernetes_protection | Enable EKS monitoring |
| common_tags | Resource metadata |

---

# locals.tf

Creates module metadata.

Example:

```
Component = Threat Detection

```

Used for:

- Resource identification
- Cost allocation
- Governance

---

# detector.tf

Creates the GuardDuty detector.

Resource:

```
aws_guardduty_detector

```

The detector is the central security analysis engine.

---

# Finding Publishing

Configured frequency:

```
FIFTEEN_MINUTES

```

Benefits:

- Faster visibility
- Near real-time detection
- Improved incident response

---

# features.tf

Enables additional protection capabilities.

---

# S3 Protection

Feature:

```
S3_DATA_EVENTS

```

Monitors:

- Object access patterns
- Suspicious API calls
- Potential data exposure

Example:

```
Unexpected S3 Access


        |
        ▼


GuardDuty Analysis


        |
        ▼


Security Finding

```

---

# Malware Protection

Feature:

```
EBS_MALWARE_PROTECTION

```

Detects:

- Malicious files
- Suspicious workloads
- Malware activity

Flow:

```
File Activity


      |
      ▼


GuardDuty Scan


      |
      ▼


Finding Generated

```

---

# Kubernetes Protection

Feature:

```
EKS_AUDIT_LOGS

```

Optional capability.

Enabled when:

```
enable_kubernetes_protection = true

```

Used for:

- Kubernetes API monitoring
- Container security
- Cluster activity analysis

---

# Threat Detection Flow

```
AWS Resource Activity


          |
          ▼


GuardDuty Analysis


          |
          ▼


Threat Intelligence Matching


          |
          ▼


Security Finding


          |
          ▼


Incident Response

```

---

# Example Security Scenarios

---

## Suspicious IAM Activity

Scenario:

```
Unexpected IAM API Call


        |
        ▼


GuardDuty Detection


        |
        ▼


Security Finding

```

Response:

- Investigate user
- Review CloudTrail logs
- Disable compromised credentials

---

## Suspicious S3 Access

Scenario:

```
Unknown Identity


        |
        ▼


Accesses Sensitive Bucket


        |
        ▼


GuardDuty Alert

```

Response:

- Review permissions
- Check IAM policies
- Investigate access history

---

## Malware Detection

Scenario:

```
Malicious File


        |
        ▼


GuardDuty Scan


        |
        ▼


Threat Finding

```

Response:

- Isolate workload
- Remove malware
- Review activity logs

---

# Integration With Existing Modules

---

# CloudTrail

CloudTrail provides:

```
Audit History

```

GuardDuty provides:

```
Threat Analysis

```

Together:

```
CloudTrail

     +

GuardDuty

     =

Security Visibility

```

---

# CloudWatch

Used for:

- Monitoring findings
- Operational dashboards
- Security metrics

---

# SNS

Can distribute alerts:

```
GuardDuty Finding

        |
        ▼

SNS Topic

        |
        ▼

Security Team Notification

```

---

# Security Controls Implemented

✅ Threat detection enabled  
✅ S3 monitoring enabled  
✅ Malware protection enabled  
✅ Finding publishing configured  
✅ Optional Kubernetes support  
✅ Terraform modular design  

---

# Operational Workflow

```
AWS Activity


      |
      ▼


GuardDuty Monitoring


      |
      ▼


Security Finding


      |
      ▼


Investigation


      |
      ▼


Remediation

```

---

# Future Enhancements

Possible improvements:

- Security Hub integration
- Automated remediation workflows
- EventBridge notifications
- SOAR integration
- Custom threat intelligence feeds
- Automated ticket creation

---

# Conclusion

The GuardDuty module adds intelligent security monitoring to the Enterprise Data Lakehouse platform.

Together with:

- IAM security controls
- CloudTrail auditing
- KMS encryption
- CloudWatch monitoring
- SNS notifications

it creates a strong foundation for a production-grade AWS security architecture.