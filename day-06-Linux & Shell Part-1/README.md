Absolutely. This is the **final GitHub-ready Day 6 note**. You can copy the whole thing at once and paste it into your `README.md`.

````markdown
# 🚀 Day 6 — Linux & Shell Scripting — Part 1

> Understanding the Operating System, why Linux is widely used in production, basic Linux architecture, and essential Linux commands.

## 1. Operating System (OS)

A computer has hardware such as:

```text
CPU + RAM + Storage + I/O Devices
````

Applications cannot directly manage all the hardware themselves.

The **Operating System (OS)** acts as the interface between software and hardware and manages the system resources required by applications.

```text
User
 ↓
Applications
 ↓
Operating System
 ↓
Hardware
CPU | RAM | Storage | I/O
```

The same concept applies to servers.

```text
Application
    ↓
Operating System
    ↓
Server Hardware
```

Examples:

* Linux
* Windows
* macOS

### Simple Understanding

> **The OS provides the environment for applications to run and manages the underlying hardware resources.**

---

## 2. Why Linux in Production?

Linux is widely used for servers, application deployment, testing and DevOps environments.

### Main Advantages

* **Open Source** → Can be used and customized without proprietary OS licensing
* **Efficient** → Can run well with relatively fewer resources
* **Stable & Reliable** → Suitable for long-running production workloads
* **Secure** → Strong permissions and security mechanisms
* **Fast** → Efficient for many server workloads
* **Automation Friendly** → Powerful command line and scripting capabilities
* **Many Distributions** → Ubuntu, RHEL, Alpine Linux, etc.

> Linux is not automatically secure just because it is Linux. Production systems still require patching, hardening, access control, monitoring and other security practices.

---

## 3. Basic Linux Architecture

A simple way to understand Linux is:

```text
Users
  ↓
Applications / Shell / System Utilities
  ↓
System Libraries
  ↓
Kernel
  ↓
Hardware
```

### Kernel — Heart of Linux

The **kernel is the core of the Linux operating system**. It manages communication between software and hardware.

Main responsibilities:

* **Process Management** → Manages running processes
* **Memory Management** → Manages RAM
* **Device Management** → Communicates with hardware/devices
* **System Calls** → Provides an interface for applications to request OS services

### System Libraries

Provide commonly used functions that applications use to interact with the operating system.

### Shell

The shell provides a command-line interface through which users can interact with Linux.

Examples:

```bash
ls
pwd
cd
```

> At this stage, the goal is only to understand the basic architecture, not the complete Linux internals.

---

# 4. Linux Shell & Basic Commands

The **shell** allows us to communicate with the operating system using commands.

## Navigation

### `pwd` — Present Working Directory

Shows the directory you are currently in.

```bash
pwd
```

### `ls` — List

Shows files and directories.

```bash
ls
```

### `ls -ltr`

Shows detailed information such as:

* Permissions
* Owner
* Size
* Timestamp
* Files/directories

```bash
ls -ltr
```

### `cd` — Change Directory

Moves to another directory.

```bash
cd directory
```

### `cd ..`

Moves one directory back.

```bash
cd ..
```

### `cd ../..`

Moves two directories back.

```bash
cd ../..
```

### `/` — Root Directory

`/` represents the **root of the Linux filesystem**.

It is **not the user's home directory**.

Example:

```text
/
├── home
│   └── username
├── etc
├── var
├── usr
└── ...
```

A user's home directory is normally:

```text
/home/<username>
```

---

# 5. Files & Directories

### `touch`

Creates an empty file.

```bash
touch file.txt
```

### `vi` / `vim`

Creates or edits a file.

```bash
vim file.txt
```

### `mkdir`

Creates a directory.

```bash
mkdir devops
```

### `rm`

Removes a file.

```bash
rm file.txt
```

### `rm -r`

Removes a directory and its contents.

```bash
rm -r devops
```

> Be careful with `rm`, especially `rm -r`, because deleted files may not be recoverable.

---

# 6. Checking Server Resources

In Windows, we commonly use graphical tools to check CPU, RAM and disk usage.

In Linux, we can use commands.

### `free -g` — Memory

Shows memory usage in GB.

```bash
free -g
```

### `nproc` — CPU

Shows the number of available processing units.

```bash
nproc
```

### `df -h` — Disk

Shows filesystem disk usage in a human-readable format.

```bash
df -h
```

### `top` — System Activity

Shows live information about:

* CPU usage
* Memory usage
* Running processes
* System activity

```bash
top
```

---

# 🧠 Easy Mental Model

```text
                    USER
                      ↓
                APPLICATIONS
                      ↓
                    SHELL
                      ↓
               SYSTEM LIBRARIES
                      ↓
                    KERNEL
             ┌────────┼────────┐
             ↓        ↓        ↓
          Process    Memory   Devices
         Management Management Management
                      ↓
                   HARDWARE
             CPU | RAM | Disk | I/O
```

## 💡 Key Takeaway

> **Linux is an operating system that provides the environment for applications and manages server resources. The kernel is the core of Linux, while the shell allows us to interact with the operating system using commands. Linux is widely used in DevOps and production because it is efficient, stable, secure, open source and highly automation-friendly.**

```
```
