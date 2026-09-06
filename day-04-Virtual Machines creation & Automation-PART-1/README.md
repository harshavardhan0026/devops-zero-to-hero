# Day 4 – Cloud & AWS API Automation (Part 1)

## ☁️ How Do We Create Virtual Machines in the Cloud?

As an end user, I can log into the **AWS Console** and request a virtual machine.

In AWS, this virtual machine is called an **EC2 instance**.

**Console → Request EC2 → AWS creates a Server**

---

## 🚀 What If We Need 100 Servers?

Manually creating 100 servers through the console is inefficient.

Instead, a DevOps Engineer can write a **script/automation** that sends a request to the **AWS EC2 API**:

```text
Script → AWS EC2 API → Create 100 EC2 Servers
```

AWS will process the request only if it is:

**Valid → Authenticated → Authorized → Execute Request**

Then AWS returns the result, such as the newly created servers.

---

## 🔧 Ways to Automate AWS

DevOps Engineers can communicate with AWS APIs using:

* **AWS CLI** – command-line automation
* **AWS SDK (Boto3)** – Python automation
* **AWS CloudFormation (CFT)** – Infrastructure as Code
* **AWS CDK** – Infrastructure using programming languages
* **Terraform** – Infrastructure as Code

All of these ultimately interact with **cloud provider APIs**.

---

## 🌎 Why Terraform?

Terraform is powerful because the same Infrastructure-as-Code approach can manage resources across multiple cloud providers:

```text
Terraform
   ↓
AWS / Azure / GCP / Other Providers
   ↓
Infrastructure
```

### 🧠 Key Idea

> **Cloud Console = Manual request**
> **Cloud API = Programmatic request**
> **Automation/IaC = Repeatable and efficient infrastructure creation**

**DevOps goal:** Replace repetitive manual work with **automation** to improve **speed, consistency, scalability, and efficiency**.
