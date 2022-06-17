function setup-now{
    <#
    .SYNOPSIS
    Setup New Computer

    .DESCRIPTION
    This is the first command that should be run on a new computer when it arrives.
    This command does the following:
    #1 Set time zone to UTC
    #2 Create new admin user and home directory
    #3 Enable RDP Access
    #4 Disable Automatic updates
    #5 Windows up to date
    #6 Returns completion status
    
    .EXAMPLE
    setup-now

    This runs the command and will ask to display any errors that occured
    #>

    setup-Time
    setup-Admin
    setup-RDP
    setup-AutoOff
    setup-Errors
    }

function setup-Time{

    Set-TimeZone -Id "UTC"
<#https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-timezone?view=powershell-7.2#>
}

function setup-Admin{

    net user NewAdmin password123 /Add /expires:never
    net localgroup Administrators NewAdmin /Add
    net localgroup Users NewAdmin /delete
    md C:\Users\NewAdmin
<#reused code I had from previous script#>
}

function setup-RDP{

    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
    Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
<#https://pureinfotech.com/enable-remote-desktop-powershell-windows-10/#>
}

function setup-AutoOff{

    sc.exe config wuauserv start= disabled
    sc.exe stop wuauserv
    sc.exe start wuauserv
<#https://nucuta.com/how-to-disable-automatic-updates-on-windows-10/#>
}

function setup-Errors{
    <#
.SYNOPSIS
Show errors to user.

.DESCRIPTION
This function opens the script error log in notepad.
#>

#get the number of errors that occured
$numErrors = $error.count

#show error count
Write-Output -InputObject "There were $numErrors errors"

$openNotepad = Read-Host "Would you like to view the errors? (y/n)"

if ($openNotepad -like "*y*")
    {
    $error|Out-File "$PSScriptRoot\error.txt"
    notepad "$PSScriptRoot\error.txt"|Out-Null
    Remove-Item "$PSScriptRoot\error.txt"
    }
else
    {
    }
}