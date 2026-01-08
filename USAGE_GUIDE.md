# Planning with Files for Cursor - 使用指南

## 📋 在其他电脑上使用

本指南说明如何在新电脑上安装和使用 Planning with Files for Cursor 工作流。

---

## 🚀 快速开始

### 方式 1: 从 Gitee 克隆（推荐）

#### 步骤 1: 克隆项目

```bash
# 克隆到本地
git clone https://gitee.com/philsz/planning-with-files-cursor.git

# 进入项目目录
cd planning-with-files-cursor
```

#### 步骤 2: 安装到你的项目

**Windows:**
```powershell
# 进入你的项目目录
cd D:\your-project

# 运行安装脚本（项目模板方式）
..\planning-with-files-cursor\install\install.ps1 project
```

**Linux/macOS:**
```bash
# 进入你的项目目录
cd ~/your-project

# 运行安装脚本（项目模板方式）
../planning-with-files-cursor/install/install.sh project
```

#### 步骤 3: 验证安装

```bash
# 运行验证脚本
python planning-with-files-cursor/install/verify.py
```

### 方式 2: 下载 ZIP 文件

#### 步骤 1: 下载项目

1. 访问 [Gitee 仓库](https://gitee.com/philsz/planning-with-files-cursor)
2. 点击"下载 ZIP"
3. 解压到本地目录

#### 步骤 2: 安装

按照"方式 1"的步骤 2 和 3 执行。

---

## 📦 安装方式详解

### 方式 A: 项目模板方式（推荐）

**适用场景**: 每个项目独立使用，灵活控制

**安装步骤**:

1. **进入你的项目目录**
   ```bash
   cd your-project
   ```

2. **运行安装脚本**
   
   **Windows:**
   ```powershell
   # 如果 planning-with-files-cursor 在项目同级目录
   ..\planning-with-files-cursor\install\install.ps1 project
   
   # 或者使用绝对路径
   D:\path\to\planning-with-files-cursor\install\install.ps1 project
   ```
   
   **Linux/macOS:**
   ```bash
   ../planning-with-files-cursor/install/install.sh project
   ```

3. **验证安装**
   ```bash
   python ../planning-with-files-cursor/install/verify.py
   ```

**安装结果**:
- ✅ 项目根目录下创建 `.cursorrules` 文件
- ✅ 创建 `docs/planning/` 目录
- ✅ 复制模板文件到 `docs/planning/`

**优点**:
- 每个项目独立，互不影响
- 可以针对不同项目定制规则
- 易于版本控制

### 方式 B: 全局配置方式

**适用场景**: 希望所有项目都自动使用规划工作流

**安装步骤**:

1. **运行全局安装脚本**
   
   **Windows:**
   ```powershell
   D:\path\to\planning-with-files-cursor\install\install.ps1 global
   ```
   
   **Linux/macOS:**
   ```bash
   /path/to/planning-with-files-cursor/install/install.sh global
   ```

2. **验证安装**
   ```bash
   python /path/to/planning-with-files-cursor/install/verify.py
   ```

**安装结果**:
- ✅ Cursor 全局配置目录下创建 `.cursorrules` 文件
- ✅ 所有项目自动使用规划工作流

**优点**:
- 一次安装，全局生效
- 所有项目自动使用

**注意**:
- 全局配置可能影响所有项目
- 如果某个项目需要不同的规则，需要项目级覆盖

---

## 🔍 验证安装

### 验证脚本

运行验证脚本检查安装是否成功：

```bash
python install/verify.py
```

**预期输出**:
```
==================================================
验证项目级安装
==================================================
✓ .cursorrules 文件: [路径]
✓ docs/planning 目录: [路径]
✓ task_plan_template.md: [路径]
✓ notes_template.md: [路径]

==================================================
验证全局安装
==================================================
✓ Cursor 配置目录: [路径]
✓ 全局 .cursorrules: [路径]

==================================================
验证结果
==================================================
✓ 项目级安装: 正常
✓ 全局安装: 正常

安装验证完成！
```

### 手动验证

1. **检查文件是否存在**
   - 项目根目录下有 `.cursorrules` 文件
   - `docs/planning/` 目录存在
   - 模板文件存在

2. **在 Cursor 中测试**
   - 打开项目
   - 执行一个复杂任务（如"研究某个主题并写总结"）
   - 观察是否自动创建 `task_plan.md` 和 `notes.md`

---

## 🎯 使用方法

### 基本使用

1. **在 Cursor 中打开项目**
   - 确保项目根目录有 `.cursorrules` 文件

2. **开始复杂任务**
   ```
   请帮我研究 TypeScript 的优势，并写一份总结文档
   ```

3. **观察工作流自动激活**
   - Cursor 会自动创建 `task_plan.md`
   - 自动创建 `notes.md`
   - 按阶段执行任务

### 手动触发

你也可以明确要求使用规划工作流：

```
使用规划工作流来设计一个待办事项应用
```

### 查看进度

- 打开 `task_plan.md` 查看当前进度
- 打开 `notes.md` 查看研究笔记
- 查看交付物文件

---

## 🖥️ 不同操作系统说明

### Windows

**安装脚本**: `install.ps1`  
**运行方式**: PowerShell

```powershell
# 确保 PowerShell 执行策略允许运行脚本
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# 运行安装脚本
.\install\install.ps1 project
```

### Linux

**安装脚本**: `install.sh`  
**运行方式**: Bash

```bash
# 确保脚本有执行权限
chmod +x install/install.sh

# 运行安装脚本
./install/install.sh project
```

### macOS

**安装脚本**: `install.sh`  
**运行方式**: Bash

```bash
# 确保脚本有执行权限
chmod +x install/install.sh

# 运行安装脚本
./install/install.sh project
```

---

## 📁 文件结构说明

安装后，你的项目结构应该是：

```
your-project/
├── .cursorrules              # Cursor 规则文件（已安装）
├── docs/
│   └── planning/             # 规划文件目录
│       ├── task_plan_template.md  # 任务计划模板
│       └── notes_template.md      # 研究笔记模板
└── [其他项目文件]
```

使用工作流后，会创建：

```
your-project/
├── task_plan.md              # 任务计划（工作流创建）
├── notes.md                  # 研究笔记（工作流创建）
├── [deliverable].md          # 最终交付物（工作流创建）
└── [其他文件]
```

---

## ❓ 常见问题

### Q1: 安装脚本无法运行

**Windows PowerShell 错误**:
```
无法加载文件，因为在此系统上禁止运行脚本
```

**解决方案**:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Q2: 验证脚本找不到 Python

**错误**: `python: command not found`

**解决方案**:
- 确保已安装 Python 3.x
- 使用 `python3` 代替 `python`:
  ```bash
  python3 install/verify.py
  ```

### Q3: Cursor 没有识别工作流

**可能原因**:
1. `.cursorrules` 文件不在项目根目录
2. Cursor 未重启
3. 文件格式错误

**解决方案**:
1. 检查 `.cursorrules` 文件位置
2. 重启 Cursor IDE
3. 检查文件格式（应该是 Markdown）

### Q4: 工作流没有自动触发

**可能原因**:
1. 任务不符合触发条件（需要 3+ 步骤）
2. 规则理解有误

**解决方案**:
1. 使用明确的复杂任务测试
2. 明确要求："使用规划工作流..."

### Q5: 如何卸载？

**项目级安装**:
```bash
# 删除 .cursorrules 文件
rm .cursorrules

# 删除 docs/planning 目录（可选）
rm -rf docs/planning
```

**全局安装**:
```bash
# Windows
Remove-Item "$env:USERPROFILE\.cursor\rules\.cursorrules"

# Linux/macOS
rm ~/.config/Cursor/rules/.cursorrules
# 或
rm ~/Library/Application\ Support/Cursor/rules/.cursorrules
```

---

## 🔄 更新工作流

### 更新到最新版本

1. **拉取最新代码**
   ```bash
   cd planning-with-files-cursor
   git pull
   ```

2. **重新安装**
   ```bash
   # 项目级
   cd your-project
   ../planning-with-files-cursor/install/install.ps1 project
   
   # 全局
   ../planning-with-files-cursor/install/install.ps1 global
   ```

---

## 📚 相关文档

- [README.md](./README.md) - 项目说明
- [workflow.md](./workflow.md) - 工作流详细文档
- [TESTING.md](./TESTING.md) - 测试指南
- [FINAL_CHECK_REPORT.md](./FINAL_CHECK_REPORT.md) - 最终检查报告
- [OPTIMIZATION_SUMMARY.md](./OPTIMIZATION_SUMMARY.md) - 优化总结

---

## 🆘 获取帮助

如果遇到问题：

1. 查看 [TESTING.md](./TESTING.md) 中的常见问题排查
2. 检查 [FINAL_CHECK_REPORT.md](./FINAL_CHECK_REPORT.md) 中的测试结果
3. 查看 Gitee 仓库的 Issues

---

**创建时间**: 2026-01-07  
**版本**: v1.1  
**项目**: Planning with Files for Cursor
