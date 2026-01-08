# GitHub 推荐指南

## 🎯 推荐策略

### 1. 创建 GitHub 仓库

#### 步骤 1: 在 GitHub 创建新仓库

1. 访问 [GitHub](https://github.com) 并登录
2. 点击右上角 **"+"** → **"New repository"**
3. 填写仓库信息：
   - **Repository name**: `planning-with-files-cursor`
   - **Description**: `将 Manus AI 的规划工作流模式适配到 Cursor IDE - Planning with Files workflow for Cursor IDE`
   - **Visibility**: Public（公开）
   - **不要**初始化仓库（我们已经有了本地仓库）

#### 步骤 2: 添加远程仓库

```bash
# 添加 GitHub 远程仓库
# ⚠️ 注意：将"你的用户名"替换为实际的 GitHub 用户名
# 例如：git remote add github git@github.com:szqjl/planning-with-files-cursor.git
git remote add github https://github.com/你的用户名/planning-with-files-cursor.git

# 如果出现 "error: remote github already exists." 错误
# 说明远程仓库已存在，可以：
# 1. 查看现有配置：git remote -v
# 2. 如果 URL 正确，直接推送：git push -u github master
# 3. 如果 URL 不正确，更新它：git remote set-url github <新URL>

# 查看所有远程仓库
git remote -v
```

#### 步骤 3: 推送到 GitHub

```bash
# 推送代码到 GitHub
git push -u github master

# 如果 GitHub 使用 main 分支
git branch -M main
git push -u github main
```

### 2. 优化 README 以吸引 GitHub 用户

#### 关键元素

1. **清晰的项目描述**
   - 一句话说明项目价值
   - 突出核心功能

2. **徽章（Badges）**
   - 项目状态
   - 许可证
   - 版本信息

3. **功能特性列表**
   - 核心功能
   - 使用场景

4. **快速开始指南**
   - 安装步骤
   - 使用示例

5. **截图或示例**
   - 工作流示例
   - 使用效果

### 3. GitHub 推荐最佳实践

#### 3.1 README 优化

**添加徽章**:
```markdown
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Version](https://img.shields.io/badge/version-1.1-green.svg)
![Status](https://img.shields.io/badge/status-stable-success.svg)
```

**添加特性列表**:
- ✅ 自动触发规划工作流
- ✅ 3-File Pattern 实现
- ✅ 减少用户确认，自动执行
- ✅ 支持项目级和全局配置

**添加使用示例**:
- 代码示例
- 工作流示例
- 效果展示

#### 3.2 Topics 标签

在 GitHub 仓库设置中添加相关 Topics：
- `cursor-ide`
- `planning-workflow`
- `manus-ai`
- `productivity`
- `ai-assistant`
- `workflow-automation`
- `cursor-rules`
- `planning-with-files`

#### 3.3 创建 Release

创建第一个 Release：
- **Tag**: `v1.1.0`
- **Title**: `Planning with Files for Cursor v1.1`
- **Description**: 包含更新日志和功能说明

#### 3.4 添加 GitHub Actions（可选）

创建自动化工作流：
- 自动测试
- 自动发布
- 代码质量检查

### 4. 推广渠道

#### 4.1 GitHub 社区

1. **相关项目 Issues**
   - 在相关项目的 Issues 中分享（如果合适）
   - 在讨论区推荐

2. **GitHub Discussions**
   - 在相关项目的 Discussions 中分享
   - 创建自己的 Discussions

3. **GitHub Gists**
   - 创建使用示例的 Gist
   - 链接到主项目

#### 4.2 社交媒体

1. **Twitter/X**
   - 分享项目链接
   - 使用相关标签

2. **Reddit**
   - 在相关 subreddit 分享
   - r/programming
   - r/cursor
   - r/ProductivityApps

3. **技术社区**
   - Hacker News
   - Dev.to
   - Medium

#### 4.3 技术博客

1. **写博客文章**
   - 介绍项目背景
   - 使用教程
   - 技术细节

2. **视频教程**
   - YouTube 演示
   - 使用教程

### 5. 持续维护

#### 5.1 保持活跃

- 及时回复 Issues
- 处理 Pull Requests
- 定期更新文档
- 发布新版本

#### 5.2 收集反馈

- 鼓励用户提交 Issues
- 收集使用反馈
- 持续改进

---

**创建时间**: 2026-01-07  
**版本**: v1.0
