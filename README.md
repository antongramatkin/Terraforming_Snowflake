# Terraforming_Snowflake
Short examples how to use Terraform for Snowflake

# General
This is short project for Junior Snowflake Data Engineers, who want to understand how o work with Terraform

# Task
We need to create first structure for the DWH based on Snowflake.
The things like Azure Blob Storage / AWS S3 / GCP Buckets are not part of this project.

The DWH is classic Kimball DWH and has 3 layers:
- STAGING
- CORE
- DATA MART

The task is to create objects for these Layers (eg Databases, Virtual Warehouses, Users etc) using Terraform.

Also, the 2 Environment should be implemented: Production and Testing.
Both Environments should have same structures, because we want to use Zero-Copy Cloning in the future to populate the testing Environment.
