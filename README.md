
---

# AWS Control Tower Controls Terraform Module

## Overview

This repository contains Terraform configurations for automating the setup and management of AWS Control Tower Controls (Guardrails). The module allows you to enforce security, compliance, and operational best practices across your AWS environment using predefined governance rules.

## Features

- **Predefined Controls**: Automatically apply detective, preventive, and proactive controls (guardrails) across your AWS accounts.
- **Customizable Enforcement**: Choose which controls to enforce on specific Organizational Units (OUs) within your AWS Organization.
- **Scalable Management**: Easily scale your control enforcement across multiple OUs.
- **Compliance and Security**: Ensure your AWS environment adheres to best practices for security and compliance through automated guardrail application.

## Prerequisites

Before using this module, ensure that you have the following:

- **Terraform**: Install [Terraform](https://www.terraform.io/downloads.html) on your local machine.
- **AWS CLI**: Ensure the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) is configured with the necessary permissions to manage AWS Control Tower and AWS Organizations.
- **AWS Control Tower**: AWS Control Tower must be deployed and active within your AWS environment.

## Repository Structure

- **main.tf**: The primary Terraform configuration file for setting up and managing Control Tower Controls.
- **variables.tf**: Defines input variables for the Terraform module, including OU names, control IDs, and other configurations.
- **outputs.tf**: Outputs the results of the Terraform execution, such as the IDs of the applied controls.
- **README.md**: This file, providing documentation for the repository.

## Usage

### Step 1: Clone the Repository

Clone this repository to your local environment:

```bash
git clone https://github.com/nitheeshp-irl/controltower_controls.git
cd controltower_controls
```

### Step 2: Configure Terraform Variables

Update the `variables.auto.tfvars` file with the specific details for your AWS Control Tower setup, such as the names of the OUs and the IDs of the controls (guardrails) you wish to enforce.

Example `variables.auto.tfvars`:

```hcl
aws_region = "us-east-2"


controls = [
  {
    control_names = [
      "AWS-GR_ENCRYPTED_VOLUMES",
      "AWS-GR_EBS_OPTIMIZED_INSTANCE",
      "AWS-GR_EC2_VOLUME_INUSE_CHECK",
      "AWS-GR_RDS_INSTANCE_PUBLIC_ACCESS_CHECK",
      "AWS-GR_RDS_SNAPSHOTS_PUBLIC_PROHIBITED",
      "AWS-GR_RDS_STORAGE_ENCRYPTED",
      "AWS-GR_RESTRICTED_COMMON_PORTS",
      "AWS-GR_RESTRICTED_SSH",
      "AWS-GR_RESTRICT_ROOT_USER",
      "AWS-GR_RESTRICT_ROOT_USER_ACCESS_KEYS",
      "AWS-GR_ROOT_ACCOUNT_MFA_ENABLED",
      "AWS-GR_S3_BUCKET_PUBLIC_READ_PROHIBITED",
      "AWS-GR_S3_BUCKET_PUBLIC_WRITE_PROHIBITED",
    ],
    organizational_unit_names = ["infra", "apps"]
  }
]
```

### Step 3: Initialize Terraform

Initialize the Terraform configuration to download the necessary providers and set up the working directory:

```bash
terraform init
```

### Step 4: Plan and Apply

Review the Terraform execution plan to see the resources that will be created and modified:

```bash
terraform plan
```

If the plan looks good, apply the configuration to enforce the controls on the specified OUs:

```bash
terraform apply
```

### Step 5: Verify

Once the Terraform apply completes, you can verify the application of the controls through the AWS Management Console under the AWS Control Tower and AWS Organizations services.

## Variables

- **ou_names**: A list of names for the Organizational Units that you want to apply the controls to.
- **control_ids**: A list of Control IDs (guardrails) that should be enforced on the specified OUs.
- **region**: The AWS region where AWS Control Tower is deployed (default: `us-east-1`).

## Outputs

- **applied_control_ids**: The IDs of the controls that were successfully applied to the OUs.

## Contributing

Contributions to this project are welcome! If you have a feature request, find a bug, or want to improve the module, please open an issue or submit a pull request. Ensure that your contributions follow the established coding standards and best practices.


## Contact

If you have any questions or need support, feel free to open an issue in the repository, and we will do our best to assist you.

---