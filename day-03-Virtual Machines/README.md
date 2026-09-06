# Day 3 – Virtual Machines & Virtualization

## 1. The Problem: Resource Wastage

Imagine I have **1 acre of land** and build one house on it.

The house uses only a small portion of the available resources:

* Land
* Water
* Electricity
* Other facilities

If I use the entire property for only one person, a lot of resources remain unused.

Instead, I can logically divide the property and build another independent house.

Now:

* House 1 → My use
* House 2 → Rent

Both houses can use the same overall resources efficiently.

This is the basic idea behind **virtualization**.

> **Virtualization = Using one physical resource to create multiple isolated logical resources.**

---

# 2. What is a Server?

A **server** is a computer that provides resources or services to other computers over a network.

For example, I develop a web application on my laptop.

My laptop is not necessarily the right place to make that application publicly available to users.

So I can deploy the application to a server connected to the internet.

For example:

```text
Developer Laptop
       |
       | Deploy Application
       ↓
     Server
       |
       ↓
  Internet Users
       |
       ↓
   example.com
```

A server is essentially a computer with CPU, RAM, storage, networking, and an operating system/software stack that is used to provide services.

---

# 3. The Traditional Physical Server Problem

Suppose a company purchases a physical server:

```text
Physical Server

CPU  → 100 CPUs
RAM  → 100 GB
```

Now suppose Application 1 requires only:

```text
CPU → 4
RAM → 4 GB
```

If I dedicate the entire physical server to Application 1:

```text
Application 1
     ↓
Physical Server
100 CPU
100 GB RAM
```

Only a small portion of the server's capacity is being used.

A large amount of computing capacity remains unused.

This creates:

> **Resource underutilization**

and increases infrastructure cost.

---

# 4. Virtualization – The Solution

Instead of dedicating the entire physical server to one application, we can use **virtualization**.

We take:

```text
Physical Server
100 CPU
100 GB RAM
```

and install a **Hypervisor**.

```text
          Physical Server
       100 CPU / 100 GB RAM
                 |
                 ↓
            Hypervisor
                 |
       ┌─────────┼─────────┐
       ↓         ↓         ↓
      VM1       VM2       VM3
       ↓         ↓         ↓
     App 1     App 2     App 3
```

The hypervisor allows multiple **Virtual Machines (VMs)** to run on the same physical server.

Instead of wasting most of the physical server's capacity, we can allocate resources to multiple VMs.

---

# 5. What is a Virtual Machine?

A **Virtual Machine (VM)** is a software-created computer that behaves like an independent physical computer.

A VM can have its own:

* CPU allocation
* RAM allocation
* Storage
* Network interface
* Operating system
* Applications

For example:

```text
Physical Server
100 CPU
100 GB RAM

       ↓
   Hypervisor
       ↓

VM1 → 4 CPU + 4 GB RAM → Application 1

VM2 → 8 CPU + 16 GB RAM → Application 2

VM3 → 10 CPU + 20 GB RAM → Application 3
```

The remaining resources can be allocated to other workloads.

This increases **resource utilization and efficiency**.

---

# 6. What Does the Hypervisor Do?

The **hypervisor** is the software layer responsible for creating and managing virtual machines.

It manages access to the physical machine's resources.

Conceptually:

```text
Application
     ↓
Virtual Machine
     ↓
Hypervisor
     ↓
Physical CPU / RAM / Storage / Network
```

The hypervisor decides how physical resources are presented to each VM.

It provides isolation between VMs so that each VM operates as an independent machine.

For example:

```text
Physical Server
       |
   Hypervisor
       |
 ┌─────┼─────┐
 ↓     ↓     ↓
VM1   VM2   VM3
```

VM1 does not normally need to know that VM2 exists.

---

# 7. Important Benefit: Isolation

One of the major benefits of virtualization is **isolation**.

For example:

```text
VM1 → Team A → Application A

VM2 → Team B → Application B

VM3 → Team C → Application C
```

Each team can manage its own VM.

A problem inside one VM does not automatically mean that the other VMs are affected.

The hypervisor provides the virtualization boundary between them.

> **Virtualization allows multiple workloads to share one physical machine while maintaining logical isolation.**

---

# 8. Hypervisor Types

There are two common categories of hypervisors.

### Type 1 – Bare-Metal Hypervisor

The hypervisor runs directly on the physical hardware.

```text
Physical Hardware
       ↓
    Hypervisor
       ↓
   Virtual Machines
```

Examples include:

* VMware ESXi
* Xen
* Microsoft Hyper-V

This type is commonly associated with servers and data centers.

### Type 2 – Hosted Hypervisor

The hypervisor runs on top of an existing operating system.

```text
Physical Hardware
       ↓
   Host Operating System
       ↓
     Hypervisor
       ↓
   Virtual Machines
```

Examples include desktop virtualization products such as VMware Workstation and VirtualBox.

---

# 9. Virtualization in the Cloud

Cloud providers use virtualization extensively to provide computing resources to customers.

For example, imagine AWS operates large data centers.

```text
AWS Data Center
      |
      ↓
Physical Servers
      |
      ↓
Hypervisor / Virtualization Layer
      |
 ┌────┼────┬────┐
 ↓    ↓    ↓    ↓
VM1  VM2  VM3  VM4
```

