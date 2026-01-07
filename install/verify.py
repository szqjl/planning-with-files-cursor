#!/usr/bin/env python3
"""
Planning with Files for Cursor - 验证脚本
版本: v1.0
日期: 2026-01-07
"""

import os
import sys
from pathlib import Path

def check_file_exists(filepath, description):
    """检查文件是否存在"""
    if os.path.exists(filepath):
        print(f"✓ {description}: {filepath}")
        return True
    else:
        print(f"✗ {description}: {filepath} (不存在)")
        return False

def verify_project_installation(project_dir):
    """验证项目级安装"""
    print("=" * 50)
    print("验证项目级安装")
    print("=" * 50)
    
    project_path = Path(project_dir)
    all_ok = True
    
    # 检查 .cursorrules
    cursorrules = project_path / ".cursorrules"
    all_ok &= check_file_exists(cursorrules, ".cursorrules 文件")
    
    # 检查模板文件
    planning_dir = project_path / "docs" / "planning"
    task_template = planning_dir / "task_plan_template.md"
    notes_template = planning_dir / "notes_template.md"
    
    all_ok &= check_file_exists(planning_dir, "docs/planning 目录")
    all_ok &= check_file_exists(task_template, "task_plan_template.md")
    all_ok &= check_file_exists(notes_template, "notes_template.md")
    
    return all_ok

def verify_global_installation():
    """验证全局安装"""
    print("=" * 50)
    print("验证全局安装")
    print("=" * 50)
    
    # 检测操作系统
    if sys.platform == "darwin":
        cursor_dir = Path.home() / "Library" / "Application Support" / "Cursor"
    elif sys.platform == "win32":
        cursor_dir = Path.home() / ".cursor"
    else:
        cursor_dir = Path.home() / ".config" / "Cursor"
    
    all_ok = True
    
    if not cursor_dir.exists():
        print(f"✗ Cursor 配置目录不存在: {cursor_dir}")
        return False
    
    print(f"✓ Cursor 配置目录: {cursor_dir}")
    
    # 检查全局 .cursorrules
    global_rules = cursor_dir / "rules" / ".cursorrules"
    all_ok &= check_file_exists(global_rules, "全局 .cursorrules")
    
    return all_ok

def main():
    """主函数"""
    print("Planning with Files for Cursor - 验证脚本")
    print("=" * 50)
    print()
    
    # 获取当前目录
    current_dir = os.getcwd()
    
    # 验证项目级安装
    project_ok = verify_project_installation(current_dir)
    print()
    
    # 验证全局安装
    global_ok = verify_global_installation()
    print()
    
    # 总结
    print("=" * 50)
    print("验证结果")
    print("=" * 50)
    
    if project_ok:
        print("✓ 项目级安装: 正常")
    else:
        print("✗ 项目级安装: 不完整")
    
    if global_ok:
        print("✓ 全局安装: 正常")
    else:
        print("✗ 全局安装: 未安装或配置目录不存在")
    
    if project_ok or global_ok:
        print()
        print("安装验证完成！")
        return 0
    else:
        print()
        print("错误: 未找到任何安装")
        print("请先运行安装脚本: install.ps1 (Windows) 或 install.sh (Linux/macOS)")
        return 1

if __name__ == "__main__":
    sys.exit(main())

