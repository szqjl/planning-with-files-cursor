#!/bin/bash
# Planning with Files for Cursor - Linux/macOS 安装脚本
# 版本: v1.0
# 日期: 2026-01-07

set -e

MODE="${1:-project}"

echo "========================================"
echo "Planning with Files for Cursor"
echo "安装脚本 (Linux/macOS)"
echo "========================================"
echo ""

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# 检查必要文件
REQUIRED_FILES=(
    "$PROJECT_ROOT/.cursorrules"
    "$PROJECT_ROOT/docs/planning/task_plan_template.md"
    "$PROJECT_ROOT/docs/planning/notes_template.md"
)

echo "检查必要文件..."
for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "错误: 找不到文件 $file" >&2
        exit 1
    fi
done
echo "✓ 所有必要文件存在"
echo ""

if [ "$MODE" = "project" ]; then
    # 项目模板方式
    echo "模式: 项目模板方式"
    echo "将复制文件到当前项目..."
    
    TARGET_DIR="$(pwd)"
    
    # 复制 .cursorrules
    if [ -f "$TARGET_DIR/.cursorrules" ]; then
        echo "警告: .cursorrules 已存在，将备份为 .cursorrules.backup"
        cp "$TARGET_DIR/.cursorrules" "$TARGET_DIR/.cursorrules.backup"
    fi
    cp "$PROJECT_ROOT/.cursorrules" "$TARGET_DIR/.cursorrules"
    echo "✓ 已复制 .cursorrules"
    
    # 创建 docs/planning 目录
    PLANNING_DIR="$TARGET_DIR/docs/planning"
    mkdir -p "$PLANNING_DIR"
    echo "✓ 已创建 docs/planning 目录"
    
    # 复制模板文件
    cp "$PROJECT_ROOT/docs/planning/"*.md "$PLANNING_DIR/"
    echo "✓ 已复制规划模板文件"
    
    echo ""
    echo "安装完成！"
    echo "现在可以在当前项目中使用规划工作流了。"
    
elif [ "$MODE" = "global" ]; then
    # 全局配置方式
    echo "模式: 全局配置方式"
    echo "将安装到 Cursor 全局配置目录..."
    
    # 检测操作系统
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        CURSOR_GLOBAL_DIR="$HOME/Library/Application Support/Cursor"
    else
        # Linux
        CURSOR_GLOBAL_DIR="$HOME/.config/Cursor"
    fi
    
    if [ ! -d "$CURSOR_GLOBAL_DIR" ]; then
        echo "错误: 找不到 Cursor 配置目录 $CURSOR_GLOBAL_DIR" >&2
        echo "请确保已安装并运行过 Cursor IDE" >&2
        exit 1
    fi
    
    # 创建全局 rules 目录
    GLOBAL_RULES_DIR="$CURSOR_GLOBAL_DIR/rules"
    mkdir -p "$GLOBAL_RULES_DIR"
    echo "✓ 已创建全局 rules 目录"
    
    # 复制 .cursorrules 到全局目录
    GLOBAL_RULES_FILE="$GLOBAL_RULES_DIR/.cursorrules"
    if [ -f "$GLOBAL_RULES_FILE" ]; then
        echo "警告: 全局 .cursorrules 已存在，将备份"
        cp "$GLOBAL_RULES_FILE" "$GLOBAL_RULES_FILE.backup"
    fi
    cp "$PROJECT_ROOT/.cursorrules" "$GLOBAL_RULES_FILE"
    echo "✓ 已安装全局 .cursorrules"
    
    echo ""
    echo "安装完成！"
    echo "规划工作流已全局启用，所有项目将自动使用。"
    echo "注意: 全局配置可能影响所有项目，请谨慎使用。"
else
    echo "错误: 无效的模式 '$MODE'" >&2
    echo "用法: $0 [project|global]" >&2
    exit 1
fi

echo ""
echo "========================================"
echo "安装完成！"
echo "========================================"

