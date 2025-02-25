# tencent-sandbox

tencent-sandbox 是使用 [Windows sandbox](https://learn.microsoft.com/zh-cn/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-overview) 为腾讯全家桶创建沙盒的配置

## 特性

* **一键配置**: 使用 `mkdir.bat` 快速创建所需目录结构。
* **灵活配置**: 支持自定义沙盒设置，如内存、音频输入等。
* **数据持久化**: 关闭沙盒后，账号和数据依然保留。

## 兼容性

已在以下平台测试并确认正常使用：

| 平台 | 说明 |
|---|---|
| 微信 | ✅ |
| QQ | ✅ |
| QQNT | ⚠️ 无法自动登录，无法记住密码 |
| TIM | ✅ |
| 企业微信 | ⚠️ 无法自动登录（检查设备ID），需每次重新登录 |
| 腾讯会议 | ✅ |
| 腾讯文档 | ✅ |

**遇到其他兼容性问题？** 欢迎提交 Issue 反馈！

## 更多配置

请不要在issue里面询问**除腾讯全家桶之外的配置**

* 更多配置示例可参考: [https://blog.kongwu.top/p/sandbox-configuration](https://blog.kongwu.top/p/sandbox-configuration)
* 欢迎在博客评论区分享你的配置方案！

## 注意事项

**家庭版**不支持沙盒

默认挂载系统 `SysWOW64` ，出现问题请使用[复制选项](#复制)

### **Windows 10 用户**

1. 进入你 clone/下载 的**项目目录**
2. 按键盘上的Win + R
3. 输入 powershell, 按回车
4. 输入 `PowerShell -ExecutionPolicy Bypass -File ".\win10_init.ps1"`。  

不明白如何操作:

1. 用文本方式打开Tencent.wsb
2. 将**所有**例如`<HostFolder>.\tencent-sandbox\xxxxxxx</HostFolder>` 中的 `.\` 手动修改为你 clone/下载 的**项目目录**。

## 沙盒配置

| 设置 | 默认值 | 可选值 | 修改方式 |
|---|---|---|---|
| 内存 | 2GB | 以 MB 为单位的数值 | `<MemoryInMB>value</MemoryInMB>` |
| 音频输入 | 开启 | Enable/Disable/Default | `<AudioInput>value</AudioInput>` |
| 剪贴板重定向 | 开启 | Enable/Disable/Default | `<ClipboardRedirection>value</ClipboardRedirection>` |
| 视频输入 | 关闭 | Enable/Disable/Default | `<VideoInput>value</VideoInput>` |

其他配置参考[Windows沙盒配置](https://learn.microsoft.com/zh-cn/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-configure-using-wsb-file)官方文档

## 使用教程

1. **启用 Windows 沙盒**: 确保你的系统已启用 Windows 沙盒功能。
2. **获取项目**:
    * 克隆本项目: `git clone https://github.com/empty-233/tencent-sandbox.git`
    * 或前往 [Releases](https://github.com/empty-233/tencent-sandbox/releases) 页面下载最新版本。

3. **创建目录**: 运行 `mkdir.bat` 一键创建所需目录。

4. **安装软件**: 打开 **Tencent.wsb** ，在沙盒中安装所需的腾讯软件。

5. **固定快捷方式**: 将桌面快捷方式移动到任意位置，再移动回桌面，以防止快捷方式消失。

操作完成后就可以正常使用了，**关闭沙盒账号和数据都有所保留**

### SysWOW64 配置

默认**挂载系统SysWOW64**

#### 挂载(默认)

修改 `<HostFolder>C:\Windows\SysWOW64</HostFolder>`

#### 复制

新开一个**默认沙盒**，并正常安装所需软件

安装完成之后复制**沙盒内** `C:\Windows\SysWOW64` 到 `Data\SysWOW64`

修改 `<HostFolder>C:\Windows\SysWOW64</HostFolder>` 为 `<HostFolder>.\Data\SysWOW64</HostFolder>`

## 挂载路径

请查看 Tencent.wsb 中的 `MappedFolder` 配置项

* qq保存的路径: `Data\Documents\Tencent\ (qqid) \FileRecv`

* 微信保存的路径: `Data\Documents\WeChat\ (wxid) \FileStorage\File`

* 微信测试版保存的路径: `Data\Documents\xwechat_files\ (wxid) \msg\file`

* 其余的请查看 `Data\Documents`
