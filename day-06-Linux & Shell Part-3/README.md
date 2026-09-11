
# 🚀 Day 6 — Linux & Shell Scripting — Part 2

> Understanding automation, processes, pipes, grep, awk, shell scripting, and building a simple server health-check script.

## 1. Why Automation?

Manual work becomes difficult when the number of tasks increases.

For example:

```text
Create 10 files       → Easy manually
Create 100 files      → More effort
Create 10,000 files   → Not practical manually
Create 1,000,000      → Automation is needed
````

Instead of repeating the same commands manually, we can write a **Shell Script** and let the system perform the work automatically.

```text
Manual Repetitive Work
        ↓
     Shell Script
        ↓
     Automation
        ↓
Faster + Consistent + Less Manual Work
```

> **Automation means using scripts or tools to perform repetitive work with minimal manual intervention.**

---

# 2. Server Health Check

Just like we check CPU, RAM and storage on a laptop, DevOps Engineers need to check the health of servers.

Useful commands:

```bash
df -h       # Disk usage
free -g     # Memory usage
nproc       # Available CPU processing units
top         # Live CPU, memory and process information
ps -ef      # Detailed process information
```

### Important Difference

```text
CPU / Processing Unit → Resource available for processing

Process               → Running instance of a program
```

For example:

```text
Python application → Process
Database            → Process
Web server          → Process
Linux services      → Processes
```

`nproc` tells us the number of available processing units.

`ps -ef` helps us see running processes.

---

# 3. `ps -ef` — Check Processes

```bash
ps -ef
```

Shows detailed information about processes.

Important fields:

```text
UID   → User running the process
PID   → Process ID
PPID  → Parent Process ID
CMD   → Command/program being executed
```

Example:

```text
root       259     1  0 15:14 ?  00:00:00 /usr/bin/python3 ...
```

Here:

```text
PID  = 259
PPID = 1
```

### DevOps Use

If an application is not working, we can first check whether its process is running.

```text
Application Problem
        ↓
     ps -ef
        ↓
Check Process
        ↓
Continue Troubleshooting
```

---

# 4. `grep` — Find Specific Information

`grep` searches text and returns matching lines.

Example:

```bash
ps -ef | grep python
```

Meaning:

```text
ps -ef
  ↓
Get process information
  ↓
|
  ↓
grep python
  ↓
Show lines containing "python"
```

A cleaner way to avoid matching the grep command itself:

```bash
ps -ef | grep '[p]ython'
```

---

# 5. Pipe `|`

The pipe connects the **standard output (stdout)** of one command to the **standard input (stdin)** of another command.

Example:

```bash
ps -ef | grep python
```

Flow:

```text
ps -ef
  ↓
stdout
  ↓
 |
  ↓
grep python
  ↓
Filtered output
```

### Simple Rule

```text
Command 1 stdout → Command 2 stdin
```

The pipe does not simply mean "redirect everything."

---

# 6. Why Doesn't `date` Work Like a Normal Pipe Example?

For example:

```bash
echo "hello" | date
```

The output of `echo` is sent to `date` through stdin.

But `date` normally gets the current date/time from the system and does not use that stdin as an argument.

So the pipe does not automatically turn:

```text
Command 1 output
```

into:

```text
Command 2 argument
```

If we need command output to become an argument, we may use tools such as:

```text
awk
xargs
command substitution $(...)
```

depending on the requirement.

> **Pipe = stdout of one command becomes stdin of the next command.**

---

# 7. `awk` — Extract Specific Information

`awk` is useful for processing text and extracting specific rows or columns.

Example:

```bash
ps -ef | grep "amazon" | awk '{print $2}'
```

For `ps -ef`, `$2` is normally the **PID** column.

```text
$1 → Column 1
$2 → Column 2
$3 → Column 3
...
```

Example:

```bash
awk '{print $1}'
```

→ Prints column 1.

```bash
awk '{print $2}'
```

→ Prints column 2.

```bash
awk '{print $3}'
```

→ Prints column 3.

---

# 8. `awk` — Select a Specific Row

`NR` represents the current record/row number.

Example:

```bash
ps -ef | grep "amazon" | awk 'NR==1 {print $2}'
```

Meaning:

```text
NR==1
  ↓
Take the first matching row

$2
  ↓
