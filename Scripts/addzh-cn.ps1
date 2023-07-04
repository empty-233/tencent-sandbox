$LanguageList = Get-WinUserLanguageList

$LanguageList.Add("zh-Hans-CN")

Set-WinUserLanguageList $LanguageList -Force