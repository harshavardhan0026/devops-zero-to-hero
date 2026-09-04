# 🚀 Day 3 — How Work Reaches DevOps

> Understanding how requirements move through an organization, how Jira tracks the work, and where DevOps fits.

## Real-World Example

Imagine we work on **Amazon Fresh**.

Customers give feedback:

* Deliver groceries within **15 minutes**
* Add **Cash on Delivery**

The requirement doesn't come directly to DevOps. It moves through different roles.

## Roles & Flow

```text
Customer / Business
        ↓
BA → Gathers requirements
        ↓
PM → Prioritizes requirements
        ↓
PO → Creates Epics / Stories / Tasks
        ↓
Solution Architect → HLD / LLD
        ↓
      Scrum Team
   ┌────┼────┬────┐
   ↓    ↓    ↓    ↓
  Dev   QE  DevOps DBA
```

### Simple Role Understanding

* **BA** → Collects and documents requirements
* **PM** → Prioritizes requirements
* **PO** → Creates/manages Epics, Stories and Tasks
* **Solution Architect** → Designs the technical solution (HLD/LLD)
* **Developer** → Develops the application and uses Git
* **QE** → Tests the application
* **DevOps** → Infrastructure, automation, CI/CD, deployment, environments, etc.
* **DBA** → Database-related work
* **SRE** → Reliability, monitoring, metrics and alerts

## How DevOps Gets Work

DevOps does **not normally get the original business requirement directly**.

```text
Business Requirement
        ↓
Epic
        ↓
User Story
        ↓
Technical Requirement
        ↓
Dev / QE / DevOps / DBA Work
```

For example, a developer working on **Cash on Delivery** may identify a need for:

```text
Infrastructure
Terraform
Docker
Kubernetes
CI/CD
Deployment Environment
```

Those requirements can become **DevOps stories/tasks**.

DevOps can also receive work from architects, QE, SRE, security teams, or identify automation improvements themselves.

> **Dev and QE have their own work. DevOps does not solve their stories; DevOps provides the infrastructure, automation, CI/CD, and deployment support they need.**

## How DevOps Improves the SDLC

If a process takes months because of manual development, testing, infrastructure setup and deployment:

```text
Manual Work
    ↓
More Time + More Errors
    ↓
Automation
    ↓
Faster + Consistent Delivery
    ↓
Better SDLC Efficiency
```

DevOps automates things like:

* Builds
* Testing
* Infrastructure
* Deployments
* Containerization
* Monitoring

This improves **delivery speed, reliability, quality and developer productivity**.

## Jira & Scrum

**Jira** is used to track requirements, Epics, Stories, Tasks, Bugs and progress.

```text
Backlog
   ↓
Sprint Planning
   ↓
Sprint (usually 2–3 weeks)
   ↓
Work by Dev / QE / DevOps / DBA
   ↓
Done
```

### Backlog Refinement

The team reviews upcoming work, clarifies requirements, breaks down work, estimates it and prepares it for future sprints.

### Jira Workflow

```text
Backlog → To Do → In Progress → Done
```

At the end of a sprint, the team may have a **Sprint Review** and **Retrospective** to review the work and improve the way the team works.

## 🧠 Day 3 Mental Model

```text
Customer
   ↓
BA → Requirements
   ↓
PM → Prioritize
   ↓
PO → Epics / Stories
   ↓
Architect → HLD / LLD
   ↓
Scrum Team
   ↓
Dev ──→ Code
QE  ──→ Test
DevOps ─→ Infrastructure / Automation / CI-CD
DBA ──→ Database
   ↓
Production
   ↓
Customer
```

## 💡 Key Takeaway

> **Business requirements are gradually converted into technical work. Jira helps track that work through the backlog and sprints. DevOps supports the engineering team with infrastructure, automation, CI/CD, deployment and monitoring, helping the organization deliver software faster and more reliably.**
