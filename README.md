# tencent-sandbox

tencent-sandbox 是使用 [Windows sandbox](https://learn.microsoft.com/zh-cn/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-overview) 为腾讯全家桶创建沙盒的配置

## 注意事项

**Windows 10 不支持相对路径**，如果使用该版本系统，请把 **Tencent.wsb** 中的路径替换成**绝对路径**

## 兼容性

目前测试 **微信** **QQ** **QQNT** **TIM** **企业微信** **腾讯会议** **腾讯文档** 正常使用

如有其他需要，请提 Issue

注: **企业微信无法自动登录(检查设备ID)，只能每次重新登录**

默认分配**2gb**内存，有需要可以自行修改 `<MemoryInMB>value</MemoryInMB>` (以 MB 为单位)

**音频输入、剪贴板重定向**默认开启

**视频输入默认关闭**，有需要可以自行修改 `<VideoInput>value</VideoInput>`

## 使用教程

启用 `Windows 沙盒`

git clone 本项目，**或者点击`Releases`下载**

``` bash
git clone https://github.com/empty-233/tencent-sandbox.git
```

然后按照以下结构**创建空文件夹**

也可以使用`mkdir.bat`来**一键创建以下结构目录**

``` text
├─App
│  ├─Meeting
│  ├─QQ
│  ├─QQNT
│  ├─TencentDocs
│  ├─TIM
│  ├─WeChat
│  └─WXWork
├─Data
│  ├─Common Files
│  ├─Documents
│  │  ├─Tencent
│  │  ├─WeChat
│  │  └─WXWork
│  ├─ProgramData
│  │  └─Tencent
│  ├─Roaming
│  │  ├─Tencent
│  │  ├─TencentDocs
│  │  ├─WeChat
│  │  └─WeMeet
│  └─SysWOW64
├─Desktop
└─Scripts
```

新开一个**默认沙盒**，并正常安装 **QQ**
安装完成之后复制 `C:\Windows\SysWOW64` 到 `Data\SysWOW64` (不然qq运行一段时间后会崩溃)

打开 **Tencent.wsb**

安装**经过测试**的软件 (可选)

移动桌面快捷方式到任何位置，再移动回桌面(否则快捷方式会消失)

操作完成后就可以正常使用了，**关闭沙盒账号和数据都有所保留**

## 挂载路径

``` text
请查看 Tencent.wsb 中的 MappedFolder 配置项
```