Print the second column
```

So:

```text
NR → Which row?
$2 → Which column?
```

This allows us to select exactly the information we need.

---

# 9. Making a Shell Script Easy to Understand

A good script should be understandable by another engineer.

We can use `echo` statements to describe what the script is doing.

Example:

```bash
echo "Checking disk space..."
df -h

echo "Checking memory..."
free -g

echo "Checking CPU..."
nproc
```

This makes the script output easier to understand.

---

# 10. Script Metadata

It is useful to document who created the script, when it was created, what it does, and its version.

Example:

```bash
#!/bin/bash

# Author: Harsha
# Date: 09/05/2026
# Description: Check basic node/server health
# Version: v1
```

When scripts are stored in Git, this information makes them easier to understand and maintain.

---

# 11. `set -x` — Debug Mode

```bash
set -x
```

Shows commands as they are executed.

Example:

```bash
set -x

echo "Checking memory"
free -g
```

This is useful when troubleshooting a script.

To turn it off:

```bash
set +x
```

Or comment it out:

```bash
#set -x
```

> Be careful with `set -x` because it can expose sensitive values in logs if the script handles secrets.

---

# 12. `set -e` — Exit on Error

```bash
set -e
```

Tells the script to stop when a command returns a non-zero exit status.

Example:

```bash
set -e

mkdir test
some-invalid-command

echo "This may not execute"
```

This prevents the script from blindly continuing after an error.

---

# 13. `set -o pipefail`

Consider:

```bash
command1 | command2
```

Without `pipefail`, the pipeline's status can normally be based on the **last command**.

Example:

```text
command1 → FAILED
command2 → SUCCEEDED
```

The pipeline may appear successful even though `command1` failed.

Use:

```bash
set -o pipefail
```

Now a failure in an earlier part of the pipeline can cause the pipeline itself to fail.

A common combination is:

```bash
set -e
set -o pipefail
```

### Simple Mental Model

```text
set -e
   ↓
Stop when a command fails

set -o pipefail
   ↓
Don't hide failures inside pipelines
```

For more robust Bash scripts, you may also see:

```bash
set -euo pipefail
```

where `-u` treats unset variables as errors.

---

# 14. `curl` — Check or Transfer Data

`curl` is commonly used to transfer data to or from a URL.

Example:

```bash
curl https://example.com
```

It can display the response directly in the terminal.

### DevOps Health Check

If an application exposes a health endpoint:

```bash
curl -f https://example.com/health
```

This can help check whether the application endpoint is responding successfully.

Example:

```text
Application
     ↓
/health endpoint
     ↓
curl
     ↓
HTTP Response
```

---

# 15. `curl` vs `wget`

Both can transfer data, but they are commonly used differently.

### curl

Useful for making requests and inspecting/transferring responses.

```bash
curl https://example.com
```

### wget

Commonly used for downloading files.

```bash
wget https://example.com/file.zip
```

### Simple Difference

```text
curl → Request / transfer / inspect data
wget → Download files
```

Both tools have additional capabilities.

---

# 16. `find` — Search for Files

`find` searches for files and directories.

Example:

```bash
find /var/log -name "*.log"
```

Search for a specific file:

```bash
find /tmp -type f -name "test.txt"
```

### DevOps Use

Useful when troubleshooting:

```text
Log files
Configuration files
Application files
Temporary files
```

---

# 17. `sudo`, `su` and Root

### `sudo`

Runs a command with elevated privileges.

```bash
sudo systemctl status nginx
```

### `su`

Means **switch user**.

```bash
su - username
```

Switches to another user's environment.

### `sudo su -`

Switches to the root user using sudo privileges.

```bash
sudo su -
```

The `-` loads the target user's login environment.

### Simple Understanding

```text
sudo → Run a command with elevated privileges

su   → Switch to another user

root → Superuser with extensive system privileges
```

> Use the minimum privileges required. Avoid staying as root unnecessarily.

---

# 18. `if` Statement

Used when the script needs to make a decision.

Example:

```bash
if [ -f "/var/log/app.log" ]; then
    echo "Log file exists"
else
    echo "Log file does not exist"
fi
```

Meaning:

```text
If file exists
     ↓
Do this
Else
     ↓
Do something else
```

---

# 19. `for` Loop

Used to repeat an operation for multiple items.

Example:

```bash
for server in server1 server2 server3
do
    echo "Checking $server"
