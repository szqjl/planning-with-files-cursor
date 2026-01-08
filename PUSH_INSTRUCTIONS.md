# 推送到 GitHub 操作步骤

## ✅ 已执行的命令

1. ✅ 设置远程仓库 URL: `git remote set-url github git@github.com:szqjl/planning-with-files-cursor.git`
2. ✅ 添加所有更改: `git add -A`
3. ✅ 提交更改: `git commit -m "更新：添加推送脚本和文档，准备推送到 GitHub"`
4. ✅ 推送到 GitHub: `git push -u github master`

## 🔍 验证推送是否成功

### 方法 1: 检查远程仓库状态

```bash
# 查看远程仓库配置
git remote -v

# 应该显示：
# github  git@github.com:szqjl/planning-with-files-cursor.git (fetch)
# github  git@github.com:szqjl/planning-with-files-cursor.git (push)
```

### 方法 2: 检查推送状态

```bash
# 查看本地和远程的差异（仅在推送后使用）
git log github/master..master

# 如果出现 "unknown revision" 错误，说明还没有推送过
# 这是正常的，推送后就不会有这个错误了
```

### 方法 3: 直接访问 GitHub

访问以下 URL 查看代码是否已推送：
**https://github.com/szqjl/planning-with-files-cursor**

## 🔄 如果推送失败，手动重试

### 步骤 1: 检查 SSH 连接

```bash
# 测试 SSH 连接
ssh -T git@github.com

# 应该看到类似：
# Hi szqjl! You've successfully authenticated, but GitHub does not provide shell access.
```

### 步骤 2: 确认远程仓库配置

```bash
# 查看远程仓库
git remote -v

# 如果 github 不存在或 URL 不正确，重新设置：
git remote set-url github git@github.com:szqjl/planning-with-files-cursor.git
```

### 步骤 3: 推送代码

```bash
# 确保所有更改已提交
git status

# 如果有未提交的更改
git add -A
git commit -m "更新说明"

# 推送到 GitHub
git push -u github master

# 如果使用 main 分支
git push -u github main
```

## 📋 推送后的下一步

推送成功后，在 GitHub 上：

1. **访问仓库**: https://github.com/szqjl/planning-with-files-cursor
2. **添加仓库描述**: "将 Manus AI 的规划工作流模式适配到 Cursor IDE"
3. **添加 Topics**: `cursor-ide`, `planning-workflow`, `manus-ai`, `productivity`
4. **创建 Release**: Tag `v1.1.0`

## 🆘 常见问题

### 问题 1: Permission denied

**原因**: SSH 密钥未配置或未添加到 GitHub

**解决**:
1. 生成 SSH 密钥: `ssh-keygen -t ed25519 -C "your_email@example.com"`
2. 添加到 SSH agent: `ssh-add ~/.ssh/id_ed25519`
3. 复制公钥: `cat ~/.ssh/id_ed25519.pub`
4. 在 GitHub Settings → SSH and GPG keys 中添加

### 问题 2: Repository not found

**原因**: 仓库不存在或没有访问权限

**解决**: 确认仓库地址和权限

### 问题 3: Branch 'master' not found

**原因**: GitHub 可能使用 `main` 分支

**解决**:
```bash
git branch -M main
git push -u github main
```

---

**创建时间**: 2026-01-07
