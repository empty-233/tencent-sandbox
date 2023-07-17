# tencent-sandbox

tencent-sandbox 是使用 [Windows sandbox](https://learn.microsoft.com/zh-cn/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-overview) 为腾讯全家桶创建沙盒的配置

## 兼容性

目前测试 **微信** **QQ** **QQNT** **TIM** **企业微信** 正常使用，其他未测试

注: **企业微信无法自动登录(检查设备)，只能每次重新登录**

默认分配**2gb**内存，有需要可以自行修改 `<MemoryInMB>2048</MemoryInMB>`

## 使用教程

启用 `Windows 沙盒`

git clone 本项目

``` bash
git clone https://github.com/empty-233/tencent-sandbox.git
```

按照以下结构**创建空文件夹**

也可以使用`mkdir.bat`来一键创建以下结构目录

``` text
├───App
│   ├───QQ
│   ├───QQNT
│   ├───TIM
│   └───WeChat
├───Data
│   ├───Common Files
│   ├───Documents
│   │   ├───Tencent
│   │   └───WeChat
│   ├───Roaming
│   │   ├───Tencent
│   │   └───WeChat
│   └───SysWOW64
├───Desktop
└───Scripts
```

新开一个**默认沙盒**，并正常安装 **QQ/QQNT/TIM**
安装完成之后复制 `C:\Windows\SysWOW64` 到 `Data\SysWOW64` (不然qq运行一段时间后会崩溃)

打开 **Tencent.wsb**
安装 **微信** **QQ** **QQNT** **TIM** (可选)
移动桌面快捷方式到任何位置，再移动回桌面(否则快捷方式会消失)

操作完成后就可以正常使用了，关闭沙盒账号和数据都有所保留

## 挂载路径

``` text
桌面 -> Desktop
C:\Program Files (x86)\Common Files -> Data\Common Files
C:\Users\WDAGUtilityAccount\Documents\Tencent Files -> Data\Documents\Tencent
C:\Users\WDAGUtilityAccount\Documents\WeChat Files -> Data\Documents\WeChat
C:\Users\WDAGUtilityAccount\Documents\WXWork -> Data\Documents\WXWork

其余的请查看 Tencent.wsb 中的 MappedFolder
```
