# 研究笔记：Planning with Files for Cursor

## 📚 参考资料

### planning-with-files 项目
- **GitHub**: https://github.com/OthmanAdi/planning-with-files
- **核心模式**: 3-File Pattern (task_plan.md, notes.md, deliverable.md)
- **工作流循环**: 创建计划 → 研究 → 更新计划 → 创建交付物 → 更新计划

### Manus AI 工作流原则
1. **文件系统作为内存**: 存储在文件中，而非上下文中
2. **注意力操作**: 重新读取计划文件以保持目标在注意力窗口
3. **错误持久化**: 记录失败以便未来参考
4. **目标跟踪**: 使用复选框显示进度
5. **仅追加上下文**: 永不修改历史

## 🔍 Cursor IDE 配置研究

### 待探索的问题

#### 1. Cursor 配置目录
- [x] Windows 配置目录位置: `%USERPROFILE%\.cursor\`
- [ ] macOS 配置目录位置: `~/Library/Application Support/Cursor/` (推测)
- [ ] Linux 配置目录位置: `~/.config/Cursor/` (推测)
- [x] 全局配置 vs 项目配置: 项目配置存储在 `.cursor\projects\[项目路径]\rules\`

#### 2. .cursorrules 机制
- [ ] 是否支持全局 `.cursorrules`？(待测试)
- [x] 是否支持项目级 `.cursorrules`？(已创建模板文件，待验证)
- [ ] 配置加载优先级 (待测试)
- [x] 配置格式和语法 (Markdown 格式，已创建模板)

#### 3. 实现方案对比与选择

**方案 1: 项目模板方式** ⭐ 推荐
- 优点: 简单直接，每个项目独立，易于版本控制
- 缺点: 需要每个项目都复制 `.cursorrules` 文件
- **适用场景**: 大多数用户，简单易用

**方案 2: 全局配置方式** ✅ 可行
- 优点: 一次安装，全局生效，所有项目自动使用
- 缺点: 需要找到全局配置目录，可能影响其他项目
- **适用场景**: 希望所有项目统一使用规划工作流

**方案 3: VS Code 扩展方式** ❌ 暂不考虑
- 优点: 标准化，易于分发，自动更新
- 缺点: 开发复杂度高，需要发布和维护扩展
- **适用场景**: 未来可能考虑，当前阶段不采用

**方案 4: 混合方案** ⭐⭐⭐ 最佳选择
- 优点: 灵活性高，支持项目级和全局两种方式
- 缺点: 需要维护两套安装脚本
- **实现方式**:
  - 默认：项目模板方式（复制 `.cursorrules` 到项目根目录）
  - 可选：全局配置方式（复制到 Cursor 全局目录）
- **适用场景**: 满足不同用户需求，提供最大灵活性

**最终选择**: **方案 4 - 混合方案**
- 主要推荐项目模板方式（简单直接）
- 提供全局配置选项（高级用户）
- 安装脚本支持两种模式

## 💡 发现和想法

### 2026-01-07 发现

#### 1. Cursor 配置目录结构
- **Windows 配置目录**: `%USERPROFILE%\.cursor\`
- **项目配置目录**: `%USERPROFILE%\.cursor\projects\[项目路径]\rules\`
- 每个项目在 `.cursor` 目录下都有对应的项目目录
- 项目目录下存在 `rules` 目录，可能用于存储项目级规则

#### 2. .cursorrules 文件位置
- 当前项目根目录下**没有** `.cursorrules` 文件
- 需要验证 `.cursorrules` 是否应该放在：
  - 项目根目录
  - 或 `.cursor\projects\[项目]\rules\` 目录
  - 或两者都支持

#### 3. 配置机制推测
- Cursor 基于 VS Code，可能使用类似的配置机制
- 项目级配置可能存储在 `.cursor\projects\` 下
- 全局配置可能存储在 `.cursor` 根目录或用户配置目录

#### 4. .cursorrules 文件创建 (2026-01-07)
- ✅ 已创建 `.cursorrules` 模板文件
- ✅ 实现了规划工作流的自动触发逻辑
- ✅ 包含 3-File Pattern 的完整指令
- ✅ 定义了 Manus 原则的执行规则
- ⏳ 待实际测试验证效果

## 🐛 遇到的问题

_待记录遇到的问题和解决方案_

## 📦 Git 仓库管理

### 2026-01-07 Git 初始化
- ✅ 创建 `.gitignore` 文件
- ✅ 初始化 Git 仓库
- ✅ 创建初始提交
- ✅ 推送到 Gitee 仓库

### Gitee 仓库信息
- **仓库地址**: https://gitee.com/philsz/planning-with-files-cursor
- **仓库名称**: `planning-with-files-cursor`
- **仓库描述**: "将 Manus AI 的规划工作流模式适配到 Cursor IDE"
- **状态**: ✅ 已成功推送

## 📝 待验证假设

1. Cursor 基于 VS Code，可能使用类似的配置机制
2. `.cursorrules` 可能支持全局和项目级配置
3. 可以通过安装脚本自动配置

---

**最后更新**: 2026-01-07 22:30

