# 🚀 Day 2 — SDLC & DevOps

> Understanding the Software Development Life Cycle and where DevOps fits into it.

## What is SDLC?

**SDLC (Software Development Life Cycle)** is a process followed by organizations to plan, design, develop, test, and deliver a high-quality software product to customers.

## SDLC Phases

```text
Planning → Define → Design → Build → Test → Deploy
```

### Planning

Understand **what needs to be built and why**.

**Example:** A clothing brand wants to add a Kids section to its existing Men's and Women's sections.

* Business Analyst gathers business/customer requirements.
* Requirements may be documented in a **BRD (Business Requirement Document)**.

### Define

Convert the requirements into detailed software requirements.

* Requirements are documented in an **SRS (Software Requirement Specification)**.

### Design

Decide **how the application will be built**.

* **HLD** → Overall architecture
* **LLD** → Detailed technical design
* Usually handled by Solution Architects/Senior Engineers.

### Build

Developers implement the design.

```text
Jira Task → Developer writes code → Peer Review → Git
```

### Test

The application is built and deployed to a test environment.

* QA tests the application.
* Bugs are identified and fixed.
* Continuous testing can be automated.

### Deploy

The tested application is promoted through environments such as:

```text
Test → Staging / Pre-Prod → Production
```

Finally, the application becomes available to customers.

## Where Does DevOps Come In?

DevOps helps **improve the efficiency of the SDLC**, especially around building, testing, deploying, and operating applications.

```text
Build → Test → Deploy → Monitor
   ↓       ↓       ↓       ↓
        Automation & DevOps
```

DevOps brings:

* Automation
* Continuous Testing
* CI/CD
* Continuous Monitoring
* Faster and more reliable delivery

## 💡 Key Takeaway

**SDLC defines the process of developing and delivering software. DevOps improves that process through collaboration, automation, continuous testing, deployment, and monitoring.**
