# Planning with Files for Cursor - Windows 安装脚本
# 版本: v1.0
# 日期: 2026-01-07

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("project", "global")]
    [string]$Mode = "project"
)

$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Planning with Files for Cursor" -ForegroundColor Cyan
Write-Host "安装脚本 (Windows)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 获取脚本所在目录
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectRoot = Split-Path -Parent $ScriptDir

# 检查必要文件
$RequiredFiles = @(
    "$ProjectRoot\.cursorrules",
    "$ProjectRoot\docs\planning\task_plan_template.md",
    "$ProjectRoot\docs\planning\notes_template.md"
)

Write-Host "检查必要文件..." -ForegroundColor Yellow
foreach ($file in $RequiredFiles) {
    if (-not (Test-Path $file)) {
        Write-Host "错误: 找不到文件 $file" -ForegroundColor Red
        exit 1
    }
}
Write-Host "✓ 所有必要文件存在" -ForegroundColor Green
Write-Host ""

if ($Mode -eq "project") {
    # 项目模板方式
    Write-Host "模式: 项目模板方式" -ForegroundColor Cyan
    Write-Host "将复制文件到当前项目..." -ForegroundColor Yellow
    
    $TargetDir = Get-Location
    
    # 复制 .cursorrules
    if (Test-Path "$TargetDir\.cursorrules") {
        Write-Host "警告: .cursorrules 已存在，将备份为 .cursorrules.backup" -ForegroundColor Yellow
        Copy-Item "$TargetDir\.cursorrules" "$TargetDir\.cursorrules.backup" -Force
    }
    Copy-Item "$ProjectRoot\.cursorrules" "$TargetDir\.cursorrules" -Force
    Write-Host "✓ 已复制 .cursorrules" -ForegroundColor Green
    
    # 创建 docs/planning 目录
    $PlanningDir = "$TargetDir\docs\planning"
    if (-not (Test-Path $PlanningDir)) {
        New-Item -ItemType Directory -Path $PlanningDir -Force | Out-Null
        Write-Host "✓ 已创建 docs/planning 目录" -ForegroundColor Green
    }
    
    # 复制模板文件
    Copy-Item "$ProjectRoot\docs\planning\*.md" "$PlanningDir\" -Force
    Write-Host "✓ 已复制规划模板文件" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "安装完成！" -ForegroundColor Green
    Write-Host "现在可以在当前项目中使用规划工作流了。" -ForegroundColor Cyan
    
} elseif ($Mode -eq "global") {
    # 全局配置方式
    Write-Host "模式: 全局配置方式" -ForegroundColor Cyan
    Write-Host "将安装到 Cursor 全局配置目录..." -ForegroundColor Yellow
    
    $CursorGlobalDir = "$env:USERPROFILE\.cursor"
    
    if (-not (Test-Path $CursorGlobalDir)) {
        Write-Host "错误: 找不到 Cursor 配置目录 $CursorGlobalDir" -ForegroundColor Red
        Write-Host "请确保已安装并运行过 Cursor IDE" -ForegroundColor Yellow
        exit 1
    }
    
    # 创建全局 rules 目录
    $GlobalRulesDir = "$CursorGlobalDir\rules"
    if (-not (Test-Path $GlobalRulesDir)) {
        New-Item -ItemType Directory -Path $GlobalRulesDir -Force | Out-Null
        Write-Host "✓ 已创建全局 rules 目录" -ForegroundColor Green
    }
    
    # 复制 .cursorrules 到全局目录
    $GlobalRulesFile = "$GlobalRulesDir\.cursorrules"
    if (Test-Path $GlobalRulesFile) {
        Write-Host "警告: 全局 .cursorrules 已存在，将备份" -ForegroundColor Yellow
        Copy-Item $GlobalRulesFile "$GlobalRulesFile.backup" -Force
    }
    Copy-Item "$ProjectRoot\.cursorrules" $GlobalRulesFile -Force
    Write-Host "✓ 已安装全局 .cursorrules" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "安装完成！" -ForegroundColor Green
    Write-Host "规划工作流已全局启用，所有项目将自动使用。" -ForegroundColor Cyan
    Write-Host "注意: 全局配置可能影响所有项目，请谨慎使用。" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "安装完成！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan

