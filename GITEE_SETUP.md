# Gitee 仓库设置指南

## 📋 在 Gitee 创建仓库

### 步骤 1: 登录 Gitee
访问 [https://gitee.com](https://gitee.com) 并登录你的账号

### 步骤 2: 创建新仓库

1. 点击右上角的 **"+"** 按钮，选择 **"新建仓库"**

2. 填写仓库信息：
   - **仓库名称**: `planning-with-files-cursor`
   - **仓库介绍**: `将 Manus AI 的规划工作流模式适配到 Cursor IDE`
   - **仓库类型**: 选择 **公开（Public）** 或 **私有（Private）**
   - **是否初始化仓库**: ❌ **不勾选**（我们已经有了本地仓库）

3. 点击 **"创建"** 按钮

### 步骤 3: 获取仓库地址

创建成功后，Gitee 会显示仓库地址，格式如下：
- HTTPS: `https://gitee.com/你的用户名/planning-with-files-cursor.git`
- SSH: `git@gitee.com:你的用户名/planning-with-files-cursor.git`

## 🚀 推送代码到 Gitee

### 方式 1: 使用 HTTPS（推荐新手）

```bash
# 添加远程仓库
git remote add origin https://gitee.com/你的用户名/planning-with-files-cursor.git

# 推送代码
git push -u origin master
```

如果 Gitee 使用 `main` 作为默认分支：
```bash
git push -u origin main
```

### 方式 2: 使用 SSH（推荐）

如果你已经配置了 SSH 密钥：

```bash
# 添加远程仓库
git remote add origin git@gitee.com:你的用户名/planning-with-files-cursor.git

# 推送代码
git push -u origin master
```

或使用 `main` 分支：
```bash
git push -u origin main
```

## 📝 后续推送

首次推送后，后续只需要：

```bash
git add .
git commit -m "更新说明"
git push
```

## 🔧 如果遇到问题

### 问题 1: 分支名称不匹配

如果本地是 `master` 但 Gitee 使用 `main`：

```bash
# 重命名本地分支
git branch -M main

# 推送
git push -u origin main
```

### 问题 2: 需要身份验证

使用 HTTPS 时，Gitee 会要求输入用户名和密码：
- 用户名：你的 Gitee 用户名
- 密码：你的 Gitee 密码（或访问令牌）

### 问题 3: 已存在远程仓库

如果之前已经添加过远程仓库：

```bash
# 查看当前远程仓库
git remote -v

# 如果需要更新远程地址
git remote set-url origin https://gitee.com/你的用户名/planning-with-files-cursor.git
```

## 📊 仓库结构

推送后，Gitee 仓库将包含：

```
planning-with-files-cursor/
├── README.md
├── task_plan.md
├── notes.md
├── workflow.md
├── .cursorrules
├── .gitignore
├── docs/
│   └── planning/
│       ├── task_plan_template.md
│       └── notes_template.md
└── install/
    ├── install.ps1
    ├── install.sh
    └── verify.py
```

## 🎯 下一步

推送成功后，你可以：

1. 在 Gitee 上查看项目
2. 设置仓库描述和标签
3. 添加 README 徽章（可选）
4. 邀请协作者（如果需要）
5. 开启 Issues 和 Pull Requests

---

**创建时间**: 2026-01-07  
**项目**: Planning with Files for Cursor

