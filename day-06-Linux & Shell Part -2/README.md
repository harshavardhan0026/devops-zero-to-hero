

Here is the **single final Day 6 Part 2 note** you can copy directly into GitHub:

````markdown
# 🚀 Day 6 — Linux & Shell Scripting — Part 2

> Understanding why automation is needed, how to create and execute a shell script, permissions, and how Shell Scripting is used in DevOps.

## 1. Why Automation?

Manual work becomes difficult when the number of tasks increases.

For example:

```text
Create 10 files      → Easy manually
Create 100 files     → More effort
Create 10,000 files  → Not practical manually
Create 1,000,000     → Need automation
````

Instead of running the same command repeatedly, we can write a **Shell Script** and let the system perform the work automatically.

```text
Manual Work
     ↓
Repeated Tasks
     ↓
More Time + Human Errors
     ↓
Shell Script
     ↓
Automation
     ↓
Faster + Consistent
```

> **Automation means using scripts or tools to perform repetitive work with minimal manual intervention.**

---

# 2. Creating a Shell Script

### Step 1 — Create a file

```bash
touch script.sh
```

### Step 2 — Check the file

```bash
ls
```

or:

```bash
ls -ltr
```

`ls -ltr` shows detailed information such as permissions, owner, size and timestamp.

### Step 3 — Check command documentation

`man` means **manual**.

It provides information about a command and its available options.

Example:

```bash
man ls
```

Other examples:

```bash
man chmod
man mkdir
man touch
```

### Step 4 — Open the script

```bash
vim script.sh
```

Inside Vim:

```text
i       → Insert mode
Write   → Script content
Esc     → Exit insert mode
:wq!    → Save and exit
```

---

# 3. First Line of a Shell Script

A Bash script commonly starts with:

```bash
#!/bin/bash
```

This is called a **shebang**.

It tells the system which interpreter should be used to execute the script.

Other shells/interpreters can include:

```text
bash
sh
dash
ksh
```

For example:

```bash
#!/bin/sh
```

and:

```bash
#!/bin/bash
```

are not necessarily identical.

`sh` refers to a POSIX-style shell, while `bash` provides additional Bash-specific features.

On some Linux systems, `/bin/sh` may be linked to another shell such as `dash` or `bash`, depending on the distribution.

> **If writing Bash-specific scripting, use `#!/bin/bash`.**

---

# 4. `touch` vs `vim`

### `touch`

Used mainly to create an empty file.

```bash
touch file.txt
```

### `vim`

Used to create/edit a file and write content into it.

```bash
vim file.txt
```

### Simple Difference

```text
touch → Create an empty file
vim   → Create/Edit + Write content
```

`touch` is also useful when scripts or automation need to create files programmatically. We don't manually open thousands of files with Vim.

---

# 5. `echo`

`echo` is commonly used to print text.

```bash
echo "Hello DevOps"
```

Output:

```text
Hello DevOps
```

---

# 6. Execute a Shell Script

Suppose the script is:

```text
script.sh
```

Give it execute permission:

```bash
chmod 777 script.sh
```

Then execute:

```bash
./script.sh
```

> In real production environments, avoid using `777` unnecessarily. Give only the permissions required by the user/process.

---

# 7. Linux File Permissions

Linux permissions are mainly defined for:

```text
User / Owner
Group
Others
```

The numeric permission values are:

```text
4 → Read
2 → Write
1 → Execute
```

Adding them:

```text
Read + Write + Execute
4 + 2 + 1 = 7
```

Therefore:

```bash
chmod 777 script.sh
```

means:

```text
User   → 7 → Read + Write + Execute
Group  → 7 → Read + Write + Execute
Others → 7 → Read + Write + Execute
```

A more secure example could be:

```bash
chmod 755 script.sh
```

which gives:

```text
Owner  → Read + Write + Execute
Group  → Read + Execute
Others → Read + Execute
```

---

# 8. Useful Commands

### `history`

Shows previously executed commands.

```bash
history
```

### `pwd`

Shows the current working directory.

```bash
pwd
```

### `mkdir`

Creates a directory.

```bash
mkdir DevOps
```

### `ls -ltr`

Shows detailed information about files and directories.

```bash
ls -ltr
```

In the output, if the first character is:

```text
d → Directory
- → Regular file
```

---

# 9. Simple Shell Script Example

Create a script:

```bash
vim create_files.sh
```

Write:

```bash
#!/bin/bash

# Create a directory
mkdir Harsha

# Create two files
touch Harsha/firstfile Harsha/secondfile
```

Save and exit:

```text
Esc
:wq!
```

Give permission:

```bash
chmod 755 create_files.sh
```

Run:

```bash
./create_files.sh
```

Check:

```bash
ls -ltr
cd Harsha
ls -ltr
```

You should see:

```text
firstfile
secondfile
```

---

# 10. Shell Scripting in DevOps

A DevOps Engineer works with:

```text
Infrastructure
CI/CD
Deployments
Configuration
Maintenance
Monitoring
Cloud
Automation
```

We have many specialized tools for these activities, but Shell Scripting is still useful for **small custom automations, glue logic, troubleshooting and repetitive operational tasks**.

### Example — Server Health Check

Imagine an organization has thousands of servers.

Instead of manually connecting to every server and checking:

```text
CPU
Memory
Disk
Processes
Services
Connectivity
```

we can create a Shell Script that checks these parameters automatically.

Useful commands:

```bash
nproc
free -g
df -h
top
```

The script can collect the information and report servers that have problems.

```text
Thousands of Servers
        ↓
Shell Script
        ↓
Collect Health Information
        ↓
CPU / Memory / Disk / Processes
        ↓
Identify Problems
        ↓
Report / Alert
```

This can also be scheduled using **cron** so that the check runs automatically at a specific time.

---

# 11. Why Use Shell Script When DevOps Has Other Tools?

An interviewer may ask:

> "We already have monitoring and automation tools. Why would you write a Shell Script?"

A good answer:

> **"I use Shell scripting when I need custom logic or need to collect and combine specific information that may not be available directly from an existing tool. It is also useful for small operational tasks, troubleshooting, automation and integrating different commands or tools."**

For example, a custom script could combine:

```text
CPU usage
+
Memory usage
+
Disk usage
+
Process status
+
Service status
+
Network connectivity
+
Recent logs
```

and produce one simple health report.

The point is **not to replace specialized tools with Shell scripts**.

> **Use the right tool for the problem. Shell scripting is useful when custom, lightweight automation is needed.**

---

# 🧠 Easy Mental Model

```text
Manual Repetitive Work
        ↓
      Script
        ↓
     Execute
        ↓
    Automation
        ↓
 Faster + Consistent
        ↓
 Less Manual Effort
```

For DevOps:

```text
Shell Script
     ↓
Automate Tasks
     ↓
Infrastructure / Deployment / Maintenance
     ↓
Monitoring / Troubleshooting
     ↓
Less Manual Work
     ↓
Better Engineering Efficiency
```

## 💡 Key Takeaway

> **Shell scripting allows DevOps engineers to automate repetitive operational tasks, perform custom checks, combine Linux commands, and reduce manual effort. The goal is not simply to write scripts, but to identify repetitive work and automate it when automation provides real value.**

```
```
