# Day 9: Git & GitHub — Study Notes

> **Learning goal:** Understand Git, GitHub, version control, the Git lifecycle, essential commands, and practical workflows.

## Git vs. GitHub

![Git and GitHub comparison](https://images.openai.com/static-rsc-4/b9KWi3rbx7VUKaMm57fI9Oc83cngNGmOTSnN6lkQ5OUpAbztl7ppFDmKLVDqn0Tzfj8caqpEJNJQ4pry3t3InXP0qMdub9sKnGXknA_V9F_6NfEoS3kqNEnu60xa8yIFex3nFnmlYXj1EyuHVGlyEJcaFx1z7YyT_ietl2y59a8?purpose=inline)

- **Git:** Tracks code changes and versions on your computer.
- **GitHub:** Hosts Git repositories online and provides collaboration tools such as pull requests, issues, and project management.

## 1. Why Do We Need Version Control?

The instructor explains two main problems:

- **Code sharing:** Two developers may work on different features of the same application. Their changes must be combined.
- **Versioning:** If a new change breaks an application, the team needs to inspect previous versions and recover the correct code.

🌱 **Plant analogy:** Imagine a plant-growing project. You record each day's changes so you can understand what changed and return to an earlier state if needed.

## 2. Centralized vs. Distributed Version Control

### Centralized — SVN

![Subversion SVN architecture](https://images.openai.com/static-rsc-4/WpPRkoBnsgpAhuOTL_hTGzgiyzG1GFExV3BDFCyBCBKo1rWabg5nuBbya08s3UvIqHkeS_i7EtptH3YuLWgjRi0JMlCU04HfOpkDyv01VF_36NheACr2vGq9eKElhTIgwI3Zusu5M3Ewto7bZXjQo68i6t8eLeOB6rvXIoxX2YU?purpose=inline)

Developers depend on a central server to exchange changes. If it becomes unavailable, collaboration is disrupted.

### Distributed — Git

![Git distributed version control architecture](https://images.openai.com/static-rsc-4/rrlvYmHMX03OO_QJIWdeIJnxD5FjeirYJaXHNawxA6BJ7gazHwkbAu8ItNBrmYYqu7t0yYSKk2pz8E8IBealcvx8X6nwV7AL8mV0qPZ3dZH5x5fuB9dCJfGwgH_etleMYU50j4QaWmfVMj5A_KP4-uA43btcuaokDl3o4n8dHic?purpose=inline)

Developers have local repositories containing project history. They can commit locally without needing the remote server online.

**Interview answer:** Git is a distributed version control system. Each developer can maintain a local repository with project history, while remote repositories support collaboration and sharing.

### Architecture diagram

```mermaid
flowchart TB
    A[Developer A] --> B[Local Git Repository A]
    C[Developer B] --> D[Local Git Repository B]
    B <-->|Push / Pull| E[Remote Repository on GitHub]
    D <-->|Push / Pull| E
    style E fill:#dbeafe,stroke:#2563eb,color:#111827
    style B fill:#dcfce7,stroke:#16a34a,color:#111827
    style D fill:#dcfce7,stroke:#16a34a,color:#111827
```

## 3. Git vs. GitHub

| Feature | Git | GitHub |
|---|---|---|
| Type | Version control software | Online hosting and collaboration platform |
| Purpose | Tracks changes and commits | Hosts repositories and supports code reviews |
| Location | Works locally | Provides remote collaboration |
| Internet | Can work without internet for local operations | Internet is generally needed for hosted collaboration |
| Dependency | Can work without GitHub | Uses Git for Git-based repositories |

**Alternatives:** GitLab and Bitbucket also provide repository hosting and collaboration features.

## 4. The Git Lifecycle

```mermaid
flowchart TD
    A[Working Directory<br/>Create or modify files]
    B[Staging Area<br/>git add]
    C[Local Repository<br/>git commit]
    D[Remote Repository<br/>git push]
    A -->|Select changes| B
    B -->|Save a version| C
    C -->|Upload commits| D
    style A fill:#fef3c7,stroke:#d97706,color:#111827
    style B fill:#dbeafe,stroke:#2563eb,color:#111827
    style C fill:#dcfce7,stroke:#16a34a,color:#111827
    style D fill:#f3e8ff,stroke:#9333ea,color:#111827
```

1. **Working directory:** Create or modify files.
2. **Staging area — `git add`:** Select the changes you want to include in the next commit.
3. **Local repository — `git commit`:** Save the staged changes in project history.
4. **Remote repository — `git push`:** Upload local commits to GitHub or another configured remote.

## 5. Essential Git Commands

| Command | Purpose |
|---|---|
| `git --version` | Check Git installation |
| `git init` | Initialize a repository |
| `git status` | Check current changes |
| `git add README.md` | Stage a file |
| `git diff` | Inspect unstaged changes |
| `git commit -m "Add calculator"` | Create a commit |
| `git log` | View commit history |
| `git log --oneline` | View compact commit history |
| `git push` | Upload commits to a remote |
| `git reset --hard <commit-id>` | Reset tracked files and the current branch to a commit |

> ⚠️ **Important:** `git reset --hard` can permanently discard uncommitted changes and move the current branch away from later commits. Don't use it casually on real projects.

## 6. Practice Lab — Ubuntu WSL

Run these commands in your terminal:

```bash
mkdir git-day9
cd git-day9

git init
git branch -M main

printf '# Calculator\n' > README.md

git status
git add README.md
git status

git commit -m "Initial calculator project"

echo "Addition feature" >> README.md
git diff

git add README.md
git commit -m "Add addition feature"

git log --oneline
```

### If Git asks for your identity

Configure your own name and email:

```bash
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

Use the name and email you want associated with your commits. If you want GitHub to associate commits with your account, use an appropriate verified or GitHub-provided commit email.

### What did you learn?

- Initialize a local repository.
- Check the working tree with `git status`.
- Stage selected changes with `git add`.
- Inspect unstaged changes with `git diff`.
- Save versions with `git commit`.
- Review project history with `git log`.

**Remember:** You do not need GitHub for this local lab. Git works independently on your computer.

## 7. Interview Questions

<details>
<summary><strong>1. What problem does Git solve?</strong></summary>

Git tracks changes, maintains project history, and supports collaboration through repositories. It helps developers review changes and recover earlier versions.
</details>

<details>
<summary><strong>2. What is the difference between git add and git commit?</strong></summary>

- `git add` stages selected changes.
- `git commit` records the staged changes in local repository history.
</details>

<details>
<summary><strong>3. What is a fork?</strong></summary>

A fork is a separate copy of a repository on a hosting platform. It allows someone to work independently and potentially propose changes to the original project.
</details>

<details>
<summary><strong>4. Can Git work without GitHub?</strong></summary>

Yes. Git can initialize repositories, track changes, and create commits entirely on a local machine.
</details>

<details>
<summary><strong>5. What does git push do?</strong></summary>

It sends local commits to a configured remote repository, subject to permissions and branch rules.
</details>

## 8. Real-World DevOps Example

Imagine a DevOps engineer updates a shell script that deploys an application.

1. Edit the deployment script.
2. Run tests and inspect the changes using `git diff`.
3. Stage the approved changes using `git add`.
4. Record the change using `git commit`.
5. Push the commit to GitHub.
6. Open a pull request so teammates can review it before merging.

```mermaid
flowchart LR
    A[Update deployment script] --> B[Review and test]
    B --> C[Stage and commit]
    C --> D[Push to GitHub]
    D --> E[Pull request]
    E --> F[Review and merge]
    style B fill:#fef3c7,stroke:#d97706,color:#111827
    style E fill:#dbeafe,stroke:#2563eb,color:#111827
    style F fill:#dcfce7,stroke:#16a34a,color:#111827
```

**DevOps mindset:** Version control makes changes traceable, collaboration safer, and rollbacks easier to plan. A Git commit alone does not automatically back up your code remotely; pushing is a separate step.

## Day 9 — Final Revision

- **Git =** Track and manage versions.
- **GitHub =** Host repositories and collaborate.
- **git add =** Stage changes.
- **git commit =** Save a local version.
- **git push =** Send commits to a remote.
- **git pull =** Fetch and integrate remote changes.
- **Fork =** Create a separate hosted copy of a repository.

**Next step:** Practice connecting your local repository to GitHub and pushing your first project.

IN SIMPLE WORDS AS REVESION:

## 🌱 Day 9 — Git & GitHub: Quick Notes

### 🧠 Remember in Simple Words

- **Git:** Tracks changes in your code.
- **GitHub:** Stores your Git repositories online.
- **Version control:** Keeps a history of changes.
- **Repository (Repo):** A project folder tracked by Git.
- **Staging:** Select the changes you want to save.
- **Commit:** Save a version in Git history.
- **Push:** Upload commits to GitHub.
- **Pull:** Bring remote changes into your local branch.
- **Fork:** Create your own copy of someone else's repository.
- **Branch:** Work on a separate line of development.

### ⚡ Five Commands to Remember

| Command | Simple meaning |
|---|---|
| `git init` | Start Git in a project |
| `git status` | Check what's changed |
| `git add .` | Stage changes in the current directory |
| `git commit -m "message"` | Save a version |
| `git push` | Upload commits to GitHub |

### 🔄 Easy Git Flow

**Edit → Add → Commit → Push**

🌱 Plant analogy:
- Edit = Make changes to your plant.
- Add = Select what you changed.
- Commit = Record today's progress.
- Push = Share your progress online.

### 🎯 Interview in One Minute

**Q: Why do we use Git?**

To track code changes, maintain history, and work safely with other developers.

**Q: Is GitHub the same as Git?**

No. Git tracks versions; GitHub hosts repositories and supports collaboration.

**Q: Can Git work without GitHub?**

Yes. Git can manage versions locally without an internet connection.

**Golden rule:** Git saves your history locally. Push shares your commits remotely.
