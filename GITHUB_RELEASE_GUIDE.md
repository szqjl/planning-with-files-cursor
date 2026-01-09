# GitHub 发布指南

本指南说明如何在 GitHub 上正式发布本项目。

## 📋 发布前检查清单

### ✅ 已完成
- [x] 代码已推送到 GitHub
- [x] README.md 已完善
- [x] CHANGELOG.md 已更新
- [x] 文档完整

### 🔄 需要完成
- [ ] 创建 LICENSE 文件
- [ ] 创建版本标签（Tag）
- [ ] 创建 GitHub Release
- [ ] 更新 CHANGELOG 中的链接
- [ ] 在 GitHub 上设置项目信息

---

## 🚀 发布步骤

### 步骤 1: 创建 LICENSE 文件

已创建 `LICENSE` 文件（MIT License）。

### 步骤 2: 创建版本标签

```bash
# 创建 v1.1.0 标签
git tag -a v1.1.0 -m "Release v1.1.0: 完善安装说明和文档"

# 推送标签到 GitHub
git push origin v1.1.0

# 如果需要，也推送到 Gitee
git push gitee v1.1.0
```

### 步骤 3: 更新 CHANGELOG 链接

更新 CHANGELOG.md 中的链接，添加 GitHub Release 链接。

### 步骤 4: 在 GitHub 网页上创建 Release

1. **访问 GitHub 仓库**
   - 打开: https://github.com/szqjl/planning-with-files-cursor

2. **创建 Release**
   - 点击右侧 "Releases" → "Create a new release"
   - 或直接访问: https://github.com/szqjl/planning-with-files-cursor/releases/new

3. **填写 Release 信息**
   - **Tag version**: `v1.1.0` (选择已创建的标签)
   - **Release title**: `v1.1.0 - 完善安装说明和文档`
   - **Description**: 使用下面的 Release Notes 模板

4. **Release Notes 模板**:

```markdown
## 🎉 Release v1.1.0

### ✨ 新增功能
- ✅ 完善 Windows 全局安装指南
- ✅ 添加多种安装方式说明（PowerShell、CMD、Git Bash）
- ✅ 更新使用文档和常见问题解答

### 🔧 改进
- 📝 优化安装说明，提供更清晰的步骤
- 📝 完善 Windows 下的安装方法
- 📝 更新文档链接和结构

### 📦 安装方式

**项目级安装（推荐）:**
```powershell
cd your-project
..\planning-with-files-cursor\install\install.ps1 project
```

**全局安装:**
```powershell
cd planning-with-files-cursor
.\install\install.ps1 global
```

### 📚 文档
- [使用指南](USAGE_GUIDE.md)
- [工作流文档](workflow.md)
- [测试指南](TESTING.md)

### 🔗 相关链接
- [Gitee 仓库](https://gitee.com/philsz/planning-with-files-cursor)
- [GitHub 仓库](https://github.com/szqjl/planning-with-files-cursor)

---

**完整更新日志**: 查看 [CHANGELOG.md](CHANGELOG.md)
```

5. **发布 Release**
   - 点击 "Publish release" 按钮

### 步骤 5: 在 GitHub 上设置项目信息

1. **访问仓库设置**
   - 打开: https://github.com/szqjl/planning-with-files-cursor/settings

2. **设置项目描述**
   - 在仓库主页点击 ⚙️ Settings → General
   - 在 "Description" 中填写:
     ```
     将 Manus AI 的规划工作流模式适配到 Cursor IDE，实现基于文件的规划、跟踪和知识存储
     ```

3. **添加 Topics（标签）**
   - 在仓库主页点击 ⚙️ Settings → General → Topics
   - 添加以下标签:
     - `cursor-ide`
     - `planning-workflow`
     - `manus-ai`
     - `cursor-rules`
     - `ai-assistant`
     - `workflow-automation`
     - `markdown`
     - `productivity`

4. **设置网站（可选）**
   - 如果有项目网站，可以在 Settings → Pages 中设置

5. **设置可见性**
   - 确保仓库是 Public（公开的）

### 步骤 6: 提交更改

```bash
# 添加新文件
git add LICENSE GITHUB_RELEASE_GUIDE.md

# 更新 CHANGELOG（如果需要）
# git add CHANGELOG.md

# 提交
git commit -m "添加 LICENSE 文件和 GitHub 发布指南"

# 推送
git push origin master
git push gitee master
```

---

## 📝 发布后检查

- [ ] Release 已创建并可见
- [ ] 标签已正确创建
- [ ] LICENSE 文件已添加
- [ ] 项目描述和 Topics 已设置
- [ ] README 中的链接正确
- [ ] CHANGELOG 链接已更新

---

## 🎯 推广建议

发布后可以考虑：

1. **在相关社区分享**
   - Cursor IDE 用户社区
   - AI 编程工具讨论区
   - 开发者社区

2. **创建演示视频或文章**
   - 展示工作流的使用方法
   - 说明如何安装和配置

3. **收集反馈**
   - 鼓励用户提交 Issue
   - 收集使用反馈和改进建议

---

## 📚 相关资源

- [GitHub Releases 文档](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository)
- [语义化版本控制](https://semver.org/)
- [Keep a Changelog](https://keepachangelog.com/)

---

**创建时间**: 2026-01-09  
**版本**: v1.1.0
