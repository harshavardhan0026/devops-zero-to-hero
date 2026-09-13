Absolutely. Here is a **simple GitHub-ready cheat sheet** you can keep and search whenever you forget how to discover a command.

# Linux Command Discovery Workflow

## 1. I DON'T KNOW THE COMMAND

Use:

```bash
man -k <keyword>
```

or:

```bash
apropos <keyword>
```

Example:

```bash
man -k disk
```

This searches for commands related to **disk**.

---

## 2. I FOUND THE COMMAND

Read its manual:

```bash
man <command>
```

Example:

```bash
man df
```

Or check quick help:

```bash
df --help
```

---

## 3. TEST THE COMMAND

Run it manually:

```bash
df -h
```

Understand the output before putting it into a script.

---

## 4. PUT IT INTO THE SCRIPT

Example:

```bash
echo "Disk Usage: $(df -h /)"
```

---

# Simple Rule to Remember

```text
Don't know WHAT command?
        ↓
man -k <keyword>
        ↓
Find the command
        ↓
man <command>
or
<command> --help
        ↓
Test the command
        ↓
Understand the output
        ↓
Put it into the script
```

## Examples

### Don't know the command for disk usage

```bash
man -k disk
```

Find:

```bash
df
```

Then:

```bash
man df
df --help
```

Test:

```bash
df -h /
```

Then use it in your script.

---

### Already know the command

If you already know `df`:

```bash
man df
```

or:

```bash
df --help
```

No need to use `man -k`.

---

# Golden Rule

```text
DON'T KNOW → man -k keyword
KNOW COMMAND → man command / command --help
THEN → TEST → UNDERSTAND → SCRIPT
```

**Goal:** Don't memorize every command. Learn how to **find, understand, and use** commands from documentation.

This is a good one to keep as something like `linux-command-discovery.md` in your GitHub notes.
