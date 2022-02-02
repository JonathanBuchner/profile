# This file should be stored in C:\Users\maket\OneDrive\Documents\WindowsPowerShell

#SetUp
#Add folder to visual studios to path

#Environmental Variables
# JB_USER_PATH C:\Users\maket
# JB_DEVELOPER_PATH C:\Developer

Function Set-Location-Profile {
    Set-Location "$env:JB_DEVELOPER_PATH";
}

Write-Host "$env:JB_USER_PATH\Documents\WindowsPowerShell\profile.ps1"

Set-Alias -Name profile -Value Invoke-Profile
Function Invoke-Profile {
    Invoke-Expression "& `"$env:JB_USER_PATH\AppData\Local\Programs\Microsoft VS Code\bin\code.cmd`" $env:JB_USER_PATH\OneDrive\Documents\WindowsPowerShell\profile.ps1";
    Set-Location "$env:JB_USER_PATH\OneDrive\Documents\WindowsPowerShell";
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

Set-Alias -Name ic1 -Value Invoke-ic1
Function Invoke-ic1
{
    [system.Diagnostics.Process]::Start("chrome","https://music.youtube.com/playlist?list=PLHL8izsb61I0iF59pGUOjtwAYcLkpuVDa");
    [system.Diagnostics.Process]::Start("chrome","https://github.com/Leap-Internal-Program");
    [system.Diagnostics.Process]::Start("chrome","https://github.com/JonathanBuchner?tab=repositories");
    [system.Diagnostics.Process]::Start("chrome","https://www.linkedin.com/learning/me");
    Set-Location C:\Developer\Organization-leap-internal
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

# Temp
Function makedoc {
    
    param (
        $from 
    )

    pandoc -f markdown -t docx --data-dir=C:\Users\maket\AppData\Roaming\Microsoft\Templates $from -o mydoc1.docx
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