$wsb_template = @"
<Configuration>
    <MappedFolders>
        <!-- 桌面 -->
        <MappedFolder>
            <HostFolder>|NOW_DIR|\Desktop</HostFolder>
            <SandboxFolder>C:\Users\WDAGUtilityAccount\Desktop</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <!-- App -->
        <MappedFolder>
            <HostFolder>|NOW_DIR|\App\WeChat</HostFolder>
            <SandboxFolder>C:\Program Files\Tencent\WeChat</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>|NOW_DIR|\App\QQ</HostFolder>
            <SandboxFolder>C:\Program Files (x86)\Tencent\QQ</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>|NOW_DIR|\App\TIM</HostFolder>
            <SandboxFolder>C:\Program Files (x86)\Tencent\TIM</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>|NOW_DIR|\App\QQNT</HostFolder>
            <SandboxFolder>C:\Program Files\Tencent\QQNT</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>|NOW_DIR|\App\WXWork</HostFolder>
            <SandboxFolder>C:\Program Files (x86)\WXWork</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <!-- Roaming -->
        <MappedFolder>
            <HostFolder>|NOW_DIR|\Data\Roaming\WeChat</HostFolder>
            <SandboxFolder>C:\Users\WDAGUtilityAccount\AppData\Roaming\Tencent\WeChat</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>|NOW_DIR|\Data\Roaming\Tencent</HostFolder>
            <SandboxFolder>C:\Users\WDAGUtilityAccount\AppData\Roaming\Tencent\Tencent</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>|NOW_DIR|\Data\Roaming\TencentDocs</HostFolder>
            <SandboxFolder>C:\Users\WDAGUtilityAccount\AppData\Roaming\TDAppDesktop</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>|NOW_DIR|\Data\Roaming\WeMeet</HostFolder>
            <SandboxFolder>C:\Users\WDAGUtilityAccount\AppData\Roaming\Tencent\WeMeet</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <!-- Documents -->
        <MappedFolder>
            <HostFolder>|NOW_DIR|\Data\Documents\WeChat</HostFolder>
            <SandboxFolder>C:\Users\WDAGUtilityAccount\Documents\WeChat Files</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>|NOW_DIR|\Data\Documents\Tencent</HostFolder>
            <SandboxFolder>C:\Users\WDAGUtilityAccount\Documents\Tencent Files</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>|NOW_DIR|\Data\Documents\WXWork</HostFolder>
            <SandboxFolder>C:\Users\WDAGUtilityAccount\Documents\WXWork</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>|NOW_DIR|\App\Meeting</HostFolder>
            <SandboxFolder>C:\Program Files (x86)\Tencent\WeMeet</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>|NOW_DIR|\App\TencentDocs</HostFolder>
            <SandboxFolder>C:\Program Files\TencentDocs</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <!-- Common Files -->
        <MappedFolder>
            <HostFolder>|NOW_DIR|\Data\Common Files</HostFolder>
            <SandboxFolder>C:\Program Files (x86)\Common Files</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <!-- ProgramData -->
        <MappedFolder>
            <HostFolder>|NOW_DIR|\Data\ProgramData\Tencent</HostFolder>
            <SandboxFolder>C:\ProgramData\Tencent</SandboxFolder>
            <ReadOnly>false</ReadOnly>
        </MappedFolder>
        <!-- 脚本 -->
        <MappedFolder>
            <HostFolder>|NOW_DIR|\Scripts</HostFolder>
            <SandboxFolder>C:\Scripts</SandboxFolder>
            <ReadOnly>true</ReadOnly>
        </MappedFolder>
        <!-- SysWOW64 -->
        <MappedFolder>
            <HostFolder>|NOW_DIR|\Data\SysWOW64</HostFolder>
            <SandboxFolder>C:\Windows\SysWOW64</SandboxFolder>
            <ReadOnly>true</ReadOnly>
        </MappedFolder>
    </MappedFolders>
    <!-- 音频 -->
    <AudioInput>Enable</AudioInput>
    <!-- 视频 -->
    <VideoInput>Disable</VideoInput>
    <!-- 内存限制 -->
    <MemoryInMB>2048</MemoryInMB>
    <!-- 开机运行脚本 -->
    <LogonCommand>
        <Command>C:\Scripts\sandbox-setup.cmd</Command>
    </LogonCommand>
    <!-- vGpu -->
    <vGPU>Enable</vGPU>
</Configuration>
"@

$relative_dir_identifer = "|NOW_DIR|"
$relative_dir = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
Write-Host ("gathered relative dir: " + $relative_dir)


$wsb_content = $wsb_template -replace [regex]::Escape($relative_dir_identifer), $relative_dir

if (Test-Path "Tencent.wsb") {
    Copy-Item "Tencent.wsb" "Tencent.wsb.bak" -Force
    Write-Host "backup old wsb as Tencent.wsb.bak"
}


$wsb_content | Out-File -FilePath "Tencent.wsb" -Encoding UTF8
Write-Host "done"
