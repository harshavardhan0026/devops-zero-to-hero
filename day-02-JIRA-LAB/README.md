
# Amazon Fresh — Who Creates Epic, Story & Task

```text
CUSTOMER
   ↓
BUSINESS ANALYST
   → Creates BRD
   ↓
PRODUCT OWNER / PROJECT MANAGER
   → Creates & prioritizes EPICS
   ↓
SOLUTION ARCHITECT
   → Creates HLD / LLD
   ↓
DEVELOPERS + QA
   → Start building and testing
   → Identify what infrastructure/resources they need
   ↓
STORY
   → Created by PO / Scrum team
   → Example:
     "Prepare application infrastructure"
   ↓
DEVOPS LEAD
   → Breaks the requirement into DevOps work
   → Creates / assigns TASKS
   ↓
DEVOPS ENGINEER (ME)
   → Receives assigned task
   → Implements it
```

## Our Amazon Fresh Example

**Epic — created by PO/PM**

> `Grocery Delivery`

**Story — created for the team's requirement**

> `Prepare application infrastructure`

**DevOps Task — created/assigned by DevOps Lead**

> `Provision servers and Kubernetes cluster`

### So remember

```text
PO/PM
→ EPIC
"Grocery Delivery"

Team / PO
→ STORY
"Prepare application infrastructure"

DevOps Lead
→ TASK
"Provision servers and Kubernetes cluster"

DevOps Engineer (ME)
→ DOES THE TASK
```

### One-line memory

**PO creates the Epic → team requirement becomes a Story → DevOps Lead creates/assigns the Task → DevOps Engineer executes it.**

One small real-world note: exact ownership can vary by company and Jira setup, but this is a **clean model for your Amazon Fresh practice project**.