done
```

Output:

```text
Checking server1
Checking server2
Checking server3
```

This is useful when performing repetitive operations across multiple servers, files or other items.

---

# 20. `while` Loop

Repeats while a condition is true.

Example:

```bash
count=1

while [ $count -le 3 ]
do
    echo "Checking server..."
    count=$((count + 1))
done
```

Output:

```text
Checking server...
Checking server...
Checking server...
```

---

# 21. `trap` — Handle Signals

Linux processes can receive signals.

For example:

```text
Ctrl + C
```

sends the **SIGINT** signal.

We can use `trap` to execute cleanup or other logic when a signal is received.

Example:

```bash
#!/bin/bash

trap 'echo "Ctrl+C received. Cleaning up..."; exit 1' SIGINT

while true
do
    echo "Script is running..."
    sleep 2
done
```

Run:

```bash
./script.sh
```

Press:

```text
Ctrl + C
```

The `trap` catches SIGINT and executes the specified command before the script exits.

### Real DevOps Use

Suppose a script creates temporary files.

We can clean them up when the script exits:

```bash
trap 'rm -f /tmp/myfile' EXIT
```

> `trap` does not make the script continue after Ctrl+C. It allows us to perform cleanup or another action when the signal is received.

---

# 22. Practical DevOps Server Health-Check Script

Now we can combine the commands we learned into one practical script.

### Goal

If someone reports:

> "Something is wrong with my server."

Instead of manually typing many commands, we can run one script.

```text
Server Issue
     ↓
Run Health-Check Script
     ↓
Disk
Memory
CPU
Processes
Application Process
     ↓
Quick Troubleshooting Information
```

### Script

```bash
#!/bin/bash

# Author: Harsha
# Date: 09/05/2026
# Description: Check basic node/server health
# Version: v1

set -e
set -o pipefail

echo "================================="
echo "       SERVER HEALTH CHECK"
echo "================================="

echo ""
echo "Checking disk space..."
df -h

echo ""
echo "Checking memory..."
free -g

echo ""
echo "Checking CPU processing units..."
nproc

echo ""
echo "Checking running processes..."
ps -ef

echo ""
echo "Checking Python processes..."
ps -ef | grep '[p]ython'

echo ""
echo "Checking Python Process ID..."
ps -ef | grep '[p]ython' | awk 'NR==1 {print $2}'

echo ""
echo "Health check completed."
```

---

# 23. Make the Script Executable

```bash
chmod 755 server_health.sh
```

Run:

```bash
./server_health.sh
```

The script now performs multiple checks automatically.

---

# 🧠 What the Script Is Doing

```text
                 SERVER
                    ↓
          server_health.sh
                    ↓
        ┌───────────┼───────────┐
        ↓           ↓           ↓
      Disk        Memory        CPU
     df -h       free -g       nproc
        ↓           ↓           ↓
              Processes
               ps -ef
                    ↓
          Specific Process
             grep + awk
                    ↓
        Health Information
```

---

# 24. Why Keep the Script in Git?

Instead of creating the same troubleshooting commands every time:

```text
Write Once
    ↓
Store in Git
    ↓
Version Controlled
    ↓
Reuse
    ↓
Improve Over Time
```

Git gives us:

* Version history
* Collaboration
* Easy changes
* Ability to review improvements
* Ability to roll back changes

---

# 🎯 Real DevOps Use of Shell Scripting

Shell scripting can help with:

```text
Infrastructure Tasks
Deployment Tasks
Configuration
Maintenance
Troubleshooting
Health Checks
Log Processing
Cron Jobs
CI/CD Supporting Tasks
Server Administration
Custom Automation
```

We don't use Shell scripts to replace every DevOps tool.

Instead:

> **Use the right tool for the problem. Shell scripting is especially useful for lightweight automation, custom logic, troubleshooting and connecting different Linux commands and tools.**

---

# 💬 Interview Point

> **"Shell scripting is useful in DevOps for automating repetitive operational tasks, troubleshooting, health checks, and connecting different Linux commands and tools. Even though we have specialized DevOps tools, I use Shell scripting when I need lightweight custom logic or need to collect and combine specific information that the existing tool may not provide directly."**

## 💡 Key Takeaway

> **The important skill is not just memorizing Linux commands. It is understanding how to combine commands to solve a real problem. In DevOps, Shell scripting helps turn repeated operational and troubleshooting work into reusable automation.**

```
```
