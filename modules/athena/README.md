# Amazon Athena Module

## Overview

The Amazon Athena module provides the SQL analytics layer of the Enterprise Data Lakehouse architecture.

Amazon Athena is a serverless query engine that allows users to analyze data directly from Amazon S3 using SQL.

This module integrates:

- Amazon Athena
- AWS Glue Data Catalog
- Amazon S3
- AWS KMS
- CloudWatch Monitoring

---

# Architecture

```
                 Enterprise Data Lakehouse


                       Data Sources

                            |
                            |
                            ▼


                       Amazon S3


                            |
                            |
                            ▼


                  AWS Glue Crawlers


                            |
                            |
                            ▼


                 AWS Glue Data Catalog


                            |
                            |
                            ▼


                    Amazon Athena


                            |
                            |
                            ▼


                   SQL Analytics


                            |
                            |
                            ▼


                    QuickSight
```

---

# What is Amazon Athena?

Amazon Athena is a serverless interactive query service.

It allows users to run SQL queries directly against data stored in Amazon S3.

Example:

Data:

```
s3://enterprise-data-lakehouse-curated/sales/
```

Query:

```sql
SELECT
    customer,
    SUM(amount)
FROM sales
GROUP BY customer;
```

Athena executes the query without requiring:

- Database servers
- Infrastructure management
- Cluster provisioning

---

# Role in the Data Lakehouse

The complete data flow:

```
Raw Data

   |
   |
   ▼

Amazon S3 Raw Layer


   |
   |
   ▼

Glue Crawler


   |
   |
   ▼

Glue Catalog


   |
   |
   ▼

Glue ETL


   |
   |
   ▼

Curated Data


   |
   |
   ▼

Athena


   |
   |
   ▼

Business Analytics
```

---

# Module Structure

```
athena/

├── variables.tf
├── locals.tf
├── workgroup.tf
├── database.tf
├── encryption.tf
├── outputs.tf
└── README.md
```

---

# File Description

---

# variables.tf

Defines module inputs.

Required values:

- Naming prefix
- AWS region
- Query result bucket
- KMS key ARN
- Glue database name
- Common tags

Example:

```
enterprise-data-lakehouse-dev
```

is used to create:

```
enterprise-data-lakehouse-dev-athena-workgroup
```

---

# locals.tf

Creates reusable values.

Examples:

```
Workgroup Name:

enterprise-data-lakehouse-dev-athena-workgroup


Query Location:

s3://athena-results/athena-results/
```

Benefits:

- Consistent naming
- Less duplication
- Easier maintenance

---

# workgroup.tf

Creates the Athena Workgroup.

The Workgroup controls:

- Query execution settings
- Output location
- Encryption
- Monitoring

Features enabled:

```
CloudWatch Metrics

Encrypted Results

Enforced Configuration
```

---

# database.tf

Creates Athena Data Catalog integration.

Athena uses:

```
AwsDataCatalog
```

which connects to:

```
AWS Glue Data Catalog
```

The Glue Catalog provides:

- Tables
- Schemas
- Partitions
- S3 locations

---

# encryption.tf

Provides Athena security configuration.

Encryption method:

```
SSE-KMS
```

using:

```
Customer Managed KMS Key
```

Protected resources:

- Query output files
- Athena execution results

---

# outputs.tf

Exports Athena information.

Outputs:

```
workgroup_name

catalog_name

query_results_location
```

Other modules can consume these values.

---

# Athena Query Flow

```
                 User


                  |
                  |
                  ▼


            Athena Workgroup


                  |
                  |
                  ▼


           Glue Data Catalog


                  |
                  |
                  ▼


             S3 Data Files


                  |
                  |
                  ▼


            SQL Result


                  |
                  |
                  ▼


        Encrypted S3 Output
```

---

# Security Architecture

```
                 Athena


                    |
                    |
                    ▼


           Workgroup Controls


                    |
                    |
                    ▼


        Encrypted Query Results


                    |
                    |
                    ▼


                 AWS KMS


                    |
                    |
                    ▼


          Customer Managed Key
```

---

# Encryption

Athena query results use:

```
SSE-KMS
```

Benefits:

- Data protection
- Centralized key management
- Compliance support
- Audit capability

---

# Monitoring

Athena integrates with:

```
Amazon CloudWatch
```

Metrics include:

- Query execution count
- Query duration
- Data scanned
- Failed queries

These metrics help with:

- Performance monitoring
- Cost optimization
- Troubleshooting

---

# Module Inputs

| Variable | Description |
|---|---|
| naming_prefix | Resource naming standard |
| aws_region | AWS deployment region |
| query_results_bucket | Athena output storage |
| kms_key_arn | Encryption key |
| glue_database_name | Glue Catalog database |
| common_tags | Resource metadata |

---

# Module Outputs

| Output | Description |
|---|---|
| workgroup_name | Athena Workgroup name |
| catalog_name | Athena Catalog name |
| query_results_location | Query output S3 location |

---

# Dependencies

## Requires

```
S3 Module

Glue Module

KMS Module
```

---

## Used By

```
QuickSight Module

Monitoring Module

Step Functions Module
```

---

# Enterprise Best Practices Implemented

✅ Serverless SQL analytics  
✅ Glue Catalog integration  
✅ Encrypted query output  
✅ KMS customer-managed encryption  
✅ Centralized Workgroup control  
✅ CloudWatch monitoring  
✅ Terraform modular design  
✅ Environment-based deployment  

---

# Future Enhancements

Possible improvements:

- Athena cost controls
- Query limits
- Workgroup isolation
- Lake Formation permissions
- Partition optimization
- Result caching
- Federated queries
- Data governance policies

---

# Conclusion

The Athena module provides the analytics engine of the Enterprise Data Lakehouse.

It converts:

```
Stored Data in Amazon S3
```

into:

```
Queryable Business Intelligence Data
```

by integrating:

- Amazon S3
- AWS Glue Catalog
- Amazon Athena
- AWS KMS
- CloudWatch

This module completes the SQL analytics foundation of the data lakehouse.