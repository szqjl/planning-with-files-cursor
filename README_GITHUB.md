# Planning with Files for Cursor

> 将 Manus AI 的规划工作流模式适配到 Cursor IDE | Adapt Manus AI's planning workflow pattern to Cursor IDE

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.1-green.svg)](https://gitee.com/philsz/planning-with-files-cursor)
[![Status](https://img.shields.io/badge/status-stable-success.svg)](FINAL_CHECK_REPORT.md)

**English** | [中文](README.md)

---

## 🎯 What is This?

A Cursor IDE adaptation of the [planning-with-files](https://github.com/OthmanAdi/planning-with-files) workflow pattern, implementing Manus AI's core planning methodology. This project enables you to use persistent markdown files for planning, progress tracking, and knowledge storage in Cursor IDE.

**Inspired by**: Manus AI's $2B acquisition by Meta - their secret was **context engineering** using markdown files as working memory.

## ✨ Features

- ✅ **Automatic Workflow Activation** - Automatically triggers for complex tasks (3+ steps)
- ✅ **3-File Pattern** - `task_plan.md`, `notes.md`, and `[deliverable].md`
- ✅ **Auto-Execution** - Reduces unnecessary user confirmations, executes automatically
- ✅ **Project & Global Support** - Install per-project or globally
- ✅ **Cross-Platform** - Windows, Linux, and macOS support
- ✅ **Easy Installation** - One-command installation scripts

## 🚀 Quick Start

### Installation

**Option 1: Clone and Install (Recommended)**

```bash
# Clone the repository
git clone https://gitee.com/philsz/planning-with-files-cursor.git

# Navigate to your project
cd your-project

# Install (Windows)
..\planning-with-files-cursor\install\install.ps1 project

# Install (Linux/macOS)
../planning-with-files-cursor/install/install.sh project
```

**Option 2: Download ZIP**

1. Download from [Gitee](https://gitee.com/philsz/planning-with-files-cursor)
2. Extract and run install script

### Verify Installation

```bash
python ../planning-with-files-cursor/install/verify.py
```

## 📖 How It Works

### The 3-File Pattern

For every complex task, the workflow automatically creates:

```
task_plan.md      → Track phases and progress
notes.md          → Store research and findings
[deliverable].md  → Final output
```

### Automatic Execution

When you request a complex task in Cursor:

```
You: "Research TypeScript advantages and write a summary"
```

Cursor automatically:
1. Creates `task_plan.md` with phases
2. Creates `notes.md` for research
3. Executes tasks phase by phase
4. Updates progress checkboxes
5. Creates final deliverable

**No frequent confirmations** - AI reads `task_plan.md` and executes automatically!

## 🎯 Use Cases

### ✅ Perfect For

- Multi-step tasks (3+ steps)
- Research tasks
- Building/creating projects
- Tasks spanning many tool calls
- Any task requiring organization

### ❌ Not For

- Simple questions
- Single-file edits
- Quick lookups
- One-time queries

## 📚 Documentation

- **[USAGE_GUIDE.md](./USAGE_GUIDE.md)** - Complete usage guide
- **[workflow.md](./workflow.md)** - Detailed workflow documentation
- **[TESTING.md](./TESTING.md)** - Testing guide
- **[FINAL_CHECK_REPORT.md](./FINAL_CHECK_REPORT.md)** - Final check report

## 🔧 Installation Options

### Project-Level (Recommended)

Install per-project for flexibility:

```bash
./install/install.ps1 project  # Windows
./install/install.sh project   # Linux/macOS
```

### Global Installation

Install once, use everywhere:

```bash
./install/install.ps1 global  # Windows
./install/install.sh global  # Linux/macOS
```

## 💡 Example

**Before** (without workflow):
- AI loses track after 50+ tool calls
- Goals drift away
- Context gets stuffed
- Errors repeat

**After** (with workflow):
- ✅ Goals stay in attention window
- ✅ Progress tracked in files
- ✅ Errors logged and avoided
- ✅ Context stored in files, not memory

## 🛠️ Project Structure

```
planning-with-files-cursor/
├── .cursorrules              # Cursor rules template
├── install/                  # Installation scripts
│   ├── install.ps1          # Windows installer
│   ├── install.sh            # Linux/macOS installer
│   └── verify.py             # Verification script
├── docs/planning/            # Planning templates
│   ├── task_plan_template.md
│   └── notes_template.md
└── [documentation files]
```

## 📊 Status

**Project Status**: ✅ **Production Ready**

- ✅ All core features implemented
- ✅ All tests passed (15/15)
- ✅ No critical bugs
- ✅ Complete documentation
- ✅ Auto-execution optimized

## 🤝 Contributing

Contributions welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## 📝 License

MIT License - feel free to use, modify, and distribute.

## 🙏 Acknowledgments

- **[planning-with-files](https://github.com/OthmanAdi/planning-with-files)** - Original project
- **Manus AI** - For pioneering context engineering patterns
- **Anthropic** - For Claude Code and Cursor IDE

## 🔗 Links

- **Gitee Repository**: [https://gitee.com/philsz/planning-with-files-cursor](https://gitee.com/philsz/planning-with-files-cursor)
- **Original Project**: [planning-with-files](https://github.com/OthmanAdi/planning-with-files)

---

**Version**: v1.1  
**Created**: 2026-01-07  
**Maintained by**: philsz
