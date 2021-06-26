# This file should be stored in C:\Users\maket\OneDrive\Documents\WindowsPowerShell

Set-Location C:\Developer

Set-Alias -Name dev -Value DevShortcut
Set-Alias -Name repo -Value RepoShortcut
Set-Alias -Name profile -Value ProfileShortcut
Set-Alias -Name vis -Value devenv

#Temp

Function amongus {
    Invoke-Item "$env:amongus\Among Us.exe"
} 

# Keep

Function DevShortcut {
    Set-Location "C:\Developer";
}

Function RepoShortcut {
    Set-Location "C:\Users\maket\Source\Repos";
}

Function ProfileShortcut {
    Invoke-Expression "& `"C:\Users\maket\AppData\Local\Programs\Microsoft VS Code\bin\code.cmd`" C:\Users\maket\OneDrive\Documents\WindowsPowerShell";
    Set-Location "C:\Users\maket\OneDrive\Documents\WindowsPowerShell";
}

Function Test-Administrator  
{  
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    $administrator = (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator);
    
    if($administrator)
    {
        Write-Host  "You are in " -NoNewline;
        Write-Host "Administrator Mode!" -ForegroundColor Green -BackgroundColor Black;
    }
    else 
    {
        Write-Host "You ARE NOT in Administrator Mode!" -ForegroundColor Yellow -BackgroundColor Black;
    }
}

Test-Administrator
Get-ExecutionPolicy -List

# Program Shortcuts

Function leet
{
    [system.Diagnostics.Process]::Start("chrome","https://music.youtube.com/playlist?list=PLHL8izsb61I1FVKr1SPmGbttVsq1_f3Lc");
    [system.Diagnostics.Process]::Start("chrome","https://leetcode.com/explore/interview/card/microsoft/");
    [system.Diagnostics.Process]::Start("chrome","https://github.com/JonathanBuchner?tab=repositories");
    Start-Process devenv;
    Set-Location C:\Developer\leet
}
