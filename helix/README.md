# Helix Theme Auto-Switch

自动根据 macOS 系统主题切换 Helix 编辑器主题。

## 当前方案

使用 `dark-notify` + `LaunchAgent` 监听 macOS 主题变化。

### 工作原理

1. `dark-notify` 监听 macOS 系统主题变化
2. 主题切换时执行 `toggle-theme.sh` 脚本
3. 脚本修改 `config.toml` 中的 `theme` 配置
4. 发送 `SIGUSR1` 信号通知 helix 重载配置

### 文件说明

| 文件 | 说明 |
|------|------|
| `config.toml` | Helix 主配置 |
| `toggle-theme.sh` | 主题切换脚本 |
| `themes/` | 主题目录 |

### LaunchAgent

路径: `~/Library/LaunchAgents/com.user.dark-notify.plist`

### 管理命令

```bash
# 启动
launchctl load ~/Library/LaunchAgents/com.user.dark-notify.plist

# 停止
launchctl unload ~/Library/LaunchAgents/com.user.dark-notify.plist

# 查看状态
launchctl list | grep dark-notify
```

## 原生支持（未来）

Helix 已支持通过终端 mode 2031 自动检测系统主题。

### 相关 PR

- **PR #14356**: https://github.com/helix-editor/helix/pull/14356
  - 合并时间: 2025-09-21
  - 合并到 master 分支

### 配置方式

```toml
[theme]
dark = "your-dark-theme"
light = "your-light-theme"
```

### 终端支持

| 终端 | 支持状态 |
|------|----------|
| Ghostty (v1.3+) | ✅ 支持 |
| Kitty (v0.38.1+) | ✅ 支持 |
| WezTerm | ❌ 不支持 |

### 使用条件

1. 升级 helix 到包含 mode 2031 支持的版本
2. 使用支持 mode 2031 的终端（推荐 Ghostty）
3. 更新 `config.toml` 使用 `[theme]` 语法

## 参考资料

- https://github.com/cormacrelf/dark-notify
- https://github.com/helix-editor/helix/pull/14356
- https://christophvoigt.com/notes/toggle-helix-darkmode/
