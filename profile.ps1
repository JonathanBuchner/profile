# This file should be stored in C:\Users\maket\OneDrive\Documents\WindowsPowerShell

#SetUp
#Add folder to visual studios to path

#Environmental Variables
# JB_USER_PATH C:\Users\maket
# JB_DEVELOPER_PATH C:\Developer
# JB_ICLOUD_PATH: 
# JB_LEAP_PATH
# JB_EBOOK_PATH Path To Essentials for Developers
#Test / Removed

#Set execution policy - https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.3

Set-Alias -Name dev -Value Set-Dev-Location
Function Set-Dev-Location {
    Set-Location "$env:JB_DEVELOPER_PATH";
}

Set-Alias -Name icloud -Value Set-ICloud-Location
Function Set-ICloud-Location {
    Set-Location "$env:JB_ICLOUD_PATH";
}

Set-Alias -Name leap -Value Set-Leap-Location
Function Set-Leap-Location {
    Set-Location "$env:JB_LEAP_PATH";
}

Set-Alias -Name e20 -Value Set-E20-Location
Function Set-E20-Location {
    Set-Location "$env:JB_E20_PATH";
}

Set-Alias -Name ebook -Value Set-EBOOK-Location
Function Set-EBOOK-Location {
    Set-Location "$env:JB_EBOOK_PATH";
}

# Set-Alias -Name profile -Value Invoke-Profile
# Function Invoke-Profile {
#     Invoke-Expression "& `"$env:JB_USER_PATH\AppData\Local\Programs\Microsoft VS Code\bin\code.cmd`" $env:JB_USER_PATH\OneDrive\Documents\WindowsPowerShell\profile.ps1";
#     Set-Location "$env:JB_USER_PATH\OneDrive\Documents\WindowsPowerShell";
# }

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

Set-Alias -Name media -Value Invoke-Media
Function Invoke-Media
{
    [system.Diagnostics.Process]::Start("chrome","https://mail.google.com/mail/u/0/?tab=rm#inbox");
    [system.Diagnostics.Process]::Start("chrome","https://www.linkedin.com/feed/");
    [system.Diagnostics.Process]::Start("chrome","https://mail.proton.me/u/0/inbox");
}

Set-Alias -Name typing -Value Invoke-Typing
Function Invoke-Typing
{
    [system.Diagnostics.Process]::Start("chrome","https://10fastfingers.com/typing-test/english");
    [system.Diagnostics.Process]::Start("chrome","https://www.ratatype.com/");
    [system.Diagnostics.Process]::Start("chrome","https://www.keybr.com/");
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

Set-Alias -Name github -Value Invoke-GitHub

Function Invoke-GitHub
{
    [system.Diagnostics.Process]::Start("chrome","https://github.com/JonathanBuchner?tab=repositories");
}

Set-Alias -Name ce20 -Value Invoke-E20

Function Invoke-E20
{
    [system.Diagnostics.Process]::Start("chrome","https://canvas.harvard.edu/courses/112512");
    [system.Diagnostics.Process]::Start("chrome","https://edstem.org/us/courses/32814/discussion/");
}

Set-Alias -Name life -Value Invoke-Life

Function Invoke-Life
{
    Invoke-Media
    Invoke-Typing
    Invoke-Leet
    Invoke-E20
}

Set-Alias -Name netapp -Value Make-ConsoleTestApp
Function Make-ConsoleTestApp ($sln_name, $project_name, $project_test_name)
{
    dotnet new sln -n $sln_name
    dotnet new console -o $project_name
    dotnet new mstest -o $project_test_name
    dotnet sln "$sln_name.sln" add "$project_name\$project_name.csproj"
    dotnet sln "$sln_name.sln" add "$project_test_name\$project_test_name.csproj"
    dotnet add "$project_test_name\$project_test_name.csproj" reference "$project_name\$project_name.csproj"
    dotnet new gitignore
}


# Execute on startup
Set-Alias -Name op -Value Open-PowerShell
function Open-PowerShell
{
    #Set-Location C:\Developer
    Test-Administrator
    Get-ExecutionPolicy -List
}

Open-PowerShell