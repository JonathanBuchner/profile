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


Set-Alias -Name e20 -Value Set-E20-Location
Function Set-E20-Location {
    Set-Location "$env:JB_E20_PATH";
}

Set-Alias -Name e22 -Value Set-E22-Location
Function Set-E22-Location {
    Set-Location "C:\Developer\learn\harvard\CSCI E-22 Data Structures\problems";
}

Set-Alias -Name mem -Value Set-mem-Location
Function Set-mem-Location {
    Set-Location "C:\Developer\learn\memorize\Book";
}

Set-Alias -Name ebook -Value Set-EBOOK-Location
Function Set-EBOOK-Location {
    Set-Location "$env:JB_EBOOK_PATH";
}

Set-Alias -Name as -Value Set-AdvancedSearch-Location
Function Set-AdvancedSearch-Location {
    Set-Location "C:\Source\Faraday\src\clients\SharedUI\AdvancedTextSearch"
}

Set-Alias -Name shared -Value Set-Shared-Location
Function Set-Shared-Location {
    Set-Location "C:\Source\Faraday\src\clients\SharedDll"
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

Set-Alias -Name github -Value Invoke-GitHub
Function Invoke-GitHub
{
    [system.Diagnostics.Process]::Start("chrome","https://github.com/JonathanBuchner?tab=repositories");
}

# Open file and folders to update this script profile.ps1.
Set-Alias -Name profile -Value Update-profile
Function Update-profile
{
    Invoke-Item "$($env:JB_USER_PATH)\Documents\WindowsPowerShell"
    Invoke-Item "$($env:JB_DEVELOPER_PATH)\profile\"
    code "$($env:JB_DEVELOPER_PATH)\profile\profile.ps1"
}

# Open AppData folder
Set-Alias -Name appdata -Value Open-AppData
Function Open-AppData
{
    Invoke-Item "$($env:JB_USER_PATH)\AppData"
}


Set-Alias -Name ce20 -Value Invoke-E20
Function Invoke-E20
{
    [system.Diagnostics.Process]::Start("chrome","https://canvas.harvard.edu/courses/112512");
    [system.Diagnostics.Process]::Start("chrome","https://edstem.org/us/courses/32814/discussion/");
}

Set-Alias -Name e10a -Value Invoke-E10a
Function Invoke-E10a
{
    Set-Location "C:\Developer\learn\harvard\CSCI E-10A\Building Java Programs\src";
}

Set-Alias -Name e10b -Value Invoke-E10b

Function Invoke-E10b
{
    Set-Location "C:\Developer\learn\harvard\CSCI E-10B Java II\src";
}

Set-Alias -Name e22 -Value Invoke-E22

Function Invoke-E22
{
    Set-Location "C:\Developer\learn\harvard\CSCI E-22 Data Structures";
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


### Envision
Set-Alias -Name src -Value Set-src-Location
Function Set-src-Location {
    Set-Location "C:\Source\Faraday";
}

Set-Alias -Name c2c -Value Set-c2c-Location
Function Set-c2c-Location {
    Set-Location "C:\Source\Faraday\src\clients\c2c";
}

Set-Alias -Name env -Value Set-env-Location
Function Set-env-Location {
    Set-Location "C:\Program Files (x86)\Envision Telephony";
}

Set-Alias -Name sprocs -Value Set-Location-Sprocs
Function Set-Location-Sprocs {
    Set-Location "C:\Source\Faraday\src\server\db\central\sprocs";
}

Set-Alias -Name dbupdates -Value Set-Location-DbUpdates
Function Set-Location-DbUpdates {
    Set-Location "C:\Source\Faraday\config\server\DatabaseUpdates\Common\12.0";
}

Set-Alias -Name logs -Value Open-logs
Function Open-logs {
    & "C:\Program Files (x86)\Envision Telephony\Baretailpro\baretailpro.exe"  "C:\Users\JonathanBuchner\AppData\Roaming\Envision Telephony\D4\logs\D4.log"
    & "C:\Program Files (x86)\Envision Telephony\Baretailpro\baretailpro.exe"  "C:\Program Files (x86)\Envision Telephony\Envision API\EnvsionAPI.log"
    & "C:\Program Files (x86)\Envision Telephony\Baretailpro\baretailpro.exe"  "C:\Program Files (x86)\Envision Telephony\Envision Click2Coach\C2cAPI.log"
    & "C:\Program Files (x86)\Envision Telephony\Baretailpro\baretailpro.exe"  "C:\Program Files (x86)\Envision Telephony\Envision Click2Coach\UploadSvc\UploadService.log"
}

Set-Alias -Name rdp -Value Open-Rdp
Function Open-Rdp
{
    mstsc /v:Desktop-2CDMOIL /f
}

Set-Alias -Name d5 -Value Invoke-D5
Function  Invoke-D5 ($cmd, $time, $media_type, $recording_type)
{

    if ($null -eq $cmd)
    {
        $cmd  = 'folder'
    }

    if ($null -eq $media_type)
    {
        $media_type = 'audio,video'
    }

    if ($null -eq $recording_type)
    {
        $recording_type = 'FTR'
    }

    #Open log
    if ($cmd -eq 'log')
    {
        & "C:\Program Files (x86)\Envision Telephony\Baretailpro\baretailpro.exe"  "C:\Users\JonathanBuchner\AppData\Roaming\Envision Telephony\D4\logs\D4.log"
        & "C:\Program Files (x86)\Envision Telephony\Baretailpro\baretailpro.exe"  "C:\Program Files (x86)\Envision Telephony\Envision API\EnvsionAPI.log"
    }

    #Stop recording
    elseif ($cmd -eq 'end' -or $cmd -eq 'stop')
    {
        Write-Output "Attempting to STOP D5 $recording_type Recording..."
    
        $postParams = @{recording_type = $recording_type}
        Invoke-WebRequest -Uri http://localhost:36847/api/capture/end -Method POST -Body $postParams
    }

    #Start recording
    elseif (($cmd -eq 'rec') -or ($cmd -eq 'record') -or $cmd -eq 'start')
    {
        d5 'who'
        Write-Output "Attempting to start D5 $recording_type $media_type Recording..."
    
        $postParams = @{recording_type = $recording_type; media_type = $media_type}
        Invoke-WebRequest -Uri http://localhost:36847/api/capture/start -Method POST -Body $postParams
        
        if($null -ne $time)
        {
            if ($time -gt 0)
            {
                for ($t = $time -as [int]; $t -gt 0; $t--)
                {
                    Write-Output "D5 Recording will end $t seconds..."
                    Start-Sleep -Seconds 1
                }
    
                d5 'end' $time $media_type $recording_type
            }
        }
    }

    elseif ($cmd -eq "cont")
    {
        while($true)
        {
            $sec = Get-Random -Maximum 100

            if ($sec -lt 1)
            {
                $sec = 1000
            }
            elseif ($sec -lt 2) {
                $sec = 600
            }
            elseif ($sec -lt 3) {
                $sec = 500
            }
            elseif ($sec -lt 4) {
                $sec = 200
            }
            elseif ($sec -lt 10) {
                $sec = 120
            }
            elseif ($sec -gt 60) {
                $sec = 15
            }

            Write-Output "Starting continuous record for $sec."
            d5 "rec" $sec $media_type $recording_type
            
            # Start-Sleep -Seconds $sec
            Write-Output "Will start another recording in 5 seconds..."
            Start-Sleep -Seconds 5
        }
    }

    elseif ($cmd -eq 'folder')
    {
        Set-Location "C:\Users\JonathanBuchner\AppData\Roaming\Envision Telephony\D4"  
    }

    elseif ($cmd -eq 'tag')
    {
        $tagname = Read-Host -Prompt "Tag name"
        $tagvalue = Read-Host -Prompt "Tag value"

        $postParams = @{$tagname = $tagvalue};
        Invoke-WebRequest -Uri http://localhost:36847/api/tagging/set -Method POST -Body $postParams
    }

    elseif ($cmd -eq 'who')
    {
        Write-Output "Looking up D5 registry values ..."
        
        try 
        {
            $d5user = Get-ItemProperty -Path "HKCU:\Software\Envision Telephony\Envision D4\D4" -Name "C2cLogin"
            $d5uploadPath = Get-ItemProperty -Path "HKCU:\Software\Envision Telephony\Envision D4\D4" -Name "UploadPath"
            $d5Domain = Get-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Envision Telephony\Envision D4\D4" -Name "Domain"
            $d5AppId = Get-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Envision Telephony\Envision D4\D4" -Name "AppId"

            Write-Output " - User: $($d5User.C2cLogin)"
            Write-Output " - Domain: $($d5Domain.Domain)"
            Write-Output " - App id: $($d5AppId.AppId)"
            Write-Output " - Upload path: $($d5uploadPath.UploadPath)"
            Write-Output " - User registry: HKEY_CURRENT_USER\Software\Envision Telephony\Envision D4\D4";
            Write-Output " - User registry: HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Envision Telephony\Envision D4\D4";

        }
        catch
        {
            Write-Output "Cannot find values in regedit. Is D5 set up with a user logged in?"
        }
    }

    elseif ($cmd -eq 'reguser')
    {
        # Silently import the .reg file
        Start-Process -Wait -FilePath "regedit.exe" -ArgumentList "/s `"$($env:JB_DEVELOPER_PATH)\profile\scripts\reg\user.reg`""

        # Open regedit
        Start-Process -FilePath "regedit.exe"       
    }

    elseif($cmd -eq 'regmach')
    {
         # Silently import the .reg file
         Start-Process -Wait -FilePath "regedit.exe" -ArgumentList "/s `"$($env:JB_DEVELOPER_PATH)\profile\scripts\reg\machine.reg`""

         # Open regedit.  To open second window, must use runas and specify user.
         Start-Process -FilePath "regedit.exe"     
    }

    else
    {
        Write-Output "Do not recognize commad '$cmd.'"
    }
}

Set-Alias -Name target -Value Invoke-Build-Target
Function  Invoke-Build-Target ($target)
{
    if($target -eq "player")
    {
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$($env:JB_DEVELOPER_PATH)\profile\scripts\ant\player.bat`""
    }
    elseif ($target -eq "dal")
    {
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$($env:JB_DEVELOPER_PATH)\profile\scripts\ant\dal.bat`""
    }
    elseif ($target -eq "c2c")
    {
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$($env:JB_DEVELOPER_PATH)\profile\scripts\ant\c2c.bat`""
    }
    elseif ($target -eq "utils")
    {
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$($env:JB_DEVELOPER_PATH)\profile\scripts\ant\utils.bat`""
    }
    elseif ($target -eq "log")
    {
        code "C:\Source\Faraday\BuildLog.txt"
    }
    elseif ($target -eq "db")
    {
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$($env:JB_DEVELOPER_PATH)\profile\scripts\ant\db.bat`""
    }
    elseif ($target -eq "ce")
    {
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$($env:JB_DEVELOPER_PATH)\profile\scripts\ant\codeeditor.bat`""
    }
    elseif ($target -eq "dev")
    {
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$($env:JB_DEVELOPER_PATH)\profile\scripts\ant\shared.bat`""
    }
    elseif ($null -eq $target )
    {
        Write-Output "No build target provided."
        Write-Output "Targets: player, dal, c2c, utils, log, db, ce, dev"
        Write-Output "Do you want to copy:"
        Write-Output "C:\Source\ETSDK\trunk\ant\1.8.2\bin\ant.bat **TARGET** -DbuildNumber=1245 -DMAJOR=12 -DMINOR=0 -DRELEASE=1"
    }
    else 
    {
        Write-Output "Target '$target' not recognized."
    }
}

Set-Alias -Name acc -Value Invoke-Account-List

Function Invoke-Account-List
{
    $contents = Get-Content -Path "C:\Program Files (x86)\Envision Telephony\accounts.md"

    Write-Output $contents [$i]
}

Set-Alias -Name guid -Value Invoke-Create-Guid

Function Invoke-Create-Guid
{
    [guid]::NewGuid()
}



## Start at open
Open-PowerShell