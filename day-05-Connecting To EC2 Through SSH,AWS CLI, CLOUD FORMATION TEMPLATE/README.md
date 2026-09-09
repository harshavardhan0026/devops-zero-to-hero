
# 🚀 Day 5 — AWS Access & Automation

> Connecting to AWS and managing AWS resources using different methods.

## Why?

Instead of doing everything manually through the AWS Console, we can use **SSH, AWS CLI, CloudFormation, and AWS APIs/Boto3** to reduce manual work and improve efficiency.

## 1. Connect to EC2 Using SSH

We can access an EC2 instance directly from our local Ubuntu/WSL machine.

### Steps

**1. Download the `.pem` key**

```text
AWS Console → EC2 → Key Pairs → Create/Download .pem key
```

**2. Copy the `.pem` file from Windows to Ubuntu/WSL**

If the key is on the Windows Desktop:

```bash
cp /mnt/c/Users/<username>/Desktop/my-key.pem ~/
```

Check:

```bash
ls ~
```

**3. Change permissions**

```bash
chmod 400 ~/my-key.pem
```

**4. Connect to EC2**

```bash
ssh -i ~/my-key.pem ubuntu@<PUBLIC-IP>
```

Example:

```bash
ssh -i ~/my-key.pem ubuntu@54.xx.xx.xx
```

### Flow

```text
Windows / Local Machine
        ↓
     Ubuntu/WSL
        ↓
   PEM Key + SSH
        ↓
    EC2 Public IP
        ↓
    EC2 Instance
```

**Purpose:** Remotely access and manage an EC2 server.

---

## 2. AWS CLI

AWS CLI allows us to interact with AWS services directly from the terminal instead of using the AWS Console.

### Check AWS CLI

```bash
aws --version
```

### Configure AWS CLI

```bash
aws configure
```

Enter:

```text
AWS Access Key ID
AWS Secret Access Key
Default Region
Output Format
```

Example:

```text
Region: ca-central-1
Output: json
```

### Test the connection

```bash
aws sts get-caller-identity
```

### Example

```bash
aws ec2 describe-instances
```

### Flow

```text
Local Terminal
      ↓
   AWS CLI
      ↓
   AWS API
      ↓
AWS Resources
```

**Benefit:** Faster, repeatable and scriptable AWS operations.

> **Security:** In real environments, prefer IAM roles and temporary credentials instead of long-lived access keys whenever possible.

---

## 3. AWS CloudFormation

CloudFormation allows us to define AWS infrastructure in a template instead of creating resources manually.

```text
CloudFormation Template
          ↓
     CloudFormation
          ↓
       AWS APIs
          ↓
    AWS Resources
```

Resources can include:

```text
EC2
VPC
S3
RDS
IAM
```

### Process

```text
Create Template
      ↓
Define Resources
      ↓
Create CloudFormation Stack
      ↓
CloudFormation Calls AWS APIs
      ↓
AWS Resources Created
```

**Benefit:** Infrastructure becomes repeatable, consistent and version-controlled.

---

## 4. AWS API / Boto3

AWS provides APIs that allow applications and scripts to interact directly with AWS services.

We can use:

```text
Shell
Python
Boto3
Other Programming Languages
```

### AWS CLI Example

```bash
aws ec2 describe-instances
```

### Python + Boto3

Install:

```bash
pip install boto3
```

Example:

```python
import boto3

ec2 = boto3.client("ec2")

response = ec2.describe_instances()

print(response)
```

### Flow

```text
Python / Shell
      ↓
   AWS API
      ↓
 AWS Service
      ↓
AWS Resources
```

**Benefit:** Allows us to build custom automation for repetitive AWS operations.

---

## 🧠 Easy Mental Model

```text
                 AWS
                  ↑
        ┌─────────┼──────────┐
        ↓         ↓          ↓
       SSH       CLI    CloudFormation
        ↓         ↓          ↓
       EC2      AWS API    AWS APIs
                  ↑
             Shell / Boto3
```

## 💡 Key Takeaway

> **SSH is used to access an EC2 server. AWS CLI allows us to manage AWS from the terminal. CloudFormation allows us to define infrastructure as code. AWS APIs and Boto3 allow us to build custom automation. The overall goal is to reduce manual work, improve consistency, and increase engineering efficiency.**
