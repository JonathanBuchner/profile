# This file should be stored in C:\Users\maket\OneDrive\Documents\WindowsPowerShell

#SetUp
#Add folder to visual studios to path

#Environmental Variables
# JB_USER_PATH C:\Users\maket
# JB_DEVELOPER_PATH C:\Developer
# JB_LEAP_PATH
# JB_EBOOK_PATH Path To Essentials for Developers
#Test / Removed

#Set execution policy - https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.3

Set-Alias -Name smt-serve -Value Start-SmtCallback
Function Start-SmtCallback {
    $SmtScriptPath = Join-Path $env:JB_DEVELOPER_PATH "\smt\scripts\withings-callback.ps1";
    & $SmtScriptPath;
}

Set-Alias -Name dev -Value Set-Dev-Location
Function Set-Dev-Location {
    Set-Location "$env:JB_DEVELOPER_PATH";
}

Set-Alias -Name mem -Value Set-mem-Location
Function Set-mem-Location {
    Set-Location "C:\Developer\learn\memorize\Book";
}

Set-Alias -Name ebook -Value Set-EBOOK-Location
Function Set-EBOOK-Location {
    Set-Location "$env:JB_EBOOK_PATH";
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

# Execute on startup
Set-Alias -Name op -Value Open-PowerShell
function Open-PowerShell
{
    #Set-Location C:\Developer
    Test-Administrator
    Get-ExecutionPolicy -List
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
    [system.Diagnostics.Process]::Start("chrome","https://www.ratatype.com/u5893182/education-results/");
    [system.Diagnostics.Process]::Start("chrome","https://www.keybr.com/");
}

Set-Alias -Name leet -Value Invoke-Leet
Function Invoke-Leet
{
    [system.Diagnostics.Process]::Start("chrome","https://music.youtube.com/playlist?list=PLHL8izsb61I1FVKr1SPmGbttVsq1_f3Lc");
    [system.Diagnostics.Process]::Start("chrome","https://leetcode.com/problemset/all/");
    [system.Diagnostics.Process]::Start("chrome","https://github.com/JonathanBuchner?tab=repositories");
    # Start-Process devenv.exe -Verb runAs
    Set-Location C:\Developer\leet
}

Set-Alias -Name life -Value Invoke-Life
Function Invoke-Life
{
    Invoke-Media
    Invoke-Typing
    Invoke-Leet
}

# Open file and folders to update this script profile.ps1.
Set-Alias -Name profile -Value Update-Profile
function Update-Profile
{
    $profilePath = Join-Path $env:JB_DEVELOPER_PATH "profile\profile.ps1"

    if (-not (Test-Path -LiteralPath $profilePath))
    {
        throw "Profile not found: $profilePath"
    }

    if (-not (Get-Command code -ErrorAction SilentlyContinue))
    {
        throw "The Visual Studio Code 'code' command was not found."
    }

    code --reuse-window $profilePath
}


Set-Alias -Name profile-copy -Value Copy-profile
Function Copy-Profile {
    $destination = "$($env:JB_USER_PATH)\Documents\WindowsPowerShell\profile.ps1"
    $source = "$($env:JB_DEVELOPER_PATH)\profile\profile.ps1"

    Copy-Item -Path $source -Destination $destination -Force
}

# Open AppData folder
Set-Alias -Name appdata -Value Open-AppData
Function Open-AppData
{
    Invoke-Item "$($env:JB_USER_PATH)\AppData"
}

Set-Alias -Name guid -Value Invoke-Create-Guid
Function Invoke-Create-Guid
{
    [guid]::NewGuid()
}

# Create random password
Set-Alias -Name create-password -Value New-RandomPassword
function New-RandomPassword
{
    $bytes = [byte[]]::new(32)
    $generator = [Security.Cryptography.RandomNumberGenerator]::Create()

    try
    {
        $generator.GetBytes($bytes)
        [Convert]::ToBase64String($bytes) | Set-Clipboard

        Write-Host "Random Base64 value copied to clipboard."
    }
    finally
    {
        $generator.Dispose()
    }
}



Set-Alias -Name hotkeys -Value Invoke-Hotkeys

Function Invoke-Hotkeys($cmd)
{
    if ($cmd -eq 'csharp' -or $cmd -eq 'c#')
    {
        Write-Output "Loading csharp hotkeys."
        Invoke-Item "$($env:JB_DEVELOPER_PATH)\profile\scripts\hotkeys\csharp.ahk"
    }
    Write-Output "Let's fucking go."
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

## Start at open
Open-PowerShell