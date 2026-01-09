# Planning with Files for Cursor

> 将 Manus AI 的规划工作流模式适配到 Cursor IDE | Adapt Manus AI's planning workflow pattern to Cursor IDE

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.1-green.svg)](https://gitee.com/philsz/planning-with-files-cursor)
[![Status](https://img.shields.io/badge/status-stable-success.svg)](README.md)

## 🎯 项目目标

创建一个类似 [planning-with-files](https://github.com/OthmanAdi/planning-with-files) 的项目，但针对 Cursor IDE 进行适配，让用户可以通过简单的复制操作就能在 Cursor 中使用规划工作流。

## 📋 当前状态

**✅ 项目已完成并优化** - 所有核心功能已开发并通过测试，已优化自动执行规则，可以正常使用

**最新优化** (v1.1):
- ✅ 添加自动执行规则，减少不必要的用户确认
- ✅ 解决频繁询问问题，AI 可根据 task_plan.md 自动判断和执行

## ✅ 已解决的问题

1. **Cursor 的配置机制** ✅
   - ✅ Cursor 全局配置目录：Windows `%USERPROFILE%\.cursor\`
   - ✅ 支持全局 `.cursorrules`：位于 `%USERPROFILE%\.cursor\rules\`
   - ✅ 配置加载优先级：项目级 `.cursorrules` 优先于全局配置

2. **实现方案** ✅
   - ✅ 已实现：项目模板方式（复制到项目）
   - ✅ 已实现：全局配置方式（复制到 Cursor 目录）
   - ✅ 选择混合方案：两种方式都支持，用户自由选择

3. **安装方式** ✅
   - ✅ 已创建一键安装脚本（Windows/Linux/macOS）
   - ✅ 支持项目级和全局两种安装模式
   - ✅ 提供验证脚本检查安装结果

## 📁 项目结构

```
planning-with-files-cursor/
├── README.md                 # 本文件
├── task_plan.md              # 项目任务计划（工作流示例）
├── notes.md                  # 研究笔记（工作流示例）
├── workflow.md                # 工作流文档
├── .cursorrules              # Cursor 规则模板（✅ 已创建）
├── docs/
│   └── planning/             # 规划文件结构模板
│       ├── task_plan_template.md  # 任务计划模板
│       └── notes_template.md      # 研究笔记模板
├── install/                  # 安装脚本（✅ 已创建）
│   ├── install.ps1          # Windows 安装脚本
│   ├── install.sh            # Linux/macOS 安装脚本
│   └── verify.py             # 验证脚本
└── research/                 # 研究文档（待创建）
    ├── cursor-config.md      # Cursor 配置研究
    └── feasibility.md        # 可行性分析
```

## 📖 工作流文档

本项目已创建完整的工作流文档，参考 [planning-with-files](https://github.com/OthmanAdi/planning-with-files) 的 3-File Pattern 模式：

- **[workflow.md](./workflow.md)** - 完整的工作流使用文档
- **[USAGE_GUIDE.md](./USAGE_GUIDE.md)** - 在其他电脑上使用指南 ⭐ **新用户必读**
- **[task_plan.md](./task_plan.md)** - 项目任务计划（工作流示例）
- **[notes.md](./notes.md)** - 研究笔记（工作流示例）
- **[docs/planning/](./docs/planning/)** - 规划文件模板
- **[TESTING.md](./TESTING.md)** - 测试指南

### 快速开始

**第一次使用？** 请先阅读 [USAGE_GUIDE.md](./USAGE_GUIDE.md)

1. 阅读 [USAGE_GUIDE.md](./USAGE_GUIDE.md) 了解如何安装
2. 阅读 [workflow.md](./workflow.md) 了解工作流原理
3. 查看 `task_plan.md` 和 `notes.md` 作为使用示例
4. 使用 `docs/planning/` 中的模板开始你的项目

## 🚀 在其他电脑上使用

### 在其他电脑上使用

**详细使用指南**: 请查看 [USAGE_GUIDE.md](./USAGE_GUIDE.md)

#### 快速安装步骤

1. **克隆项目**
   ```bash
   git clone https://gitee.com/philsz/planning-with-files-cursor.git
   ```

2. **安装到你的项目**
   
   **Windows (PowerShell):**
   ```powershell
   cd your-project
   ..\planning-with-files-cursor\install\install.ps1 project
   ```
   
   **Windows (CMD):**
   ```cmd
   cd your-project
   powershell -ExecutionPolicy Bypass -File ..\planning-with-files-cursor\install\install.ps1 project
   ```
   
   **Linux/macOS:**
   ```bash
   cd your-project
   ../planning-with-files-cursor/install/install.sh project
   ```

3. **验证安装**
   ```bash
   python ../planning-with-files-cursor/install/verify.py
   ```

### 安装方式

#### 方式 1: 项目模板方式（推荐）

**Windows (PowerShell):**
```powershell
cd your-project
..\planning-with-files-cursor\install\install.ps1 project
```

**Windows (CMD):**
```cmd
cd your-project
powershell -ExecutionPolicy Bypass -File ..\planning-with-files-cursor\install\install.ps1 project
```

**Linux/macOS:**
```bash
cd your-project
../planning-with-files-cursor/install/install.sh project
```

#### 方式 2: 全局配置方式

**Windows:**
```powershell
# 在 PowerShell 中运行（推荐）
cd D:\planning-with-files-cursor
.\install\install.ps1 global

# 或者在命令提示符（CMD）中运行
powershell -ExecutionPolicy Bypass -File .\install\install.ps1 global
```

**Linux/macOS:**
```bash
cd /path/to/planning-with-files-cursor
./install/install.sh global
```

**安装位置**:
- Windows: `%USERPROFILE%\.cursor\rules\.cursorrules`
- Linux: `~/.config/Cursor/rules/.cursorrules`
- macOS: `~/Library/Application Support/Cursor/rules/.cursorrules`

**注意**: 全局安装后需要重启 Cursor IDE 才能生效。

### 验证安装

```bash
python install/verify.py
```

## 📊 项目进度

- ✅ Phase 1: 研究和探索
- ✅ Phase 2: 配置机制研究
- ✅ Phase 3: 实现方案设计（选择混合方案）
- ✅ Phase 4: 核心功能开发
- ✅ Phase 5: 安装脚本开发
- ✅ Phase 6: 文档和测试
- ✅ Phase 7: 工作流优化（v1.1）

## 📦 Git 仓库

本项目已推送到 Gitee：

**仓库地址**: [https://gitee.com/philsz/planning-with-files-cursor](https://gitee.com/philsz/planning-with-files-cursor)

### 克隆项目

```bash
git clone https://gitee.com/philsz/planning-with-files-cursor.git
```

### 后续更新

```bash
git add .
git commit -m "更新说明"
git push
```

---

**创建时间**: 2026-01-07  
**项目位置**: D:\CursorPlan\planning-with-files-cursor\  
**Gitee 仓库**: [https://gitee.com/philsz/planning-with-files-cursor](https://gitee.com/philsz/planning-with-files-cursor) ✅  
**GitHub 仓库**: [https://github.com/szqjl/planning-with-files-cursor](https://github.com/szqjl/planning-with-files-cursor) ✅

