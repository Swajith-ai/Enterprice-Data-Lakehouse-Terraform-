# Networking Module

## Overview

The **Networking** module is the foundational infrastructure module for the **Enterprise Data Lakehouse Terraform Project**. It provisions a secure, scalable, and reusable networking environment within AWS using Amazon Virtual Private Cloud (VPC).

This module creates the complete network architecture required to host enterprise workloads such as AWS Glue, Lambda, Athena integrations, VPC Endpoints, and other services that require secure network communication.

The networking architecture is designed following AWS best practices by separating public and private resources into different subnets while providing secure outbound internet access for private workloads through a NAT Gateway.

---

# Architecture

```
                              Internet
                                  │
                                  ▼
                         Internet Gateway
                                  │
                  ┌───────────────┴───────────────┐
                  │                               │
         Public Route Table              Private Route Table
                  │                               │
      0.0.0.0/0 → IGW                  0.0.0.0/0 → NAT Gateway
                  │                               │
      ┌───────────┴───────────┐        ┌──────────┴──────────┐
      │                       │        │                     │
Public Subnet 1        Public Subnet 2 Private Subnet 1 Private Subnet 2
      │
      │
NAT Gateway
      │
Elastic IP
```

---

# Resources Created

This module provisions the following AWS resources:

| Resource                 | Purpose                                                |
| ------------------------ | ------------------------------------------------------ |
| Amazon VPC               | Creates the isolated virtual network                   |
| Internet Gateway         | Enables internet connectivity for public resources     |
| Public Subnets           | Hosts internet-facing resources                        |
| Private Subnets          | Hosts internal workloads                               |
| Elastic IP               | Provides a static public IP for the NAT Gateway        |
| NAT Gateway              | Enables outbound internet access for private resources |
| Public Route Table       | Routes internet traffic through the Internet Gateway   |
| Private Route Table      | Routes outbound traffic through the NAT Gateway        |
| Route Table Associations | Associates subnets with their respective route tables  |

---

# Module Features

* Creates a dedicated Amazon VPC.
* Enables DNS support and DNS hostnames.
* Creates public and private subnets across multiple Availability Zones.
* Creates an Internet Gateway.
* Creates a NAT Gateway with an Elastic IP.
* Configures public and private route tables.
* Associates route tables with their respective subnets.
* Uses common tags for consistent resource management.
* Supports reusable naming conventions.
* Designed as a reusable Terraform module.

---

# Directory Structure

```
networking/
│
├── vpc.tf
├── subnets.tf
├── gateways.tf
├── route_tables.tf
├── variables.tf
├── outputs.tf
└── README.md
```

---

# File Descriptions

## vpc.tf

Creates:

* Amazon VPC
* Internet Gateway

---

## subnets.tf

Creates:

* Public Subnet 1
* Public Subnet 2
* Private Subnet 1
* Private Subnet 2

---

## gateways.tf

Creates:

* Elastic IP
* NAT Gateway

---

## route_tables.tf

Creates:

* Public Route Table
* Private Route Table
* Internet Route
* NAT Route
* Route Table Associations

---

## variables.tf

Defines all input variables required by the networking module.

---

## outputs.tf

Exports the networking resources for use by other modules.

---

# Input Variables

| Variable             | Type         | Description                             |
| -------------------- | ------------ | --------------------------------------- |
| vpc_cidr             | string       | CIDR block for the VPC                  |
| public_subnet_cidrs  | list(string) | CIDR blocks for public subnets          |
| private_subnet_cidrs | list(string) | CIDR blocks for private subnets         |
| availability_zones   | list(string) | Availability Zones for subnet placement |
| naming_prefix        | string       | Resource naming prefix                  |
| common_tags          | map(string)  | Common tags applied to all resources    |

---

# Outputs

| Output                 | Description                |
| ---------------------- | -------------------------- |
| vpc_id                 | ID of the created VPC      |
| public_subnet_ids      | IDs of all public subnets  |
| private_subnet_ids     | IDs of all private subnets |
| internet_gateway_id    | Internet Gateway ID        |
| nat_gateway_id         | NAT Gateway ID             |
| public_route_table_id  | Public Route Table ID      |
| private_route_table_id | Private Route Table ID     |

---

# Module Dependencies

This module does not depend on any other Terraform modules.

It is the **first infrastructure module** deployed within the Enterprise Data Lakehouse architecture.

Other modules consume the outputs produced by this module.

Examples include:

* KMS
* IAM
* Glue
* Lambda
* Athena
* CloudTrail
* VPC Endpoints
* Security Groups

---

# Example Usage

```terraform
module "networking" {

  source = "./modules/networking"

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs = var.public_subnet_cidrs

  private_subnet_cidrs = var.private_subnet_cidrs

  availability_zones = var.availability_zones

  naming_prefix = local.naming_prefix

  common_tags = local.common_tags

}
```

---

# Design Principles

The networking module is designed around the following principles:

* Reusability
* Modularity
* Scalability
* High Availability
* Infrastructure as Code
* Consistent Resource Tagging
* Enterprise Naming Standards
* Separation of Public and Private Resources

---

# Integration with the Enterprise Data Lakehouse

This module serves as the networking foundation for the complete Enterprise Data Lakehouse platform.

Future modules such as AWS Glue, Lambda, Athena, and monitoring services consume networking outputs to deploy securely inside the VPC.

By isolating networking into a dedicated module, infrastructure remains modular, maintainable, and reusable across development, staging, and production environments.

---

# Module Status

**Status:** Complete

This module provides all networking resources required by the Enterprise Data Lakehouse project and is intended to be reused by higher-level infrastructure modules without modification.
