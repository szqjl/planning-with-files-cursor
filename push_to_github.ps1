# 推送到 GitHub 脚本

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "推送到 GitHub" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查远程仓库
Write-Host "检查远程仓库配置..." -ForegroundColor Yellow
$githubUrl = git remote get-url github 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ GitHub 远程仓库: $githubUrl" -ForegroundColor Green
} else {
    Write-Host "✗ GitHub 远程仓库不存在" -ForegroundColor Red
    Write-Host "请先运行: git remote add github git@github.com:szqjl/planning-with-files-cursor.git" -ForegroundColor Yellow
    exit 1
}

# 检查当前分支
Write-Host ""
Write-Host "当前分支:" -ForegroundColor Yellow
$branch = git branch --show-current
Write-Host $branch -ForegroundColor Cyan

# 检查未提交的更改
Write-Host ""
Write-Host "检查未提交的更改..." -ForegroundColor Yellow
$status = git status --porcelain
if ($status) {
    Write-Host "发现未提交的更改，正在提交..." -ForegroundColor Yellow
    git add -A
    git commit -m "更新：准备推送到 GitHub"
    if ($LASTEXITCODE -ne 0) {
        Write-Host "✗ 提交失败" -ForegroundColor Red
        exit 1
    }
    Write-Host "✓ 已提交更改" -ForegroundColor Green
} else {
    Write-Host "✓ 没有未提交的更改" -ForegroundColor Green
}

# 推送到 GitHub
Write-Host ""
Write-Host "推送到 GitHub..." -ForegroundColor Yellow
Write-Host "分支: $branch" -ForegroundColor Cyan
Write-Host "远程: github" -ForegroundColor Cyan
Write-Host ""

git push -u github $branch

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "✓ 代码已成功推送到 GitHub!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "GitHub 仓库地址:" -ForegroundColor Cyan
    Write-Host "https://github.com/szqjl/planning-with-files-cursor" -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host "✗ 推送失败" -ForegroundColor Red
    Write-Host ""
    Write-Host "可能的原因:" -ForegroundColor Yellow
    Write-Host "1. SSH 密钥未配置或未添加到 GitHub" -ForegroundColor White
    Write-Host "2. 网络连接问题" -ForegroundColor White
    Write-Host "3. 权限问题" -ForegroundColor White
    Write-Host ""
    Write-Host "请检查:" -ForegroundColor Yellow
    Write-Host "1. SSH 密钥: ssh -T git@github.com" -ForegroundColor White
    Write-Host "2. 远程仓库 URL: git remote get-url github" -ForegroundColor White
}
