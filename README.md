# tencent-sandbox

tencent-sandbox 是使用 [Windows sandbox](https://learn.microsoft.com/zh-cn/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-overview) 为腾讯全家桶创建沙盒的配置

## 更多配置

请不要在issue里面询问**除腾讯全家桶之外的配置**

**[更多配置](https://blog.kongwu.top/p/sandbox-configuration)**，欢迎在blog下面的评论提供更多配置

## 注意事项

**家庭版**不支持沙盒

请根据 [可选项](#可选项) **更改配置**

### **Windows 10 用户**

1. 进入你 clone/下载 的**项目目录**
2. 按键盘上的Win + R
3. 输入 powershell, 按回车
4. 输入 `PowerShell -ExecutionPolicy Bypass -File ".\win10_init.ps1"`。  

不明白如何操作:

1. 用文本方式打开Tencent.wsb
2. 将**所有**例如`<HostFolder>.\tencent-sandbox\xxxxxxx</HostFolder>` 中的 `.\` 手动修改为你 clone/下载 的**项目目录**。

## 兼容性

目前测试 **微信** **QQ** **QQNT** **TIM** **企业微信** **腾讯会议** **腾讯文档** 正常使用

如有其他需要，请提 Issue

注: **企业微信无法自动登录(检查设备ID)，只能每次重新登录**

## 沙盒配置

默认分配**2GB**内存，有需要可以自行修改 `<MemoryInMB>value</MemoryInMB>` (以 MB 为单位)

**音频输入**默认**开启**，有需要可以自行修改 `<AudioInput>value</AudioInput>` (Enable/Disable/Default)

**剪贴板重定向**默认**开启**，有需要可以自行修改 `<ClipboardRedirection>value</ClipboardRedirection>` (Enable/Disable/Default)

**视频输入**默认**关闭**，有需要可以自行修改 `<VideoInput>value</VideoInput>` (Enable/Disable/Default)

其他配置参考[Windows沙盒配置](https://learn.microsoft.com/zh-cn/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-configure-using-wsb-file)官方文档

## 使用教程

启用 `Windows 沙盒`

git clone 本项目，**或者点击`Releases`下载**

``` bash
git clone https://github.com/empty-233/tencent-sandbox.git
```

使用`mkdir.bat`来**一键创建以下结构目录**

**按照下面可选项配置`SysWOW64`**

打开**Tencent.wsb**

安装**经过测试**的软件 (可选)

移动桌面快捷方式到任何位置，再移动回桌面(否则快捷方式会消失)

操作完成后就可以正常使用了，**关闭沙盒账号和数据都有所保留**

### 可选项

下列方式二选一，**默认不挂载系统SysWOW64**

#### 复制(默认)

新开一个**默认沙盒**，并正常安装 **QQ**

安装完成之后复制 `C:\Windows\SysWOW64` 到 `Data\SysWOW64` (不然qq运行一段时间后会崩溃)

#### 挂载

修改 `<HostFolder>.\Data\SysWOW64</HostFolder>` 为 `<HostFolder>C:\Windows\SysWOW64</HostFolder>`

## 挂载路径

请查看 Tencent.wsb 中的 `MappedFolder` 配置项

qq保存的路径: Data\Documents\Tencent\ (qqid) \FileRecv

微信保存的路径: Data\Documents\WeChat\ (wxid) \FileStorage\File

其余的请查看`Data\Documents`
