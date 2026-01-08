# 修复 GitHub 远程仓库配置脚本

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "修复 GitHub 远程仓库配置" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 显示当前配置
Write-Host "当前远程仓库配置:" -ForegroundColor Yellow
git remote -v
Write-Host ""

# 检查是否存在 github 远程仓库
$githubExists = git remote get-url github 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "发现现有的 github 远程仓库" -ForegroundColor Yellow
    Write-Host "URL: $githubExists" -ForegroundColor Cyan
    
    # 检查是否是占位符
    if ($githubExists -like "*你的用户名*" -or $githubExists -like "*your-username*") {
        Write-Host "检测到占位符 URL，需要更新" -ForegroundColor Red
        Write-Host ""
        Write-Host "删除旧的远程仓库..." -ForegroundColor Yellow
        git remote remove github
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ 已删除旧的远程仓库" -ForegroundColor Green
        }
    } else {
        Write-Host "远程仓库 URL 看起来正确" -ForegroundColor Green
        Write-Host "是否要重新添加？(Y/N)" -ForegroundColor Yellow
        $response = Read-Host
        if ($response -eq "Y" -or $response -eq "y") {
            git remote remove github
        } else {
            Write-Host "跳过更新" -ForegroundColor Yellow
            exit 0
        }
    }
} else {
    Write-Host "github 远程仓库不存在" -ForegroundColor Yellow
}

# 添加正确的远程仓库
Write-Host ""
Write-Host "添加正确的 GitHub 远程仓库..." -ForegroundColor Yellow
Write-Host "URL: git@github.com:szqjl/planning-with-files-cursor.git" -ForegroundColor Cyan

git remote add github git@github.com:szqjl/planning-with-files-cursor.git

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ GitHub 远程仓库已添加" -ForegroundColor Green
} else {
    Write-Host "✗ 添加失败" -ForegroundColor Red
    exit 1
}

# 验证配置
Write-Host ""
Write-Host "验证配置..." -ForegroundColor Yellow
git remote -v

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "✓ 配置完成！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# 询问是否推送
Write-Host "是否现在推送到 GitHub？(Y/N)" -ForegroundColor Yellow
$pushResponse = Read-Host

if ($pushResponse -eq "Y" -or $pushResponse -eq "y") {
    Write-Host ""
    Write-Host "检查未提交的更改..." -ForegroundColor Yellow
    $status = git status --porcelain
    if ($status) {
        Write-Host "发现未提交的更改，正在提交..." -ForegroundColor Yellow
        git add -A
        git commit -m "更新：修复 GitHub 远程仓库配置"
    }
    
    Write-Host ""
    Write-Host "推送到 GitHub..." -ForegroundColor Yellow
    git push -u github master
    
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
        Write-Host "请检查 SSH 密钥配置" -ForegroundColor Yellow
    }
} else {
    Write-Host ""
    Write-Host "稍后可以运行以下命令推送:" -ForegroundColor Cyan
    Write-Host "git push -u github master" -ForegroundColor Yellow
}
