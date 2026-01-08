# GitHub 仓库设置脚本
# 用于将代码推送到 GitHub

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "GitHub 仓库设置" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查是否已添加 GitHub 远程仓库
$githubRemote = git remote get-url github 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "添加 GitHub 远程仓库..." -ForegroundColor Yellow
    git remote add github git@github.com:szqjl/planning-with-files-cursor.git
    Write-Host "✓ GitHub 远程仓库已添加" -ForegroundColor Green
} else {
    Write-Host "✓ GitHub 远程仓库已存在: $githubRemote" -ForegroundColor Green
}

# 显示所有远程仓库
Write-Host ""
Write-Host "当前远程仓库:" -ForegroundColor Cyan
git remote -v

# 检查当前分支
Write-Host ""
Write-Host "当前分支:" -ForegroundColor Cyan
$currentBranch = git branch --show-current
Write-Host $currentBranch -ForegroundColor Yellow

# 检查是否有未提交的更改
Write-Host ""
Write-Host "检查未提交的更改..." -ForegroundColor Yellow
$status = git status --porcelain
if ($status) {
    Write-Host "发现未提交的更改，请先提交:" -ForegroundColor Red
    git status
    exit 1
} else {
    Write-Host "✓ 没有未提交的更改" -ForegroundColor Green
}

# 推送代码
Write-Host ""
Write-Host "推送代码到 GitHub..." -ForegroundColor Yellow
Write-Host "分支: $currentBranch" -ForegroundColor Cyan

git push -u github $currentBranch

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "✓ 代码已成功推送到 GitHub!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "GitHub 仓库地址:" -ForegroundColor Cyan
    Write-Host "https://github.com/szqjl/planning-with-files-cursor" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "下一步操作:" -ForegroundColor Cyan
    Write-Host "1. 访问 GitHub 仓库添加描述和 Topics" -ForegroundColor White
    Write-Host "2. 创建第一个 Release (v1.1.0)" -ForegroundColor White
    Write-Host "3. 查看 GITHUB_SETUP_COMPLETE.md 获取详细指南" -ForegroundColor White
} else {
    Write-Host ""
    Write-Host "推送失败，请检查:" -ForegroundColor Red
    Write-Host "1. SSH 密钥是否已配置" -ForegroundColor Yellow
    Write-Host "2. GitHub 仓库是否已创建" -ForegroundColor Yellow
    Write-Host "3. 是否有推送权限" -ForegroundColor Yellow
}
