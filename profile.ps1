# This file should be stored in C:\Users\maket\OneDrive\Documents\WindowsPowerShell

#SetUp
#Add folder to visual studios to path

#Environmental Variables
# JB_USER_PATH C:\Users\maket
# JB_DEVELOPER_PATH C:\Developer

Set-Alias -Name dev -Value Set-Location-Profile
Function dev {
    Set-Location $env:JB_DEVELOPER_PATH;
}

Set-Alias -Name profile -Value Invoke-Profile
Function Invoke-Profile {
    Invoke-Expression "& `"$env:JB_USER_PATH\AppData\Local\Programs\Microsoft VS Code\bin\code.cmd`" $env:OneDriveConsumer\Documents\WindowsPowerShell";
    Set-Location "$env:OneDriveConsumer\Documents\WindowsPowerShell";
}

Function Test-Administrator  
{  
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    $administrator = (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator);
    
    if($administrator)
    {
        Write-Host "You are in " -NoNewline;
        Write-Host "Administrator Mode!" -ForegroundColor Green -BackgroundColor Black;
    }
    else 
    {
        Write-Host "You ARE NOT in Administrator Mode!" -ForegroundColor Yellow -BackgroundColor Black;
    }
}

Set-Alias -Name leet -Value Invoke-Leet
Function Invoke-Leet
{
    [system.Diagnostics.Process]::Start("chrome","https://music.youtube.com/playlist?list=PLHL8izsb61I1FVKr1SPmGbttVsq1_f3Lc");
    [system.Diagnostics.Process]::Start("chrome","https://leetcode.com/explore/interview/card/microsoft/");
    [system.Diagnostics.Process]::Start("chrome","https://github.com/JonathanBuchner?tab=repositories");
    Start-Process devenv.exe -Verb runAs
    Set-Location C:\Developer\leet
}

Set-Alias -Name op -Value Open-PowerShell
function Open-PowerShell
{
    Set-Location C:\Developer
    Test-Administrator
    Get-ExecutionPolicy -List
}
Open-PowerShell