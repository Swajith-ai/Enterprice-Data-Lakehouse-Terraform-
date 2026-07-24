# AWS SNS Notification Module

## Overview

The SNS module provides the notification and alerting communication layer for the Enterprise Data Lakehouse platform.

This module creates:

- SNS Topic
- SNS Topic Policy
- Email Subscriptions
- Notification Outputs

It integrates with CloudWatch alarms to notify operations teams about:

- Pipeline failures
- Lambda failures
- Glue job failures
- Step Functions workflow failures

---

# Architecture

```
                 Enterprise Data Lakehouse


 Lambda
   |
   |
 Glue
   |
   |
 Step Functions


        |
        ▼


   CloudWatch Monitoring


        |
        ▼


    CloudWatch Alarm


        |
        ▼


       SNS Topic


        |
        ▼


   Email Notification


        |
        ▼


 Operations Team

```

---

# Module Structure

```
sns/

├── variables.tf
├── locals.tf
├── topic.tf
├── subscriptions.tf
├── outputs.tf
└── README.md

```

---

# File Description

---

## variables.tf

Defines SNS module inputs.

Inputs:

| Variable | Description |
|---|---|
| naming_prefix | Resource naming standard |
| notification_email | Email destination for alerts |
| common_tags | Resource tags |

---

# locals.tf

Creates reusable names.

Example:

Input:

```
enterprise-data-lakehouse-prod
```

Generated:

```
enterprise-data-lakehouse-prod-alerts

```

Benefits:

- Consistent naming
- Easier environment management
- Better operational visibility

---

# topic.tf

Creates the SNS notification topic.

Resource:

```
aws_sns_topic

```

Example:

```
enterprise-data-lakehouse-prod-alerts

```

Purpose:

Acts as the central notification channel.

---

# SNS Topic Policy

The topic policy allows CloudWatch to publish messages.

Flow:

```
CloudWatch Alarm

        |
        ▼

SNS Topic Policy

        |
        ▼

SNS Publish Permission

```

Security principle:

- Allow only required AWS services
- Follow least privilege access
- Restrict publishing permissions

---

# subscriptions.tf

Creates email subscriptions.

Example:

```
CloudWatch Alarm

        |
        ▼

SNS Topic

        |
        ▼

data-team@example.com

```

---

# Subscription Behavior

SNS email subscriptions require confirmation.

Process:

```
Terraform Apply

        |
        ▼

SNS sends confirmation email

        |
        ▼

User confirms subscription

        |
        ▼

Notifications enabled

```

---

# outputs.tf

Exports SNS resources.

Outputs:

| Output | Purpose |
|---|---|
| topic_arn | Used by CloudWatch alarms |
| topic_name | Operational reference |
| subscription_arn | Subscription tracking |

---

# Integration With CloudWatch

The SNS module connects with CloudWatch alarms.

Example:

```
CloudWatch Alarm


       |
       |
       ▼


sns_topic_arn


       |
       |
       ▼


SNS Topic


       |
       |
       ▼


Email Alert

```

---

# Alert Examples

---

## Lambda Failure

Scenario:

```
Lambda Processing Failed

        |
        ▼

CloudWatch Alarm

        |
        ▼

SNS Notification

        |
        ▼

Engineer Email

```

---

## Glue ETL Failure

Scenario:

```
Glue Job Failed

        |
        ▼

CloudWatch Alarm

        |
        ▼

SNS Topic

        |
        ▼

Operations Alert

```

---

## Step Functions Failure

Scenario:

```
Workflow Execution Failed

        |
        ▼

CloudWatch Alarm

        |
        ▼

SNS Alert

```

---

# Security Considerations

The module follows:

## Least Privilege

Only required services can publish.

---

## Resource Tagging

Resources include:

```
Project

Environment

ManagedBy

Component

```

---

## Controlled Access

SNS policies restrict:

- Publishers
- Subscribers
- Allowed actions

---

# Environment Usage

Example:

## Development

```
notification_email = null

```

No email notifications.

---

## Production

```
notification_email =
"operations@example.com"

```

Operational alerts enabled.

---

# Operational Workflow

```
Production Pipeline


        |
        ▼


Failure Occurs


        |
        ▼


CloudWatch Detects Issue


        |
        ▼


Alarm Triggered


        |
        ▼


SNS Publishes Alert


        |
        ▼


Operations Team Responds

```

---

# Enterprise Features Implemented

✅ Central alerting topic  
✅ CloudWatch integration  
✅ Email notifications  
✅ Secure topic policy  
✅ Environment-based subscriptions  
✅ Terraform modular design  
✅ Reusable outputs  

---

# Future Enhancements

Possible improvements:

- SMS notifications
- Slack integration
- Microsoft Teams integration
- PagerDuty integration
- Multiple subscriber groups
- Dead-letter queue support
- Automated incident response

---

# Conclusion

The SNS module provides the communication backbone for the Enterprise Data Lakehouse monitoring system.

Combined with:

- CloudWatch Logs
- CloudWatch Metrics
- CloudWatch Alarms

SNS enables reliable operational notifications and improves production reliability.