Instead of giving one customer an entire physical server, the provider can allocate a virtual machine with the required resources.

This allows the provider to utilize infrastructure much more efficiently.

---

# 10. AWS EC2 Example

When a customer creates an **EC2 instance**, they are requesting virtualized computing capacity.

Conceptually:

```text
Customer
   |
   | Request EC2
   ↓
AWS
   |
   ↓
Available Infrastructure
   |
   ↓
Virtualization Layer
   |
   ↓
EC2 Instance
   |
   ↓
IP + Storage + Networking + Access Configuration
   |
   ↓
Customer's Application
```

The customer can select an instance type based on the workload's requirements.

For example:

```text
Small workload
     ↓
Small EC2 instance

Large workload
     ↓
Larger EC2 instance
```

The cloud provider manages the underlying physical infrastructure.

The customer primarily manages the virtual server and the workloads running on it, depending on the service.

---

# 11. Why Cloud Providers Use Virtualization

Virtualization helps cloud providers:

### 1. Improve resource utilization

Instead of leaving large amounts of physical CPU and RAM unused, infrastructure can support multiple workloads.

### 2. Reduce infrastructure cost

More workloads can be hosted on the same physical infrastructure.

### 3. Provide flexibility

Customers can request different amounts of computing resources.

### 4. Provide isolation

Different customers/workloads can run in separate virtualized environments.

### 5. Scale infrastructure

Cloud providers can create and manage large numbers of virtual machines across their data centers.

---

# 12. Data Center Example

Think about a cloud provider as a huge property.

```text
                CLOUD DATA CENTER
                       |
        ┌──────────────┼──────────────┐
        ↓              ↓              ↓
    Physical       Physical       Physical
     Server          Server          Server
        ↓              ↓              ↓
   Hypervisor      Hypervisor      Hypervisor
        ↓              ↓              ↓
     VM1 VM2        VM3 VM4        VM5 VM6
```

The cloud provider owns/manages the physical infrastructure.

Customers consume virtualized resources.

This is one of the fundamental technologies that made modern cloud computing practical.

---

# 13. Latency and Region

Cloud providers have data centers in different geographic regions.

For example:

```text
User
Mumbai
  |
  ↓
Cloud Region closer to Mumbai
  |
  ↓
Application
```

Choosing infrastructure geographically closer to users can help reduce network latency.

In real cloud architecture, region selection also depends on:

* Availability
* Cost
* Data residency
* Compliance
* Disaster recovery
* Service availability

---

# 14. Virtual Machine vs Physical Server

| Physical Server                          | Virtual Machine                       |
| ---------------------------------------- | ------------------------------------- |
| Actual physical computer                 | Software-defined computer             |
| Own physical hardware                    | Uses underlying physical hardware     |
| Limited by one machine's capacity        | Resources can be allocated virtually  |
| Can lead to underutilization             | Better resource utilization           |
| More expensive to provision individually | Easier to provision                   |
| Hardware management required             | Provider/platform can manage hardware |

---

# 15. Virtualization in One Picture

```text
                 PHYSICAL SERVER
             100 CPU + 100 GB RAM
                       |
                       ↓
                  HYPERVISOR
                       |
        ┌──────────────┼──────────────┐
        ↓              ↓              ↓
       VM1            VM2            VM3
        ↓              ↓              ↓
    Application     Application    Application
        1                2              3
```

### Before Virtualization

```text
Physical Server
       ↓
Application 1

Large amount of unused capacity
```

### After Virtualization

```text
Physical Server
       ↓
   Hypervisor
       ↓
 ┌─────┼─────┐
 ↓     ↓     ↓
VM1   VM2   VM3
 ↓     ↓     ↓
App1  App2  App3
```

**Better utilization → lower waste → better efficiency**

---

# 16. The Problem Virtualization Solves

### Problem

> "I have a powerful physical server, but my application uses only a small percentage of its resources."

### Solution

> "Use a hypervisor to divide the physical resources into multiple isolated virtual machines and run multiple workloads on the same physical server."

### Result

> **Higher resource utilization + better infrastructure efficiency + easier provisioning**

---

# 17. DevOps Connection

Virtualization is important in DevOps because DevOps teams need infrastructure that can be:

* Provisioned quickly
* Consistently configured
* Isolated
* Scaled
* Reproduced
* Automated

Virtual machines became an important foundation for modern infrastructure and cloud platforms.

Later, technologies such as **containers and Kubernetes** take resource efficiency and application deployment further.

---

# 18. Easy Memory Trick 🧠

Remember:

```text
PHYSICAL SERVER
       ↓
   "Too much unused capacity"
       ↓
   VIRTUALIZATION
       ↓
    HYPERVISOR
       ↓
 ┌─────┼─────┐
 ↓     ↓     ↓
 VM1   VM2   VM3
 ↓     ↓     ↓
App1  App2  App3
       ↓
Better utilization
```

### One-line definition

> **Virtualization is the process of using software called a hypervisor to create multiple isolated virtual machines on a single physical machine, allowing hardware resources to be utilized more efficiently.**
