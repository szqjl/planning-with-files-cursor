# 任务计划：Planning with Files for Cursor

## 🎯 项目目标

将 Manus AI 的规划工作流模式适配到 Cursor IDE，让用户可以通过简单的复制操作就能在 Cursor 中使用规划工作流。

## 📋 项目阶段

### Phase 1: 研究和探索 ✅
- [x] 研究 planning-with-files 项目的工作流模式
- [x] 分析 Cursor IDE 的配置机制需求
- [x] 确定需要探索的关键问题
- [x] 创建项目初始结构

### Phase 2: 配置机制研究 🔄
- [x] 探索 Cursor 的全局配置目录位置 (Windows: `%USERPROFILE%\.cursor\`)
- [x] 测试 `.cursorrules` 的加载机制 (已创建模板文件)
- [ ] 验证配置加载优先级 (待实际测试)
- [x] 记录研究结果到 `notes.md`

### Phase 3: 实现方案设计
- [ ] 评估方案 1: 项目模板方式
- [ ] 评估方案 2: 全局配置方式
- [ ] 评估方案 3: VS Code 扩展方式
- [ ] 评估方案 4: 混合方案
- [ ] 选择最佳实现方案

### Phase 4: 核心功能开发
- [x] 创建 `.cursorrules` 模板
- [x] 实现规划工作流指令
- [x] 创建规划文件结构模板
- [x] 编写工作流文档

### Phase 5: 安装脚本开发 ✅
- [x] 编写 Windows 安装脚本 (install.ps1)
- [x] 编写 Linux/macOS 安装脚本 (install.sh)
- [x] 编写验证脚本 (verify.py)
- [ ] 测试安装流程 (待实际测试)

### Phase 6: 文档和测试
- [x] 完善 README.md
- [ ] 编写使用示例
- [ ] 创建快速开始指南
- [ ] 测试完整工作流
- [x] Git 仓库初始化
- [ ] 推送到 Gitee 仓库

## 📊 当前状态

**当前阶段**: Phase 3 → Phase 5 (进行中)

**下一步行动**: 
1. ✅ Phase 2-4 核心功能 (已完成)
2. ✅ Phase 3 方案设计 (已完成，选择混合方案)
3. 🔄 Phase 5: 安装脚本开发 (下一步)
   - 编写 Windows 安装脚本 (install.ps1)
   - 编写 Linux/macOS 安装脚本 (install.sh)
   - 编写验证脚本 (verify.py)
4. ⏳ 测试验证 `.cursorrules` 实际效果

## 🔄 工作流循环

1. **创建计划** → `task_plan.md` (本文件)
2. **研究探索** → 保存到 `notes.md`
3. **更新计划** → 更新本文件的进度
4. **开发实现** → 创建交付物
5. **验证测试** → 更新状态

## 📝 关键原则

- **文件系统作为内存**: 所有研究、计划、笔记都存储在文件中
- **注意力操作**: 每次决策前重新读取 `task_plan.md`
- **错误持久化**: 记录所有遇到的问题和解决方案
- **目标跟踪**: 使用复选框跟踪进度
- **仅追加上下文**: 不修改历史记录，只追加新内容

## 🐛 已知问题

_待记录_

## ✅ 已完成

- 创建项目初始结构
- 研究 planning-with-files 项目
- 创建任务计划文件
- 探索 Cursor Windows 配置目录 (`%USERPROFILE%\.cursor\`)
- 发现项目配置存储在 `.cursor\projects\[项目路径]\rules\`
- 记录初步研究结果到 `notes.md`
- **创建 `.cursorrules` 模板文件** (实现规划工作流)
- **实现规划工作流指令** (自动触发、3-File Pattern)
- **创建规划文件结构模板** (task_plan.md, notes.md 模板)
- **编写工作流文档** (workflow.md)
- **完成 Phase 3 方案设计** (选择混合方案)
- **完成 Phase 5 安装脚本** (Windows、Linux/macOS、验证脚本)

---

**最后更新**: 2026-01-07 22:28
**项目位置**: D:\CursorPlan\planning-with-files-cursor\

