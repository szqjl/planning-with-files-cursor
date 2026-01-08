#!/bin/bash
# GitHub 仓库设置脚本
# 用于将代码推送到 GitHub

echo "========================================"
echo "GitHub 仓库设置"
echo "========================================"
echo ""

# 检查是否已添加 GitHub 远程仓库
if ! git remote get-url github &>/dev/null; then
    echo "添加 GitHub 远程仓库..."
    git remote add github git@github.com:szqjl/planning-with-files-cursor.git
    echo "✓ GitHub 远程仓库已添加"
else
    echo "✓ GitHub 远程仓库已存在: $(git remote get-url github)"
fi

# 显示所有远程仓库
echo ""
echo "当前远程仓库:"
git remote -v

# 检查当前分支
echo ""
echo "当前分支:"
current_branch=$(git branch --show-current)
echo "$current_branch"

# 检查是否有未提交的更改
echo ""
echo "检查未提交的更改..."
if [ -n "$(git status --porcelain)" ]; then
    echo "发现未提交的更改，请先提交:"
    git status
    exit 1
else
    echo "✓ 没有未提交的更改"
fi

# 推送代码
echo ""
echo "推送代码到 GitHub..."
echo "分支: $current_branch"

git push -u github "$current_branch"

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "✓ 代码已成功推送到 GitHub!"
    echo "========================================"
    echo ""
    echo "GitHub 仓库地址:"
    echo "https://github.com/szqjl/planning-with-files-cursor"
    echo ""
    echo "下一步操作:"
    echo "1. 访问 GitHub 仓库添加描述和 Topics"
    echo "2. 创建第一个 Release (v1.1.0)"
    echo "3. 查看 GITHUB_SETUP_COMPLETE.md 获取详细指南"
else
    echo ""
    echo "推送失败，请检查:"
    echo "1. SSH 密钥是否已配置"
    echo "2. GitHub 仓库是否已创建"
    echo "3. 是否有推送权限"
fi
